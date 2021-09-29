# PHPDocker.io - nginx with PageSpeed container image

This is a container image for the newest available mainline version of nginx and its PageSpeed module. This image is [built daily](https://ci.auronconsulting.co.uk/teams/main/pipelines/phpdocker-base-images/jobs/nginx-pagespeed) to ensure we always have the newest available versions for both.

The official image [https://hub.docker.com/r/pagespeed/nginx-pagespeed](https://hub.docker.com/r/pagespeed/nginx-pagespeed) is abandoned and of course it runs a very old and unpatched version of both nginx, its base OS and the PageSpeed module itself.

This image uses the official installer script to install it into Ubuntu Focal (debian as base results in fatter image sizes) then proceeds to compile nginx with PageSpeed support using the same flags Ubuntu Focal's own nginx uses. It peruses nginx's official image's entrypoint and base config.

## PageSpeed configuration

Documentation of PageSpeed specific config: [https://www.modpagespeed.com/doc/configuration](https://www.modpagespeed.com/doc/configuration)

## Adding your own config to nginx

Make sure you add your .conf files to `/etc/nginx/conf.d/`. They'll be automagically picked up.
