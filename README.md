andrewrothstein.summon
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-summon.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-summon)

Installs CyberArk's [summon](https://cyberark.github.io/summon)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.summon
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
