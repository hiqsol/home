#!/usr/bin/env php
<?php

/// Use with:
/// rg --no-heading --type php '^namespace ' . vendor

while($str = fgets(STDIN)){
    if (preg_match('/^((.*)\.[a-z]+):namespace (.+);.*$/', $str, $ms)) {
        $path = $ms[1];
        $ns = $ms[3];
        $fs = explode('/', $ms[2]);
        $name = end($fs);
        $class = "$ns\\$name";
        echo "$class $path\n";
        printf("%-80s %s", $class, $path);
    }
}
