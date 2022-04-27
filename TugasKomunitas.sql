create database dbSoal1;
use dbsoal1;
set sql_safe_updates=0;

/*membuat tabel*/
create table tbTransaksi(
	id_transaksi varchar(100), 
    nama_sales varchar(100),
    id_produk varchar(100),
    jumlah_produk int
    );
    
desc tbTransaksi;

/*insert data*/
insert into tbTransaksi(id_transaksi, nama_sales, id_produk, jumlah_produk)
values	('TR001', 'Jojo', 'H001', 3),
		('TR002', 'Abi', 'H002', 1),
		('TR003', 'Dinda', 'H003', 2),
		('TR004', 'Abi', 'Y001', 3),
		('TR005', 'Jojo', 'Y001', 2),
		('TR006', 'Dinda', 'Y003', 2),
		('TR007', 'Jojo', 'Y003', 3),
		('TR008', 'Abi', 'S001', 2);

/*update data jumlah_produk pada id_transaksi TR006*/
update tbTransaksi
set jumlah_produk = 3
WHERE id_transaksi = 'TR006';

alter table tbTransaksi
	add column nama_produk varchar(100) after nama_sales,
    add column harga_produk int after jumlah_produk,
    add column total_transaksi int after harga_produk;
    
update tbTransaksi
set nama_produk = 'Beat',
	harga_produk = 5000000
where id_produk = 'H001';

update tbTransaksi
set nama_produk = 'Vario',
	harga_produk = 7000000
where id_produk = 'H002';

update tbTransaksi
set nama_produk = 'CBR',
	harga_produk = 9000000
where id_produk = 'H003';

update tbTransaksi
set nama_produk = 'Soul',
	harga_produk = 6000000
where id_produk = 'Y001';

update tbTransaksi
set nama_produk = 'Vixion',
	harga_produk = 8500000
where id_produk = 'Y003';

update tbTransaksi
set nama_produk = 'Satria',
	harga_produk = 9000000
where id_produk = 'S001';

update tbTransaksi
set total_transaksi = jumlah_produk*harga_produk;

select * from tbTransaksi order by harga_produk asc;
select nama_sales, total_transaksi from tbTransaksi order by total_transaksi asc;

update tbTransaksi
set nama_produk = 'Brio'
where id_produk = 'S001';

delete from tbTransaksi
where id_transaksi = 'TR008';

alter table tbTransaksi
add column jumlah_total_transaksi int;

update tbTransaksi
set jumlah_total_transaksi = sum(total_transaksi);

select nama_Sales, sum(total_transaksi) as jumlah_total_transaksi
from tbTransaksi
group by nama_sales order by jumlah_total_Transaksi asc;

select * from tbTransaksi;