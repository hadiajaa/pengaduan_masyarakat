<?php
include '../koneksi.php';
class database{
function input_masyarakat($nik,$nama,$username,$password,$telp,$kecamatan){
    global $koneksi;
    mysqli_query($koneksi,"insert into masyarakat values('','$nik','$nama','$username','$password','$telp','$kecamatan')");
}
	
} 
?>