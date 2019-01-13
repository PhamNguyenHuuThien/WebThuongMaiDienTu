<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// database connection will be here
// files needed to connect to database
include_once 'database.php';
include_once 'User.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// instantiate product object
$user = new User($db);
 
// submitted data will be here

// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// set product property values
$user->ho = $data->ho;
$user->ten = $data->ten;
$user->sodienthoai = $data->sodienthoai;
$user->diachi = $data->diachi;
$user->tendangnhap = $data->tendangnhap;
$user->matkhau = $data->matkhau;
$user->email = $data->email;

 
// use the create() method here
echo ("Tạo tk");
// echo (TaoTaiKhoan());
// create the user
if($user->TaoTaiKhoan()){
 
    // set response code
    http_response_code(200);
 
    // display message: user was created
    echo json_encode(array("message" => "User was created."));
}
 
// message if unable to create user
else{
 
    // set response code
    http_response_code(400);
 
    // display message: unable to create user
    echo json_encode(array("message" => "Unable to create user."));
}
?>