<?php 
$container = $_GET["container"];
$field     = $_GET["field"];
$filename  = '../types/fields/'.$field.'/templates/'.$field.'.'.$container.'.html';

if (file_exists($filename)) 
    echo file_get_contents($filename);
else 
    echo "false";
?>