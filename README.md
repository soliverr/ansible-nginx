# ansible-nginx

## Description

A role to deploy nginx

## Requirements

* CentOS 7
* Ubuntu Trusty


## Role Variables

* ``nginx_worker_processes``: Amount of nginx worker processes (int, default: "{{ ansible_processor_vcpus }}" )
* ``nginx_worker_connections``: Amount of nginx worker connections (int, default 768)
* ``nginx_user``: Nginx user (string, default: CentOS 7: nginx, Ubuntu: www-data)
* ``nginxconf_template``: Template to use for nginx.conf(string, default: builtin_nginx.conf.j2)
* ``nginx_ssl_protocols``: SSL protocols to support (string, default: TLSv1.1 TLSv1.2)
* ``nginx_ssl_cipher_suite``: SSL cipher suites to support (string, default is in defaults/main.yml)
* ``tlsparams_template``: Template to use for tls_params (string, default: builtin_tls_params.j2)

### nginx_vhosts

This role allows to deploy vhosts using the ``nginx_vhosts`` list variable.

There are two approaches to this. The first one is to pass a templates to the role:

    nginx_vhosts:
      - servername: myveryownhost.example.com
        template: mytemplate.j2
        myowntemplatevariable: True

The above specified ``myowntemplatevariable`` is not mandatory. It may be accessed
from the template by using ``{{ item.myowntemplatevariable }}``.

The second approach is to use the provided ``builtin_rproy.j2`` template which is
a standard reverse proxy with a HTTP 302 redirect to HTTPS for all HTTP requests.

Below is a sample ``nginx_vhosts`` with all possible options.

    nginx_vhosts:
      - servername: reverseproxy.example.com
        sslcert: mycert.pem
        sslkey:  mykey.key
        upstreamserver: backend.example.com
        https_port: 90001                       #default: 443
        http_port: 9000                         #default: 80
        sslcertbasepath: /certs                 #default: Debian: ``/etc/ssl/certs`` CentOS: ``/etc/pki/tls/certs``
        sslkeybasepath: /keys                   #default: Debian: ``/etc/ssl/private`` CentOS: ``/etc/pki/tls/private``
        maxbodysize: 0                          #default: 10m
        upstreamserverproto: https              #default: http

### nginx_default_sslkeycert

In case you use a wildcard certificate which should be used for all vhosts and
you dont want to specifiy it repteatedly for each list entry, you can declare it like this:

    nginx_default_sslkeycert
      - sslcert: wildcard.pem
        sslkey: wildcard.key
        sslcertbasepath: /certs                 #default: Debian: ``/etc/ssl/certs`` CentOS: ``/etc/pki/tls/certs``
        sslkeybasepath: /keys                   #default: Debian: ``/etc/ssl/private`` CentOS: ``/etc/pki/tls/private``

## Example Playbook

    - hosts: all
      roles:
         - { role: ansible-nginx }

## Contributing

If you want to contribute to this repository please be aware that this
project uses a [gitflow](http://nvie.com/posts/a-successful-git-branching-model/)
workflow with the next release branch called ``next``.

Please fork this repository and create a local branch split off of the ``next``
branch and create pull requests back to the origin ``next`` branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE Version 3

## Integration testing

This role provides integration tests using the Ruby RSpec/serverspec framework
with a few drawbacks at the time of writing this documentation.

Running integration tests requires a number of dependencies being
installed. As this role uses Ruby RSpec there is the need to have
Ruby with rake and bundler available.

    # install role specific dependencies with bundler
    bundle install

<!-- -->

    # run the complete test suite with Docker
    rake suite

<!-- -->

    # run the complete test suite with Vagrant
    source  envvars-vagrant.sample
    rake suite

    # run the complete test suite with Vagrant without destroying the box afterwards
    source  envvars-vagrant.sample
    RAKE_ANSIBLE_VAGRANT_DONT_CLEANUP=1 rake suite


## Author information

Alvaro Aleman @aleman silpion.de


<!-- vim: set nofen ts=4 sw=4 et: -->
