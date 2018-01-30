<?php
    
     $star = isset($_GET['star']) ? $_GET['star'] : null;
     $add = isset($_GET['add']) ? $_GET['add'] : null;
     $con = new mysqli('localhost','root','','hotel');
    if($con->connect_errno){
        die('链接失败'.$con->connect_error);
    }

    $con->set_charset('utf8');
    $sql = "select * from facehotel where star=$star and add=$add  ";
    $result = $con->query($sql);
    $row = $result->fetch_all(MYSQLI_ASSOC);
    
    $row = json_encode($row,JSON_UNESCAPED_UNICODE);
    echo $row

?>