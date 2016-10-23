#!/bin/sh

cat $1 | sed -z 's/.*```\([^`]*\)```.*/\1/' | ruby
