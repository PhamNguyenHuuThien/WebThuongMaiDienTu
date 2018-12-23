<?php
class SanPham{
 
    // database connection and table name
    private $conn;
    private $table_name = "sanpham";
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // read products
function read(){
 
    // select all query
    $query = "select * from sanpham";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

// search products
function TimSanPham($keywords){
 
    // select all query
    $query = "SELECT *  FROM " . $this->table_name . " p WHERE  p.TenSP LIKE N'%" . $keywords . "%'";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $keywords=htmlspecialchars(strip_tags($keywords));
    $keywords = "%{$keywords}%";
 
    // bind
    $stmt->bindParam(1, $keywords);
    $stmt->bindParam(2, $keywords);
    $stmt->bindParam(3, $keywords);
 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

}