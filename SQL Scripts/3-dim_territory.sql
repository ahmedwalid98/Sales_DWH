use SalesDWH
go

if exists(select * from sys.objects where name = 'dim_territory' and type = 'U')
 drop table dim_territory
go

create table dim_territory
(
	territory_key int not null identity(1,1),
	territory_id int not null,
	territory_name nvarchar(50),
	territory_country nvarchar(400),
	territory_group nvarchar(50),

	-- metadata 
	source_system_code tinyint not null,

	-- SCD
	start_date datetime not null default(getdate()),
	end_date datetime null,
	isCurrent tinyint not null default(1),

	constraint PK_dim_territory primary key clustered (territory_key)
)
go

SET IDENTITY_INSERT dim_territory ON

INSERT INTO dim_territory
            (territory_key,
             territory_id,
             territory_name,
             territory_country,
             territory_group,
             source_system_code,
             start_date,
             end_date,
             isCurrent)
VALUES     (0,
            0,
            'Unknown',
            'Unknown',
            'Unknown',
            0,
            '1900-01-01',
            NULL,
            1)

SET IDENTITY_INSERT dim_territory OFF


if exists (select * from sys.tables where name = 'fact_sales' and type = 'U')
alter table fact_sales
add constraint FK_dim_territory
foreign key(territory_key) references dim_territory(territory_ke)

-- create indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_territory_territory_code'
                  AND object_id = Object_id('dim_territory'))
  DROP INDEX dim_territory.dim_territory_territory_code;

CREATE INDEX dim_territory_territory_id
  ON dim_territory(territory_id); 