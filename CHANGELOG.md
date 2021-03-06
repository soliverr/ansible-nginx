# 2.2.0


* Update Ansible Galaxy info
* Add support for Ubuntu Xenial
* Dont set lib_action_become_enable
* Fix typo in README
* Use uri module to test htpasswd
* Fix dependencys and dependency documentation
* Fix typo in README
* Use silpion.lib for variable inclusion
* Use silpion.lib for fact deployment
* Fix htpasswd tests
* Add silpion.lib dependency
* Only change owner of dhparam file if become is enabled
* Create a dhparam file by default
* Make certificate name default to servername
* Use role to deploy mime.types
* Fix htpasswd filename
* Use relative paths in builtin_rproxy template
* Avoid wrong include path in config only mode

Alvaro Aleman (18):
# 2.1.1


* Fix htpasswd functionality, add tests for it

Alvaro Aleman (1):
# 2.1.0
Alvaro Aleman (18):

* Add testcase for tlscert usage
* Try to use tlscert facts for sslcerts+keys
* Use tlscert\_changed to trigger service reload events
* Update README
* Enable ipv6 by default
* Add a seperate testplay for nginx without tlscert
* Use command: true instead of register to trigger handler
* Add tests for config only configuration
* Skip not required tasks when nginx\_config\_only
* Avoid Vagrant sync for centos/7 box
* Make become configurable
* Update readme
* Add a vhost to config\_only testplay
* Fixup "Notify reload nginx when tlscert\_changed" task
* Consistently stick to coding style
* Add nginx\_service\_allow\_{restart,reload} parameters
* Fix handler conditions
* Dont use bare variables in loops

Mark Kusch (1):

* Fix last occurence of bare variables in loops

# 2.0.1


* Add Ansible version dependency info
* Add support for websockets

Alvaro Aleman (2):
# 2.0.0

Anja Siek (6):

* add ssl true/false configuration
* add variable to configure upstreamport
* add local facts
* add optional server\_aliases for server configuration
* add option default\_server

# 1.4.1

Alvaro Aleman (1):

* Use selinuxenabled command for selinux state detection

# 1.4.0

Alvaro Aleman (2):

* s/util\_template\_use\_cow/nginx\_template\_use\_cow/g
* Enable the httpd\_can\_network\_connect sebool by default

Mark Kusch (2):

* Make SELinux detection a litte more reliable
* Re-run ansible-generator

# 1.3.0

Alvaro Aleman (1):

* Ensure a faulty config causes the role to fail

# 1.2.0

Alvaro Aleman (9):

* added nginx_ssl{cert,key}_basepath vars
* Add deploy htpasswd task
* Fix builtin_rproxy template to include htpasswd
* Add python-passlib dependency as it is needed for htpasswd
* Add port forwarding to Vagrantfile
* Fix htpasswd config in builtin_rproxy template
* Add a test for basic auth
* Update readme to include htpasswd description
* Fix code style

Ruslan Tumarkin (2):

* Add default variable keepalive_timeout
* Add proxy_read_timeout and fix https_port in proxy template

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
