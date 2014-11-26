#!/usr/bin/perl

$i = 0;
$l = 0;
$r = `wc -l data.znew`;
while ($i<15) {
    $c = int(($l+$r)/2);

    `rm data.cdb;head -n $c data.znew > data`;
    $res = system('/usr/bin/make');

    $l = $res ? $l : $c;
    $r = $res ? $c : $r;

    print("l:$l r:$r c:$c\n");

    $i++;
};

