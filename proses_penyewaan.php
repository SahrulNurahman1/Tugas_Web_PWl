<?php
// Koneksi ke database
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_dvd";

$conn = new mysqli($host, $user, $pass, $db);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil data dari form
$nama       = $_POST['nama_penyewa'];
$judul      = $_POST['judul_dvd'];
$tgl_sewa   = $_POST['tanggal_sewa'];
$tgl_kembali= $_POST['tanggal_kembali'];
$harga      = $_POST['harga_sewa'];

// Simpan ke database
$sql = "INSERT INTO penyewaan (nama_penyewa, judul_dvd, tanggal_sewa, tanggal_kembali, harga_sewa)
        VALUES ('$nama', '$judul', '$tgl_sewa', '$tgl_kembali', '$harga')";

if ($conn->query($sql) === TRUE) {
    echo "<script>
            alert('Penyewaan berhasil disimpan!');
            window.location.href='Pmingguan.php';
          </script>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
