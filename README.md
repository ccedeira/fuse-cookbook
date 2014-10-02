[![Build Status](https://travis-ci.org/psyreactor/fuse-cookbook.svg?branch=master)](https://travis-ci.org/psyreactor/fuse-cookbook)
Jboss Fuse Cookbook
===============

This cookbook install Jboss Fuse

####[Jboss Fuse](http://www.jboss.org/products/fuse/overview/)
JBoss Fuse is an open source Enterprise Service Bus (ESB) with an elastic footprint that supports integration beyond the data center. The ability to deploy JBoss Fuse in several different configurations enables intelligent integration to all facets of your business - on premise or in the Cloud.

Requirements
------------
java - Not managed by this cookbook
JBoss Fuse 6 Download the zip package from RHN and host on your own server

The following platforms and versions are tested and supported using Opscode's test-kitchen.

- CentOS 5.8, 6.3

The following platform families are supported in the code, and are assumed to work based on the successful testing on CentOS.


- Red Hat (rhel)
- Fedora
- Amazon Linux

Recipes
-------
#### fuse::default
##### Basic Config


<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fuse']['os']['user']</tt></td>
    <td>string</td>
    <td>OS User for fuse</td>
    <td><tt>fuse</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['os']['password']</tt></td>
    <td>string</td>
    <td>password of OS User for fuse</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['os']['group']</tt></td>
    <td>string</td>
    <td>group of OS User for fuse</td>
    <td><tt>fuse</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['filename']</tt></td>
    <td>string</td>
    <td>Jboss Fuse filename whitout extension</td>
    <td><tt>jboss-fuse-6.0.0.redhat-024</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['base']['url']</tt></td>
    <td>string</td>
    <td>url base for download Jboss Fuse</td>
    <td><tt>http://192.168.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['dir']</tt></td>
    <td>string</td>
    <td>Install base path</td>
    <td><tt>/opt</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['app']['user']</tt></td>
    <td>string</td>
    <td>Admin user for Jboss Fuse Console</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['app']['password']</tt></td>
    <td>string</td>
    <td>Password of admin user for Jboss Fuse Console</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['proxy']</tt></td>
    <td>string</td>
    <td>Proxy server</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['proxy_port']</tt></td>
    <td>string</td>
    <td>Proxy port server</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['fuse']['noproxy']</tt></td>
    <td>string</td>
    <td>Proxy exclution dirs</td>
    <td><tt>nil</tt></td>
  </tr>
</table>


## Usage
### fuse::default

Include `fuse` in your node's `run_list`:

```json
{
  "default_attributes": {
  "fuse": {
    "proxy": "192.168.1.1",
    "proxy_port": "3128",
    "noproxy": "localhsot, 192.168.1.0/24"
    }
  },
  "run_list": [
    "recipe[fuse::default]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request
[More details](https://github.com/psyreactor/wordpress-cookbook/blob/master/CONTRIBUTING.md)

License and Authors
-------------------

Authors:

Christian Cedeira (ccedeira)
- [christian.cedeira@gmail.com](mailto:christian.cedeira@gmail.com)
- [https://github.com/ccedeira](https://github.com/ccedeira)

Lucas Mariani (Psyreactor)
- [marianiluca@gmail.com](mailto:marianiluca@gmail.com)
- [https://github.com/psyreactor](https://github.com/psyreactor)
