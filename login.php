<div class="card" style="padding: 50px; width: 40%; margin: 0 auto; margin-top: 4%;">
	<h3 style="text-align: center;" class="grey-text">Login!</h3>
	<br>

	<center>
		<img src="img/logo.jpg" height="175" width="310">
	</center>
	<center>
		<p>Pengaduan Masyarakat</a></p>
	</center>

	<form method="POST">
		<div class="input_field">
			<label for="username">Username</label>
			<input id="username" type="text" name="username" required>
		</div>
		<div class="input_field">
			<label for="password">Passowrd</label>
			<input id="password" type="password" name="password" required>
		</div>
		<input type="submit" name="login" value="Login" class="btn grey" style="width: 100%;">
		<p style="text-align: center;">Belum Punya Akun?<a href="register.php"> Daftar sekarang!</a></p>
	</form>
</div>
<?php
if (isset($_POST['login'])) {
	$username = mysqli_real_escape_string($koneksi, ($_POST['username']));
	$password = mysqli_real_escape_string($koneksi, ($_POST['password']));

	$sql = mysqli_query($koneksi, "SELECT * FROM masyarakat WHERE username='$username' AND password='$password' ");
	$cek = mysqli_num_rows($sql);
	$data = mysqli_fetch_assoc($sql);

	$sql2 = mysqli_query($koneksi, "SELECT * FROM petugas WHERE username='$username' AND password='$password' ");
	$cek2 = mysqli_num_rows($sql2);
	$data2 = mysqli_fetch_assoc($sql2);

	if ($cek > 0) {
		session_start();
		$_SESSION['username'] = $username;
		$_SESSION['data'] = $data;
		$_SESSION['nik'] = $data['nik'];
		$_SESSION['telp'] = $data['telp'];
		$_SESSION['level'] = 'masyarakat';
		header('location:masyarakat/');
	} elseif ($cek2 > 0) {
		if ($data2['level'] == "owner") {
			session_start();
			$_SESSION['username'] = $username;
			$_SESSION['data'] = $data2;
			header('location:admin/');
		} elseif ($data2['level'] == "petugas") {
			session_start();
			$_SESSION['username'] = $username;
			$_SESSION['data'] = $data2;
			header('location:petugas/');
		}
	} else {
		echo "<script>alert('Maaf Akun Gagal Untuk Login')</script>";
	}
}
?>