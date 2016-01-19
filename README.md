# ansible-nginx

## Description

A role to deploy nginx

## Requirements

* CentOS 7 with epel enabled
* Ubuntu Trusty


## Role Variables

* ``nginx_epel_enabled``: Wether epel is enabled (boolean, default if available: ``{{ ansible_local.util.epel.enabled }}`` else: ``false``)
* ``nginx_worker_processes``: Amount of nginx worker processes (int, default: ``{{ ansible_processor_vcpus }}``)
* ``nginx_worker_connections``: Amount of nginx worker connections (int, default: ``768``)
* ``nginx_keepalive_timeout``: Sets a timeout during which a keep-alive client connection will stay open on the server side.  (int, default: ``65``)
* ``nginx_server_names_hash_bucket_size``: The nginx server_names_hash_bucket_size directive (int, default: ``64``)
* ``nginx_user``: Nginx service user (string, default: CentOS 7: ``nginx``, Ubuntu: ``www-data``)
* ``nginx_template_conf``: Template to use for nginx.conf (string, default: ``builtin_nginx.conf.j2``)
* ``nginx_ssl_enable``: Default enable ssl configuration (boolean, default: ``true``)
* ``nginx_ssl_protocols``: SSL protocols to support (string, default: ``TLSv1.1 TLSv1.2``)
* ``nginx_ssl_cipher_suite``: SSL cipher suites to support (string, default can be found in defaults/main.yml)
* ``nginx_sslcert_basepath``: The basepath for all sslcerts, will only be used if defined (string, default: ``undefined``)
* ``nginx_sslkey_basepath``: The basepath for all sslkeys, will only be used if defined (string, default: ``undefined``)
* ``nginx_template_params_tls``: Template to use for tls_params (string, default: ``builtin_tls_params.j2``)
* ``nginx_default_sslcert``: SSL cert to default to if not specified inside vhost (string, default: ``undefined``)
* ``nginx_default_sslkey``: SSL key to default to if not specified inside vhost (string, default: ``undefined``)
* ``nginx_ipv6_enable``: Whether to enable ipv6 listening (boolean, default: ``false``)
* ``nginx_vhosts``: Dictionary to configure nginx virtual hosts (dict, default: ``[]``)
* ``nginx_template_use_cow``: Whether to use Ansible cow instead of ``{{ ansible_managed}}`` as header in templates (string, default: ``util_template_use_cow|default(true)`` )
* ``nginx_httpd_can_network_connect``: Wheter to enable the ``httpd_can_network_connect`` SEBoolean (bool, default: ``true``)

### nginx_vhosts

This role allows to deploy vhosts using the ``nginx_vhosts`` list variable.

There are two approaches to this. The first one is to pass a templates to the role:

    nginx_vhosts:
      - servername: myveryownhost.example.com
        template: mytemplate.j2
        myowntemplatevariable: True

The above specified ``myowntemplatevariable`` is not mandatory. It may be accessed
from the template by using ``{{ item.myowntemplatevariable }}``.

The second approach is to use the provided ``builtin_rproxy.j2`` template which is
a standard reverse proxy with a HTTP 302 redirect to HTTPS for all HTTP requests.

Below is a sample ``nginx_vhosts`` with all possible options.

    nginx_vhosts:
      - servername: reverseproxy.example.com
        upstreamserver: backend.example.com:80  # The port may be left empty (mandatory)
        sslcert: /etc/pki/tls/certs/my.crt      # default: nginx_default_sslcert
        sslkey:  /etc/pki/tls/private/my.key    # default: nginx_default_sslkey
        https_port: 90001                       # default: 443
        http_port: 9000                         # default: 80
        ssl: false                              # default: nginx_ssl_enable
        maxbodysize: 0                          # default: 10m
        proxy_read_timeout: 300s                # default: 60s
        upstreamserverproto: https              # default: http
        upstreamport: 8080                      # default: omitted 
        htpasswd:                               # If omitted, htpasswd wont get configured
          - name: mybasicauthuser
            password: strongpass

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
