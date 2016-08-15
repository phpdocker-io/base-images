PHPDocker.io - PHP 7.1 / CLI container image
=============================================

Debian Jessie PHP 7.1 FPM container image for [PHPDocker.io](http://phpdocker.io) projects. Packages are provided by [Ondřej Surý](https://launchpad.net/~ondrej).

**Notes:** 

  * ***Do not use in production!*** PHP 7.1 itself is currently in beta, and packages installed on this image are from Ubuntu Wily (not Debian Jessie).
  * Preinstalled extensions: 
    * php7.1-cli 
    * php7.1-curl
    * php7.1-json 
    * php7.1-mcrypt 
    * php7.1-opcache 
    * php7.1-readline 
    * php7.1-xml 
    * php7.1-zip
  * The range of available extensions is very short at this point. Installable extensions:
    * *php-yaml* - YAML-1.1 parser and emitter for PHP
    * *php-ssh2* - Bindings for the libssh2 library
    * *php-memcached* - memcached extension module for PHP, uses libmemcached
    * *php-igbinary* - igbinary PHP serializer
    * *php-msgpack* - PHP extension for interfacing with MessagePack
    * *php-libsodium* - PHP wrapper for the Sodium cryptographic library
    * *php-raphf* - raphf module for PHP
    * *php-gearman* - PHP wrapper to libgearman
    * *php7.1-cgi* - server-side, HTML-embedded scripting language (CGI binary)
    * *php7.1-cli* - command-line interpreter for the PHP scripting language
    * *php7.1-fpm* - server-side, HTML-embedded scripting language (FPM-CGI binary)
    * *php7.1-phpdbg* - server-side, HTML-embedded scripting language (PHPDBG binary)
    * *php7.1-bcmath* - Bcmath module for PHP
    * *php7.1-bz2* - bzip2 module for PHP
    * *php7.1-common* - documentation, examples and common module for PHP
    * *php7.1-curl* - CURL module for PHP
    * *php7.1-dba* - DBA module for PHP
    * *php7.1-enchant* - Enchant module for PHP
    * *php7.1-gd* - GD module for PHP
    * *php7.1-gmp* - GMP module for PHP
    * *php7.1-imap* - IMAP module for PHP
    * *php7.1-interbase* - Interbase module for PHP
    * *php7.1-intl* - Internationalisation module for PHP
    * *php7.1-json* - JSON module for PHP
    * *php7.1-ldap* - LDAP module for PHP
    * *php7.1-mbstring* - MBSTRING module for PHP
    * *php7.1-mcrypt* - libmcrypt module for PHP
    * *php7.1-mysql* - MySQL module for PHP
    * *php7.1-odbc* - ODBC module for PHP
    * *php7.1-opcache* - Zend OpCache module for PHP
    * *php7.1-pgsql* - PostgreSQL module for PHP
    * *php7.1-pspell* - pspell module for PHP
    * *php7.1-readline* - readline module for PHP
    * *php7.1-recode* - recode module for PHP
    * *php7.1-snmp* - SNMP module for PHP
    * *php7.1-soap* - SOAP module for PHP
    * *php7.1-sqlite3* - SQLite3 module for PHP
    * *php7.1-sybase* - Sybase module for PHP
    * *php7.1-tidy* - tidy module for PHP
    * *php7.1-xml* - DOM, SimpleXML, WDDX, XML, and XSL module for PHP
    * *php7.1-xmlrpc* - XMLRPC-EPI module for PHP
    * *php7.1-zip* - Zip module for PHP
    * *php7.1-xsl* - XSL module for PHP (dummy)

Smaller in size than PHP's official container (170MB vs 501MB) plus you don't need to install any build dependencies let alone compile anything, Dotdeb already ship binaries for the vast majority, if not all, of PHP extensions available on PHP7.
