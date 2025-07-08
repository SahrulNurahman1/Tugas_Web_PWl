<?php
$koneksi = new mysqli("localhost", "root", "", "db_dvd");

if (isset($_POST['genre'])) {
    $genre = $koneksi->real_escape_string($_POST['genre']);

    // debug
    // echo "Genre diterima: " . $genre;

    $query = $koneksi->query("SELECT id, judul_dvd FROM produk_dvd WHERE genre = '$genre'");

    echo '<option value="">-- Pilih Judul DVD --</option>';
    while ($row = $query->fetch_assoc()) {
        echo '<option value="' . $row['judul_dvd'] . '">' . htmlspecialchars($row['judul_dvd']) . '</option>';
    }
} else {
    echo '<option value="">(Genre tidak dikirim!)</option>';
}
?>
