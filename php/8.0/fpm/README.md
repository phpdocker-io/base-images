PHPDocker.io - PHP 8.0 / FPM container image
=============================================

Ubuntu 20.04 PHP 8.0 FPM container image for [PHPDocker.io](http://phpdocker.io) projects. Packages are provided by [Ondřej Surý](https://deb.sury.org/).

Smaller in size than PHP's official container (160MB vs 404MB) plus you don't need to install any build dependencies let alone compile anything, Dotdeb already ship binaries for the vast majority, if not all, of PHP extensions available on PHP7.

*Note on logging:* configure your application to stream logs into `php://stdout`. That's it.
