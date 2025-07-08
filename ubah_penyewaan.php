<?php
$koneksi = new mysqli("localhost", "root", "", "db_dvd");

// Ambil data berdasarkan ID
$id = $_GET['id'];
$data = $koneksi->query("SELECT * FROM penyewaan WHERE id = $id")->fetch_assoc();

// Jika form disubmit
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = $_POST['nama'];
    $judul = $_POST['judul'];
    $sewa = $_POST['sewa'];
    $kembali = $_POST['kembali'];
    $harga = $_POST['harga'];

    $update = $koneksi->query("UPDATE penyewaan SET
        nama_penyewa='$nama',
        judul_dvd='$judul',
        tanggal_sewa='$sewa',
        tanggal_kembali='$kembali',
        harga_sewa='$harga'
        WHERE id = $id
    ");

    if ($update) {
        header("Location: Pmingguan.php"); // Ganti ke halaman utama tabel
        exit;
    } else {
        echo "Gagal mengubah data.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Penyewaan</title>
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Data Penyewaan</h2>
        <form method="post">
            <div class="form-group">
                <label>Nama Penyewa</label>
                <input type="text" name="nama" class="form-control" value="<?= $data['nama_penyewa'] ?>" required>
            </div>
            <div class="form-group">
                <label>Judul DVD</label>
                <input type="text" name="judul" class="form-control" value="<?= $data['judul_dvd'] ?>" required>
            </div>
            <div class="form-group">
                <label>Tanggal Sewa</label>
                <input type="date" name="sewa" class="form-control" value="<?= $data['tanggal_sewa'] ?>" required>
            </div>
            <div class="form-group">
                <label>Tanggal Kembali</label>
                <input type="date" name="kembali" class="form-control" value="<?= $data['tanggal_kembali'] ?>" required>
            </div>
            <div class="form-group">
                <label>Harga Sewa</label>
                <input type="number" name="harga" class="form-control" value="<?= $data['harga_sewa'] ?>" required>
            </div>
            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
            <a href="index.php" class="btn btn-secondary">Kembali</a>
        </form>
    </div>
</body>
</html>
