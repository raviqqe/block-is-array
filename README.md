# nginx-conf.rb

[![Build Status](https://travis-ci.org/raviqqe/nginx-conf.rb.svg?branch=master)](https://travis-ci.org/raviqqe/nginx-conf.rb)
[![License](https://img.shields.io/badge/license-unlicense-lightgray.svg)](https://unlicense.org)

nginx.conf generator in Ruby

## What is this?

The nginx.conf generator exploiting expressiveness of Ruby's built-in types.
As some entries can be repeated (e.g. server), they are treated specially.

## Installation

```
$ gem install nginx-conf
```

## Usage

```
irb> require 'nginx-conf'
irb> c = NginxConf.new(user: :www)
irb> c.server(listen: 80, server_name: 'foo.com')
irb> c.server(listen: [443, :ssl], server_name: 'bar.com')
irb> puts c
user www;
http {
    server {
        listen 80;
        server_name foo.com;
    }
    server {
        listen 443 ssl;
        server_name bar.com;
    }
}
```

For more complex example, see [examples](examples) directory.

## License

[The Unlicense](https://unlicense.org)
