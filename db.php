<?php

function db_connect() {
         $dbhost = "localhost:3306";
         $dbuser = "root";
         $dbpass = "";
         $db = mysqli_connect($dbhost, $dbuser, $dbpass);
          // proveravamo da li je došlo do greške prilikom povezivanja
    if (mysqli_connect_errno()) {
        echo "Greška prilikom povezivanja na MySQL bazu: " .
              mysqli_connect_error();
        exit();
    }
    return $db;
}

function db_close($db) {
    mysqli_close($db);
}

?>
