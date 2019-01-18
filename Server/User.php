<?php
// 'user' object
class User{
 
    // database connection and table name
    private $conn;
    private $table_name = "users";
 
    // object properties
    public $makh;
    public $ho;
    public $ten;
    public $sodienthoai;
    public $diachi;
    public $tendangnhap;
    public $matkhau;
    public $email;
    public $ladmin;
    public $daduyet;
    public $thoigian;



    // constructor
    public function __construct($db){
        $this->conn = $db;
    }
 
// create() method will be here
// create new user record
function TaoTaiKhoan(){
    //Kiểm tra tài khoản tồn tại chưa
                $query = "SELECT *
                FROM " . $this->table_name . "
                WHERE tendangnhap = :user or email = :email";

            // prepare the query
            $stmt = $this->conn->prepare( $query );

            // sanitize
            $this->tendangnhap=htmlspecialchars(strip_tags($this->tendangnhap));
            $this->email=htmlspecialchars(strip_tags($this->email));

            // bind given email value
            $stmt->bindParam(':user', $this->tendangnhap);
            $stmt->bindParam(':email', $this->email);

            // execute the query
            $stmt->execute();

            // get number of rows
            $num = $stmt->rowCount();

            if($num>0){
                return false;
            }
else{

    // insert query
    $query = "INSERT INTO " . $this->table_name . "
            VALUE (
                last_insert_id(),
                :ho,
                :ten,
                :sodienthoai,
                :diachi,
                :tendangnhap,
                :matkhau,
                :email,
                 0,
                1,
                now()
                )";
 
    // prepare the query
    $stmt = $this->conn->prepare($query);
 
    // sanitize
    $this->ho=htmlspecialchars(strip_tags($this->ho));
    $this->ten=htmlspecialchars(strip_tags($this->ten));
    $this->sodienthoai=htmlspecialchars(strip_tags($this->sodienthoai));
    $this->diachi=htmlspecialchars(strip_tags($this->diachi));
    $this->tendangnhap=htmlspecialchars(strip_tags($this->tendangnhap));
    $this->matkhau=htmlspecialchars(strip_tags($this->matkhau));
    $this->email=htmlspecialchars(strip_tags($this->email));
   
 
    // bind the values
    $stmt->bindParam(':ho', $this->ho);
    $stmt->bindParam(':ten', $this->ten);
    $stmt->bindParam(':sodienthoai', $this->sodienthoai);
    $stmt->bindParam(':diachi', $this->diachi);
    $stmt->bindParam(':tendangnhap', $this->tendangnhap);
    // $stmt->bindParam(':matkhau', $this->matkhau);
    $stmt->bindParam(':email', $this->email);
   
 
    // hash the password before saving to database
    $password_hash = password_hash($this->matkhau, PASSWORD_BCRYPT);
    $stmt->bindParam(':matkhau', $password_hash);
 
    // execute the query, also check if query was successful
// try{$stmt->execute();}
// catch(PDOException $exception) {
//     echo(". $exception->message .");
// }
    // query to check if email exists
    

    if($stmt->execute()){
        return true;
    }
    else
        return false;
    }
   return false;
}
 




function DangNhap(){ //dành cho trang đăng nhập

    // query to check if email exists
    $query = "SELECT *
            FROM " . $this->table_name . "
            WHERE tendangnhap = ?";
 
    // prepare the query
    $stmt = $this->conn->prepare( $query );
 
    // sanitize
    $this->tendangnhap=htmlspecialchars(strip_tags($this->tendangnhap));
    //$this->email=htmlspecialchars(strip_tags($this->email));
 
    // bind given email value
    $stmt->bindParam(1, $this->tendangnhap);
    //$stmt->bindParam(1, $this->email);
 
    // execute the query
    $stmt->execute();
 
    // get number of rows
    $num = $stmt->rowCount();
 
    // if email exists, assign values to object properties for easy access and use for php sessions
    if($num>0){
 
        // get record details / values
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
 
        // assign values to object properties
        $this->makh = $row['MaKH'];
        $this->ho = $row['Ho'];
        $this->ten = $row['Ten'];
        $this->tendangnhap = $row['TenDangNhap'];
        $this->matkhau = $row['MatKhau'];
        // return true because email exists in the database
        return true;
    }
 
    // return false if email does not exist in the database

    return false;
}

}
