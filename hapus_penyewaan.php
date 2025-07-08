<?php
// Koneksi ke database
$koneksi = new mysqli("localhost", "root", "", "db_dvd");

// Ambil ID dari parameter URL
$id = $_GET['id'];

// Cek apakah ID valid
if (!empty($id)) {
    $hapus = $koneksi->query("DELETE FROM penyewaan WHERE id = $id");

    if ($hapus) {
        // Redirect ke halaman utama setelah berhasil
        header("Location: Pmingguan.php"); // ganti dengan nama file tampilan data kamu jika berbeda
        exit;
    } else {
        echo "Gagal menghapus data.";
    }
} else {
    echo "ID tidak ditemukan.";
}
?>
