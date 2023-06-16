<?php
include('../../koneksi.php');
require '../../vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
 
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', 'No');
$sheet->setCellValue('B1', 'Nama');
$sheet->setCellValue('C1', 'Umur');
$sheet->setCellValue('D1', 'Alamat');
$sheet->setCellValue('E1', 'Gol Darah');
$sheet->setCellValue('F1', 'Tgl Daftar');
$sheet->setCellValue('G1', 'Kode Dokter');
$sheet->setCellValue('H1', 'Kode Ruangan');
$sheet->setCellValue('I1', 'Penyakit');
$sheet->setCellValue('J1', 'Tgl Keluar');

$query = mysqli_query($link,"select * from data_pasien");
$i = 2;
$no = 1;
while($row = mysqli_fetch_array($query))
{
	$sheet->setCellValue('A'.$i, $no++);
	$sheet->setCellValue('B'.$i, $row['nama']);
	$sheet->setCellValue('C'.$i, $row['umur']);
	$sheet->setCellValue('D'.$i, $row['alamat']);
    $sheet->setCellValue('E'.$i, $row['gol_darah']);
    $sheet->setCellValue('F'.$i, $row['tgl_daftar']);
    $sheet->setCellValue('G'.$i, $row['kode_dokter']);
    $sheet->setCellValue('H'.$i, $row['kode_ruangan']);
    $sheet->setCellValue('I'.$i, $row['penyakit']);
    $sheet->setCellValue('J'.$i, $row['tgl_keluar']);	
	$i++;
}
 
$styleArray = [
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
				],
			],
		];
$i = $i - 1;
$sheet->getStyle('A1:J'.$i)->applyFromArray($styleArray);
 
 
$writer = new Xlsx($spreadsheet);
$writer->save('Report Data Pasien.xlsx');


?>