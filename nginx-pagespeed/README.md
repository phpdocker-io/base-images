# PHPDocker.io - nginx with pagespeed container image

This is a container image for the newest available mainline version of nginx and its pagespeed module.

Documentation of pagespeed specific config: [https://www.modpagespeed.com/doc/configuration](https://www.modpagespeed.com/doc/configuration)

The official image [https://hub.docker.com/r/pagespeed/nginx-pagespeed](https://hub.docker.com/r/pagespeed/nginx-pagespeed) is abandoned and of course it runs a very old and unpatched version of both nginx, its base OS and the pagespeed module itself.

This image uses the official installer script to install it into Ubuntu Focal (debian as base results in fatter image sizes) then proceeds to compile nginx with pagespeed support using the same flags Ubuntu Focal's own nginx uses.

The user, entrypoint & folder setup have been lifted straight from nginx's debian base image Dockerfile.
