<?php
include 'database_masya.php';
$db = new database();

$aksi = $_GET['aksi'];
if ($aksi == "tambah") {
    $db->input_masyarakat(
        $_POST['nik'],
        $_POST['nama'],
        $_POST['username'],
        $_POST['password'],
        $_POST['telp'],
        $_POST['kecamatan'],
    );
    header("location:../../index.php");
}
