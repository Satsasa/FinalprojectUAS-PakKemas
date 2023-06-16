<?php
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
<head>
<script type="text/javascript" src="Chart.js"></script>
</head>
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