#!/usr/bin/env php
<?php

$name = $argv[1] ?? null;
$pfix = "\\$name";
$len = strlen($pfix);

require "vendor/composer/autoload_static.php";

$tmp = get_declared_classes();
$loaderClass = end($tmp);
$map = $loaderClass::$classMap;

foreach ($map as $class => $path) {
    // if (substr_compare($class, $pfix, -$len, $len) === 0) {
    //     echo "$class\n";
    // }
    $path = realpath($path);
    echo "$class $path\n";
}
