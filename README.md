# PHPDocker.io base images

Repository of base images for [PHPDocker.io](http://phpdocker.io) generated environments.

Images are [built daily](https://github.com/phpdocker-io/base-images/actions/workflows/docker-build.yaml) in order to fetch the latest base image changes as well as available php versions.

## NGINX with PageSpeed
More info on its own [readme](nginx-pagespeed/README.md)

## PHP

### Note: changes to PHP image locations at docker hub

As of end of Nov 2021, container images for php version **7.2 onwards** are pushed into the same docker hub repository, 
and we'll be conveying the specific versions via tags. Instead of having different container repositories, one per 
version variant, with always the `latest` tag.

In order to avoid breaking existing setups, we'll continue pushing the same build to the old locations, in addition to 
the new one. We'll do this until they go EOL and we stop building them at all.

Starting with php 8.1, we'll only publish to the new location.

Example:

| Before                            | Now                            |
| --------------------------------- | ------------------------------ |
| n/a                               | `phpdockerio/php:8.1-fpm`      |
| `phpdockerio/php80-cli:latest`    | `phpdockerio/php:8.0-cli`      |
| `phpdockerio/php74-swoole:latest` | `phpdockerio/php:7.4-swoole`   |
| `phpdockerio/php71-cli:latest`    | `phpdockerio/php71-cli:latest` |

``
### Supported architectures
* `linux/amd64`
* `linux/arm64`
* `linux/arm/v7`

### OS Base images & PHP Package Sources

All images use an Ubuntu LTS release as base image, except for PHP5.6 which uses Debian Jessie. For each of these
base OS images, we use a third party source for the PHP packages - these packages come from
[Ondřej Surý](https://github.com/oerdnj/deb.sury.org) who is the official maintainer for PHP in Debian which is the
origin of all packages in Ubuntu.

In most cases, we override Ubuntu's PHP packages with Ondřej's to ensure we always have the very latest. For instance,
Ubuntu 20.04 comes with php 7.4.3 but we still install Ondřej's packages to ensure you get the absolutest latest version
of php 7.4 every time. Ubuntu backport security fixes, but not necessarily bugfixes from later patch releases.

### Image types

For each minor PHP version (`MAJOR.MINOR`) we have a `cli` and an `fpm` variant. These two are identical,
except for the fact the `fpm` contains `php-fpm` and their default command is of course `php-fpm`.

We're using `CMD` instead of `ENTRYPOINT` because I don't want to dictate how you use these images. If I were to set an
`ENTRYPOINT` you would not be able to easily open a bash shell into either container using `docker run` or `docker exec` or
docker-compose equivalent without you needing to re-build the container.

We also offer a `swoole` variant on some images. We'll be phasing these out, as the images were created before we
could reliably install the extension via `apt` and we had to compile it from source. It is now available as an
`apt` package and all you need to do is install it.

### Built-in php extensions

Each image contain the extensions below. Some versions of PHP have the same functionality in core - for instance, `json`
is part of core PHP in php 8+:
  * APCu & APCu-bc
  * cURL
  * JSON (from 8.0, part of php core)
  * MBString
  * MCrypt (php <= 7.0)
  * OPCache
  * ReadLine
  * Sodium (from 7.1; from 7.2, part of php core)
  * XML
  * ZIP

These are the minimum extensions I consider necessary for any modern PHP app. They're required by the likes of `composer`,
the `symfony/*` libraries etc.

### Composer

All images use the composer v2. If for whatever reason you need to roll back to v1, add the following to your Dockerfile

```Dockerfile
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer
```

### Available images:

**Notes:**

* Unsupported versions are past PHP EOL (End of Life)
* Daily builds are turned off for versions that run on an OS base that's also EOL (for instance, Debian Jessie)
* Daily builds are kept for PHP versions that have reached EOL but the base OS has not - the base OS still receives security updates, including the PHP runtime.
* In general, do not use any unsupported images in a production environment, regardless of whether daily builds are still enabled
* Old images are kept in docker hub in the interest of enabling legacy apps to run
* Also, old images could potentially be deleted by Docker Hub if they go unused for a certain period of time - if this happens, they won't be restored and you need to upgrade.
* Ondřej Surý is PHP's package maintainer in Debian. His Ubuntu PPA allows us to have more up to date packages beyond those provided by the base image OS.

| PHP version  | CLI image                    | FPM image                 | Source                         | Supported | Daily builds? |
| ------------ | ---------------------------- | ------------------------- | ------------------------------ | --------- | ------------- |
| 8.0 (swoole) | `phpdockerio/php:8.0-swoole` | n/a                       | Ubuntu 20.04 + Ondřej Surý ppa | ✔         | ✔             |
| 8.0          | `phpdockerio/php:8.0-cli`    | `phpdockerio/php:8.0-fpm` | Ubuntu 20.04 + Ondřej Surý ppa | ✔         | ✔             |
| 7.4 (swoole) | `phpdockerio/php:7.4-swoole` | n/a                       | Ubuntu 20.04 + Ondřej Surý ppa | ✔         | ✔             |
| 7.4          | `phpdockerio/php:7.4-cli`    | `phpdockerio/php:7.4-fpm` | Ubuntu 20.04 + Ondřej Surý ppa | ✔         | ✔             |
| 7.3          | `phpdockerio/php:7.3-cli`    | `phpdockerio/php:7.3-fpm` | Ubuntu 18.04 + Ondřej Surý ppa | ✔         | ✔             |
| 7.2          | `phpdockerio/php:7.2-cli`    | `phpdockerio/php:7.2-fpm` | Ubuntu 18.04 + Ondřej Surý ppa | ❌        | ✔             |
| 7.1          | `phpdockerio/php71-cli`      | `phpdockerio/php71-fpm`   | Ubuntu 16.04 + Ondřej Surý ppa | ❌        | ❌            |
| 7.0          | `phpdockerio/php70-cli`      | `phpdockerio/php70-fpm`   | Ubuntu 16.04                   | ❌        | ❌            |
| 5.6          | `phpdockerio/php56-cli`      | `phpdockerio/php56-fpm`   | Debian Jessie                  | ❌        | ❌            |
