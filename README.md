# nginx-conf.rb

[![Build Status](https://travis-ci.org/raviqqe/nginx-conf.rb.svg?branch=master)](https://travis-ci.org/raviqqe/nginx-conf.rb)
[![License](https://img.shields.io/badge/license-unlicense-lightgray.svg)](https://unlicense.org)

nginx.conf generator in Ruby

## Installation

```
$ gem install nginx-conf
```

## Usage

Code:

```
require 'nginx-conf'

c = nginx_conf do
  user :www

  http do
    server do
      listen 80
      server_name 'foo.com'
    end

    server do
      listen 443, :ssl
      server_name 'bar.com'
    end
  end
end

puts c
```

Output:

```
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
