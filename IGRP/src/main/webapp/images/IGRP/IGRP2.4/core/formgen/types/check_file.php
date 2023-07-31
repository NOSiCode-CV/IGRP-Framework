<?php

    $filename = isset( $_GET['v'] ) ? $_GET['v'] : null;

    $fileExist = file_exists($filename) ;

    $exists = $fileExist ? 'true' : 'false';

    $content = $fileExist ? file_get_contents($filename) : "";
    
    header('Content-Type: application/json; charset=utf-8');

    $array = [
        "status" => $fileExist,
        "filename" => $filename,
        "content" => $content
    ];

    echo json_encode($array);

?>