<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
 
// include database and object files
// include_once 'core.php';
include_once 'database.php';
include_once 'Sanpham.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$Sanpham = new SanPham($db);
 
// get keywords
$keywords=isset($_GET["s"]) ? $_GET["s"] : "";
 
// query products
$stmt = $Sanpham->TimSanPham($keywords);
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
     
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
echo json_encode($sanpham_arr);
}
 
else{
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no products found
    echo json_encode(
        array("message" => "No products found.")
    );
}
?>