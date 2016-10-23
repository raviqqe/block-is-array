#!/bin/sh

cat $1 | sed -z 's/.*```.*\(require[^`]*\)```.*/\1/' | ruby
