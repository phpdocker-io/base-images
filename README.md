# PHPDocker.io base images

Repository of base images for [PHPDocker.io](http://phpdocker.io) generated environments.

Images are [built daily](https://github.com/phpdocker-io/base-images/actions/workflows/docker-build.yaml) in order to
fetch the latest base image changes as well as available php versions.

## PHP

### Supported architectures

* `linux/amd64`
* `linux/arm64`
* `linux/arm/v7`

### OS Base images & PHP Package Sources

All images use an Ubuntu LTS release as base image, except for PHP5.6 which uses Debian Jessie. For each of these base
OS images, we use a third party source for the PHP packages - these packages come from
[Ondřej Surý](https://github.com/oerdnj/deb.sury.org) who is the official maintainer for PHP in Debian which is the
origin of all packages in Ubuntu.

In most cases, we override Ubuntu's PHP packages with Ondřej's to ensure we always have the very latest. For instance,
Ubuntu 20.04 comes with php 7.4.3 but we still install Ondřej's packages to ensure you get the absolutest latest version
of php 7.4 every time. Ubuntu backport security fixes, but not necessarily bugfixes from later patch releases.

### Image types

For each minor PHP version (`MAJOR.MINOR`) we have a `cli` and an `fpm` variant. These two are identical, except for the
fact the `fpm` contains `php-fpm` and their default command is of course `php-fpm`.

The images do not define an `ENTRYPOINT`, instead they define a `CMD` - this is to make it easier for you to define your
own entrypoint that does stuff before running the `CMD`.

#### Note on `swoole` variants
We also used to offer a `swoole` variant on some images. We have phased these out, as the images were created before we
could reliably install the extension via `apt` and we had to compile it from source. It is now available as an
`apt` package and all you need to do is install it.

### Built-in php extensions

* apcu & apcu-bc
* curl
* json (from 8.0, part of php core)
* mbstring
* opcache
* readline
* xml
* zip

These are the minimum extensions I consider necessary for any modern PHP app. They're required by the likes
of `composer`, the `symfony/*` libraries etc.

### Composer

All images use the composer v2. If for whatever reason you need to roll back to v1, add the following to your Dockerfile

```Dockerfile
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer
```

### Available images:

**Notes:**

| PHP <br> version | Images                                                   | OS base       | PHP EOL date  | Daily builds |
|------------------|----------------------------------------------------------|---------------|---------------|--------------|
| 8.4              | `phpdockerio/php:8.4-cli` <br> `phpdockerio/php:8.4-fpm` | Ubuntu 24.04  | ✔ 31 Nov 2028 | ✔            |
| 8.3              | `phpdockerio/php:8.3-cli` <br> `phpdockerio/php:8.3-fpm` | Ubuntu 22.04  | ✔ 31 Nov 2027 | ✔            |
| 8.2              | `phpdockerio/php:8.2-cli` <br> `phpdockerio/php:8.2-fpm` | Ubuntu 22.04  | ✔ 31 Dec 2026 | ✔            |
| 8.1              | `phpdockerio/php:8.1-cli` <br> `phpdockerio/php:8.1-fpm` | Ubuntu 22.04  | ✔ 31 Dec 2025 | ✔            |
| 8.0              | `phpdockerio/php:8.0-cli` <br> `phpdockerio/php:8.0-fpm` | Ubuntu 20.04  | ❌ 26 Nov 2023 | ✔            |
| 7.4              | `phpdockerio/php:7.4-cli` <br> `phpdockerio/php:7.4-fpm` | Ubuntu 20.04  | ❌ 28 Nov 2022 | ✔            |
| 7.3              | `phpdockerio/php73-cli`   <br> `phpdockerio/php73-cli`   | Ubuntu 18.04  | ❌ 06 Dec 2021 | ❌            |
| 7.2              | `phpdockerio/php72-cli`   <br> `phpdockerio/php72-cli`   | Ubuntu 18.04  | ❌ 30 Nov 2020 | ❌            |
| 7.1              | `phpdockerio/php71-cli`   <br> `phpdockerio/php71-fpm`   | Ubuntu 16.04  | ❌ 01 Dec 2019 | ❌            |
| 7.0              | `phpdockerio/php70-cli`   <br> `phpdockerio/php70-fpm`   | Ubuntu 16.04  | ❌ 10 Jan 2019 | ❌            |
| 5.6              | `phpdockerio/php56-cli`   <br> `phpdockerio/php56-fpm`   | Debian Jessie | ❌ 31 Dec 2018 | ❌            |

* Versions past EOL (end of life) are unsupported, but may still get daily builds to ensure the underlying OS packages
  are up to date.
* Daily builds are turned off for versions that run on an OS base that's also EOL (for instance, Ubuntu 18.04).
* Daily builds are kept for PHP versions that have reached EOL but the base OS has not - the base OS still receives
  security updates.
* In general, do not use any unsupported images in a production environment, regardless of whether daily builds are
  still enabled. I continue to build these for absolute holdouts that haven't been able to upgrade on time.
* Old images are kept in docker hub in the interest of enabling legacy apps to run. Docker does delete images that
  haven't been accessed for 6 months. If this happens, I won't be restoring them - you'll need to upgrade.
