# PHPDocker.io - PHP 8.0 / CLI, FPM and Swoole container images

Ubuntu 20.04 PHP 8.0 CLI and FPM container images for [PHPDocker.io](http://phpdocker.io) projects. Packages are provided by [Ondřej Surý](https://deb.sury.org/).

Far smaller in size than PHP's official container. No need to compile any extensions: simply run `apt-get install php8.0-EXTENSION_NAME` as part of your Dockerfile

*Note on logging:* configure your application to stream logs into `php://stdout`. That's it.

## About swoole

Swoole version is not configurable. We always provide the latest available via Ondrej's PPA to this version of PHP.

### Usage

First, configure your swoole front controller, take note of the port you're starting the server on. For instance:

```php
<?php
/**
 * /app/index.php
 */

$http = new swoole_http_server("0.0.0.0", 8101);

$http->on("start", function ($server) {
    echo "Swoole http server is started at http://127.0.0.1:8101\n";
});

$http->on("request", function ($request, $response) {
    $response->header("Content-Type", "text/plain");
    $response->end("Hello World\n");
});

$http->start();
```

Second, run the container:

```bash
docker run --rm -t -p 8101:8101 -v $(pwd):/app phpdockerio/php74-swoole php /app/index.php
```
