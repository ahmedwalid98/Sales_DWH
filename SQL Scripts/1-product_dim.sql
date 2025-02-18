use SalesDWH
go


if Exists (select * from sys.tables where name = 'dim_product' and type = 'U')
	drop table dim_product
go

create table dim_product 
(
	product_key int not null identity(1,1),
	product_id int not null,
	product_name nvarchar(50),
	color nvarchar(15),
	product_category nvarchar(50),
	product_subcategory nvarchar(50),
	product_description nvarchar(200),
	model_name nvarchar(50),
	reorder_point smallint,
	standard_cost money,

	-- metadata
	source_system_code tinyint not null,

	-- SCD
	start_date datetime default(getdate()),
	end_date datetime,
	isCurrent tinyint default(1),

	constraint PK_dim_product primary key clustered (product_key)
)
go

SET IDENTITY_INSERT dim_product ON

INSERT INTO dim_product
            (product_key,
             product_id,
             product_name,
             Product_description,
             product_subcategory,
             product_category,
             color,
             model_name,
             reorder_point,
             standard_cost,
             source_system_code,
             start_date,
             end_date,
             isCurrent)
VALUES      (0,
             0,
             'Unknown',
             'Unknown',
             'Unknown',
             'Unknown',
             'Unknown',
             'Unknown',
             0,
             0,
             0,
             '1900-01-01',
             NULL,
             1)

SET IDENTITY_INSERT dim_product OFF

if exists(select * from sys.tables where name = 'fact_sales')
	alter table fact_sales
	add constraint FK_dim_product foreign key (product_key) references dim_product(product_key)

go

if exists(select * from sys.indexes where name = 'dim_product_prouct_key'
	and OBJECT_ID = OBJECT_ID('dim_product'))
	drop index dim_product.dim_product_prouct_key

create index dim_product_prouct_key on dim_product(product_key)

if exists(select * from sys.indexes where name = 'dim_product_prouct_category'
	and OBJECT_ID = OBJECT_ID('dim_product'))
	drop index dim_product.dim_product_prouct_category

create index dim_product_prouct_category on dim_product(product_category)