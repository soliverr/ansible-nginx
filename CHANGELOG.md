# 1.1.1

Mark Kusch (1):

* Really support RHEL-7

# 1.1.0

Alvaro Aleman (1):

* Fixed ansible-util epel fact name

Mark Kusch (1):

* Allow role to run on RHEL-7

# 1.0.0

Alvaro Aleman (16):

* Root commit (ansible-generator)
* Added Installation, nginx.conf, service enablement
* added tls_params
* Added vhost configuration
* Added nginx_default_sslkeycert to allow defining a global default cert and key
* LICENSE fixed
* Added task to remove default vhost
* README formatting fixed up
* init
* Removed SSL cert tasks since they are not directly related to nginx
* typo, README.md updated
* Added ipv6 option
* Adjusted testplaybook to work with EL7
* Added nginx_server_names_hash_bucket_size directive
* epel check added
* tdd funcionality updated

Mark Kusch (14):

* Add "ansible_managed"/flaming sheep to templates, fix whitespace/indentation
* Update variable documentation
* Manage supported platforms with vars
* Mock util template cow variable for test playbook
* Rename variable to suffix boolean operation
* Use complex args style module invocation
* Fix service handler notifications
* Fix service handler names according to notifications
* Fix syntax errors in default rproxy template
* Fix whitespace/indentation
* Do not listen ssl; on http
* Update apt package cache only on ansible_os_family == "Debian"
* Make apt cache configurable with util variable
* Add vagrant environment to test with CentOS 7

# 0.0.1

* Initial commit


<!-- vim: set nofen ts=4 sw=4 et: -->
