#!/usr/bin/env php
<?php

$rg = popen("rg --no-heading --type php '^namespace .*;' . vendor", 'r');

while($str = fgets($rg)){
    if (preg_match('/^((.*)\.[a-z]+):namespace (.+);.*$/', $str, $ms)) {
        $path = $ms[1];
        $ns = $ms[3];
        $fs = explode('/', $ms[2]);
        $name = end($fs);
        $class = "$ns\\$name";
        printf("%s %s\n", $class, $path);
    }
}

pclose($rg);

