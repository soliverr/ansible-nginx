# ansible-nginx

## Description

A role to deploy nginx

## Requirements

* CentOS 7
* Ubuntu Trusty


## Role Variables

* ``nginx_worker_processes``: Amount of nginx worker processes (int, default: "{{ ansible_processor_vcpus }}" )
* ``nginx_worker_connections``: Amount of nginx worker connections (int, default 768)
* ``nginx_user``: The nginx user (string, default: CentOS 7: nginx, Ubuntu: www-data)
* ``nginxconf_template``: The nginx.conf template to use (string, default: builtin_nginx.conf.j2)

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
