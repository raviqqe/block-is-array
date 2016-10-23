# block-is-array

[![Build Status](https://travis-ci.org/raviqqe/block-is-array.svg?branch=master)](https://travis-ci.org/raviqqe/block-is-array)
[![License](https://img.shields.io/badge/license-unlicense-lightgray.svg)](https://unlicense.org)

Block is Array

## Installation

```
$ gem install block-is-array
```

## Usage

```
require 'block-is-array'

array = block_is_array do
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

p array
```

For more examples, see [examples](examples) directory.

## License

[The Unlicense](https://unlicense.org)
