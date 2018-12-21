
<?php

class systemConfig {
var $dbConnect;

}

function __construct(){

}

function __destruct() {
$this->dbConnect->close();
}

function connectDB(){
$this->dbConnect = new mysqli(‘localhost’, ‘root’, ‘’, ‘xxx’);
if($this->dbConnect->connect_errno){
return null; 
}else{
return $this->dbConnect;
}
}




?>