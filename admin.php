<?php
require 'koneksi.php';
session_start();
if ($_SESSION['login'] != true) {
  header('location:index.php');
}
include('koneksi.php');
$sql = "SELECT tgl_keluar, COUNT(*) AS jumlah_data FROM data_pasien GROUP BY tgl_keluar ORDER BY tgl_keluar";
$result = $link->query($sql);

$chart_labels = [];
$chart_data = [];

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {

        $tanggal = date("Y-m-d", strtotime($row['tgl_keluar']));
        $chart_labels[] = $tanggal;

 
        $jumlah_data = $row['jumlah_data'];
        $chart_data[] = $jumlah_data;
    }


    mysqli_free_result($result);
} else {
    echo "Error: " . mysqli_error($link);
}

mysqli_close($link);
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PAK KEMAS</title>
  <link rel="icon" href="pakkemas.png">
  <link href="admin.css" rel="stylesheet">
  <script type="text/javascript" src="Chart.js"></script>
</head>

<body>
  <div class="wrap">
    <div class="header">
      <h1>PAK KEMAS</h1>
      <p>Admin <?php echo $_COOKIE['ambil']; ?></p>
      <a onclick="logout()">Logout</a>
    </div>

    <div class="headerkecil">
      <span class="menubawah">
        <a href="admin.php" class="aa">Profil</a>
        <a href="masuk/panggilan-antrian/index.php" class="bb">Panggil antrian</a>
        <a href="masuk/ruangan/tampil.php" class="cc">Data Ruangan</a>
        <a href="masuk/dokter/tampil.php" class="dd">Data Dokter</a>
        <a href="masuk/pasien/tampilpasien.php" class="ee">Data Pasien</a>
      </span>
    </div><br>
    <script type="text/javascript">
      function logout() {
        var result = confirm("Yakin");

        if (result) {
          window.location.href = "logout.php";
        } else return false;
      }
    </script>
    <div class="content">
      <h2>Profil Rumah Sakit</h2><br>
      <span class="contentkecil">
        <a class="c1">Haji Kemas Sangkal Putung</a><a class="c11">Nama</a><br><br><br>
        <a class="c2">Jl. Gunung Anyar Jaya Masjid No 12</a><a class="c22">Alamat</a><br><br><br><br><br><br>
        <a class="c3">Jawa Timur</a><a class="c33">Provinsi</a><br><br><br>
        <a class="c4">Surabaya</a><a class="c44">Kabupaten/Kota</a><br><br><br>
        <a class="c5">031-8782270</a><a class="c55">No Telpon</a>
      </span>
      <span class="logo">
        <img src="pakkemas.png" width="200px" class="letak">
      </span>
    </div>

    <div class="content">
      <h2>Chart Pengunjung</h2><br>
      <canvas id="myChart"></canvas>
  <script>  
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: <?php echo json_encode($chart_labels); ?>,
            datasets: [{
                label: 'Data Count',
                data: <?php echo json_encode($chart_data); ?>,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }
        }
    });
</script>
      </span>
    </div>

    <div class="clear"></div><br>

    <div class="footer">
      <center>
        <p>PAK KEMAS GUNUNG ANYAR</p>
      </center>
    </div>

  </div>
</body>

</html>