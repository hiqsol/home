#!/usr/bin/env php
<?php
/**
 * From https://stackoverflow.com/questions/4678082/what-is-22527-in-error-reporting-22527-of-phpinfo
 */

$error_reporting_value = $argv[1];
$constants = [
    "E_ERROR",
    "E_WARNING",
    "E_PARSE",
    "E_NOTICE",
    "E_CORE_ERROR",
    "E_CORE_WARNING",
    "E_COMPILE_ERROR",
    "E_COMPILE_WARNING",
    "E_USER_ERROR",
    "E_USER_WARNING",
    "E_USER_NOTICE",
    "E_STRICT",
    "E_RECOVERABLE_ERROR",
    "E_DEPRECATED",
    "E_USER_DEPRECATED",
];

$included = array();
$excluded = array();
foreach ($constants as $constant) {
    $value = constant($constant);
    if (($error_reporting_value & $value) === $value) {
        $included[] = $constant;
    } else {
        $excluded[] = $constant;
    }
}

echo "reporting:  " . $error_reporting_value . PHP_EOL;
echo "includes:   " . implode(", ", $included) . PHP_EOL;
echo "excludes:   " . implode(", ", $excluded) . PHP_EOL;
