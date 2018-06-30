#!/bin/sh

rg --no-heading --type php "^namespace .*;" . vendor | sed 's/^\(.*\/\(.*\)\.php\):namespace \(.*\);.*$/\3\\\2     \1/i'
