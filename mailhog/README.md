PHPDocker.io - Mailhog container
==================================

Alpine based Mailhog container for [PHPDocker.io](http://phpdocker.io) projects.

Forked from https://github.com/diyan/mailhog-docker.

# How to use this image

Print help:

```bash
docker run --rm diyan/mailhog --help
```
Run MailHog:

```bash
docker run -d --name=mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  diyan/mailhog
```
Access to Web UI using your browser:

```bash
firefox http://localhost:8025
```
