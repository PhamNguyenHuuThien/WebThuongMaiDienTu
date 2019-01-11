<?php
class Database{
 
    // specify your own database credentials
    // private $host = "localhost";
    // private $db_name = "appthuongmaidientu";
    // private $username = "root";
    // private $password = "";
    // private $host = "sql304.byethost.com";
    // private $db_name = "b8_21339020_AppThuongMaiDienTu";
    // private $username = "b8_21339020";
    // private $password = "1071998";
    // private $host = "db4free.net";
    // private $db_name = "thuongmaidientu";
    // private $username = "huuthien";
    // private $password = "thien1123";
    private $host = "localhost";
    private $db_name = "thien_appthuongmaidientu";
    private $username = "thien";
    private $password = "123456";
    public $conn;
 
    // get the database connection
    public function getConnection(){
 
        $this->conn = null;
 
        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
 
        return $this->conn;
    }
}

?>