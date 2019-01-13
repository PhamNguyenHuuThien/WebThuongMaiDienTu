<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

 
// database connection will be here
//đây là file lấy tất cả sản phẩm

// include database and object files
include_once 'database.php';
include_once 'Sanpham.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$sanpham = new SanPham($db);
 
// read products will be here
// query products
$stmt = $sanpham->read();
 
// check if more than 0 record found
if($stmt->rowCount() >0){
 
    // products array
     $sanpham_arr=array();
    $sanpham_arr["sanpham"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
     while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
    //     // extract row
    //     // this will make $row['name'] to
    //     // just $name only
    //     extract($row);
        $sanpham_item=array(
            "MaSP" => $row['MaSP'],
            "TenSP" => $row['TenSP'],
            "giagoc" => $row['GiaGoc'],
            "giaban" => $row['GiaBan'],
            "donvitinh" => $row['DonViTinh'],
            "motangan" => html_entity_decode($row['MoTaNgan']),
            "mota" => html_entity_decode($row['MoTa']),
            "hinhminhhoa" => $row['HinhMinhHoa'],
            "maloai" => $row['MaLoai'],
            "soluongban" => $row['SoLuongBan']
        ); 
        array_push($sanpham_arr["sanpham"], $sanpham_item);}
       //array_push( $sanpham_item);
   // }
 echo json_encode($sanpham_arr);

// no products found will be here
}else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no products found
    echo json_encode(
        array("message" => "No products found.")
    );
}