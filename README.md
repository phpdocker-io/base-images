PHPDocker.io base images
========================

Repository of base images for [PHPDocker.io](http://phpdocker.io) generated environments.

Images are [built daily](https://ci.auronconsulting.co.uk/teams/main/pipelines/phpdocker-base-images) in order to fetch the latest base image changes as well as available php versions.

### Available images:

Notes:

* Unsupported versions are past PHP EOL (End of Life)
* Daily builds are turned off for versions that run on an OS base that's also EOL (for instance, Debian Jessie)
* Daily builds are kept for PHP versions that have reached EOL but the base OS has not - the base OS still receives security updates, including the PHP runtime.
* In general, do not use any unsupported images in a production environment, regardless of whether daily builds are still enabled
* Old images are kept in docker hub in the interest of enabling legacy apps to run


| PHP version  | CLI image | FPM image | Source | Supported / Daily builds? |
| ------------ | --------- |---------- |------- |-------------------------- |
| 7.4 (swoole) | `phpdockerio/php74-swoole` | n/a | Swoole sources | ✔ / ✔ |
| 7.4 | `phpdockerio/php74-cli` | `phpdockerio/php74-cli` | Ubuntu 20.04 + Ondřej Surý ppa | ✔ / ✔ |
| 7.3 | `phpdockerio/php73-cli` | `phpdockerio/php73-cli` | Ubuntu 18.04 + Ondřej Surý ppa | ✔ / ✔ |
| 7.2 | `phpdockerio/php72-cli` | `phpdockerio/php72-cli` | Ubuntu 18.04 + Ondřej Surý ppa | ✔ / ✔ |
| 7.1 | `phpdockerio/php71-cli` | `phpdockerio/php71-cli` | Ubuntu 16.04 + Ondřej Surý ppa | ❌ / ✔ |
| 7.0 | `phpdockerio/php70-cli` | `phpdockerio/php70-cli` | Ubuntu 16.04 | ❌ / ✔ |
| 5.6 | `phpdockerio/php56-cli` | `phpdockerio/php56-cli` | Debian Jessie | ❌ / ❌ |
