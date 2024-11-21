# PHPDocker.io - PHP 8.4 / CLI, FPM and Swoole container images

Ubuntu 22.04 PHP 8.4 CLI and FPM container images for [PHPDocker.io](http://phpdocker.io) projects. Packages are provided by [Ondřej Surý](https://deb.sury.org/).

Far smaller in size than PHP's official container. No need to compile any extensions: simply run `apt-get install php8.4-EXTENSION_NAME` as part of your Dockerfile

*Note on logging:* configure your application to stream logs into `php://stdout`. That's it.
