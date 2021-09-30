# PHPDocker.io - NGINX with PageSpeed container image

This is a container image for the newest available mainline version of NGINX and its PageSpeed module. This image is [built daily](https://ci.auronconsulting.co.uk/teams/main/pipelines/phpdocker-base-images/jobs/nginx-pagespeed) to ensure we always have the newest available versions for both.

The official image [https://hub.docker.com/r/pagespeed/nginx-pagespeed](https://hub.docker.com/r/pagespeed/nginx-pagespeed) is abandoned and of course it runs a very old and unpatched version of both nginx, its base OS and the PageSpeed module itself.

This image uses the official installer script to install it into Ubuntu Focal (debian as base results in fatter image sizes) then proceeds to compile NGINX with PageSpeed support using the same flags Ubuntu Focal's own NGINX uses. It peruses nginx's official image's entrypoint and base config.

## Contributing

Any issues or PRs please open them here: [https://github.com/phpdocker-io/base-images](https://github.com/phpdocker-io/base-images)

## PageSpeed configuration

Documentation of PageSpeed specific config: [https://www.modpagespeed.com/doc/configuration](https://www.modpagespeed.com/doc/configuration)

## Adding your own config to nginx

Make sure you add your .conf files to `/etc/nginx/conf.d/`. They'll be automagically picked up.

## System NGINX packages

The version of NGINX on this image is compiled from the latest mainline sources. Therefore, all of the base OS packages available are incompatible with it and will cause issues if installed. To avoid confusion, all of the system's apt packages for nginx have been disabled for installation - you won't be able to do `apt install nginx` for instance.

NGINX has been compiled with all modules Ubuntu includes by default - see the [Dockerfile](Dockerfile) for the full list. Please open a PR or an issue if there's a module that you'd like to install that isn't there.
