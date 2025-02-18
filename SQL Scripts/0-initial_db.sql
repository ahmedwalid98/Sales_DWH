use master
go

if DB_ID('SalesDWH') is not null
	drop database SalesDWH

create database SalesDWH
go

