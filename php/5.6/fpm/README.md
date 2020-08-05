PHPDocker.io - PHP 5.6 / FPM container
======================================

## DEPRECATED

This image is now deprecated and not built daily due to EOL reached on both PHP and the
base image OS (Debian Jessie).

**Do not use in production**

Debian Jessie PHP 5.6 / FPM container for [PHPDocker.io](http://phpdocker.io) projects.

Smaller in size than PHP's official container (200MB vs 460MB) plus you don't need to install any build dependencies let alone compile anything, Debian Jessie already ships binaries for the vast majority, if not all, of PHP extensions.

*Note on logging:* configure your application to stream logs into `php://stdout`. That's it.
