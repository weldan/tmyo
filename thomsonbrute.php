#!/usr/bin/env php 
#thomson router password hash bruteforce
#weldan, 2013
<?php 
$option = "f:";
$option .= "h:";
$option .= "u:";
$options = getopt($option);

if (!isset($options['f']) || !isset($options['h']) || !isset($options['u'])) {
    echo "usage: $argv[0] -u user -f password list file -h hash \n\n";
    exit;
}

$passlist = $options['f'];
$hash = $options['h'];
$user = $options['u'];

$handle = @fopen($passlist, "r");
if ($handle) {
    while (($buffer = fgets($handle, 4096)) !== false) {
        if (md5("$user:Thomson Gateway:$buffer") == $hash) {
            echo "\n";
            echo "=======================\n";
            echo "Found match! => $buffer\n";
            echo "=======================\n";
            exit;
        }else {
            echo "Nope. :( => $buffer\n";
            //sleep(1);
        }
    }
    if (!feof($handle)) {
        echo "Error: unexpected fgets() fail\n";
    }
    fclose($handle);
    exit;
}
?>
