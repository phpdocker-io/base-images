PHPDocker.io base images
========================

Repository of base images for [PHPDocker.io](http://phpdocker.io) generated environments.

Images are [built daily](https://ci.auronconsulting.co.uk/teams/main/pipelines/phpdocker-base-images) in order to fetch the latest base image changes as well as available php versions.

### Available images:

Please note, PHP <= 7.1 are now past EOL (End Of Life) and as such are unsupported.

Images without daily builds are still available in docker hub in the interest of allowing legacy apps to be run, but these images should never be used in a production environment and you should consider upgrading to the latest available PHP version.


| PHP version  | CLI image | FPM image | Source | Supported? | Daily builds? |
| ------------ | --------- |---------- |------- |----------- |-------------- |
| 7.4 (swoole) | `phpdockerio/php74-swoole` | n/a | Swoole sources | ❌ | ✔ |
| 7.4 | `phpdockerio/php74-cli` | `phpdockerio/php74-cli` | Ubuntu 20.04 + Ondřej Surý ppa | ✔ | ✔ |
| 7.3 | `phpdockerio/php73-cli` | `phpdockerio/php73-cli` | Ubuntu 18.04 + Ondřej Surý ppa | ✔ | ✔ |
| 7.2 | `phpdockerio/php72-cli` | `phpdockerio/php72-cli` | Ubuntu 18.04 + Ondřej Surý ppa | ✔ | ✔ |
| 7.1 | `phpdockerio/php71-cli` | `phpdockerio/php71-cli` | Ubuntu 16.04 + Ondřej Surý ppa | ❌ | ✔ |
| 7.0 | `phpdockerio/php70-cli` | `phpdockerio/php70-cli` | Ubuntu 16.04 | ❌ | ✔ |
| 5.6 | `phpdockerio/php56-cli` | `phpdockerio/php56-cli` | Debian Jessie | ❌ | ❌ |
