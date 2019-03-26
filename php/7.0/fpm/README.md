PHPDocker.io - PHP 7.0 / FPM container image
=============================================

Debian Jessie PHP 7.0 FPM container image for [PHPDocker.io](http://phpdocker.io) projects.

Smaller in size than PHP's official container (190MB vs 501MB) plus you don't need to install any build dependencies let alone compile anything, Dotdeb already ship binaries for the vast majority, if not all, of PHP extensions available on PHP7.

*Note on logging:* configure your application to stream logs into `php://stdout`. That's it. We do some trickery to remove FPM's `[pool www] child xxx said into stderr` messages from stdout when an app outputs to it.
