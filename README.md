PHPDocker.io base images
========================

Repository of base images for [PHPDocker.io](http://phpdocker.io) generated environments.

All images are [built daily](https://ci.auronconsulting.co.uk/teams/main/pipelines/phpdocker-base-images) in order to fetch the latest base image changes as well as available php versions.

### Currently supported PHP versions:

| PHP version | CLI image | FPM image | Source |
| -------------------------------------------- |

 * PHP 7.2: `phpdockerio/php72-cli` and `phpdockerio/php72-fpm` (Ubuntu 18.04 + ondrej ppa)
 * PHP 7.3: `phpdockerio/php73-cli` and `phpdockerio/php73-fpm` (Ubuntu 18.04 + ondrej ppa)
 * PHP 7.4: `phpdockerio/php74-cli` and `phpdockerio/php74-fpm` (Ubuntu 20.04 + ondrej ppa)
 * PHP 7.4 + swoole: `phpdockerio/php74-swoole` (Ubuntu 20.04 + ondrej ppa + Swoole built from source)

### Legacy versions (reached [PHP end of life](https://www.php.net/supported-versions.php)):

You should not use these images as they're well past their end of life. You can still pull them
off docker hub, but we aren't building them any more. 

These images still exist in docker hub, but we aren't building them periodically any more.

*DO NOT USE*

 * PHP 5.6 (debian jessie)
 * PHP 7.0 (Ubuntu 16.04)
 * PHP 7.1 (Ubuntu 16.04 + ondrej ppa)
