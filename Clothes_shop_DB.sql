use master
go
if exists (select * from sysdatabases where name = 'shopappPRJ301')
	DECLARE @DatabaseName nvarchar(50)
	SET @DatabaseName = N'shopappPRJ301'
	DECLARE @SQL varchar(max)https://github.com/TranHuyy012479/Clothes_Shop/tree/main
	SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
	FROM MASTER..SysProcesses
	WHERE DBId = DB_ID(@DatabaseName) AND SPId <> @@SPId
	--SELECT @SQL 
	EXEC(@SQL)
    drop database shopappPRJ301
go

create database shopappPRJ301
go
use shopappPRJ301
go



CREATE TABLE roles( 
    username VARCHAR(20) NOT NULL,
	role_id INT primary key
);



CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
	username varchar(100) not null default '',
	[password] VARCHAR(100) NOT NULL DEFAULT '',
    full_name NVARCHAR(100) DEFAULT '',
    date_of_birth DATE default '',
    phone_number NVARCHAR(10) NOT NULL default '',
    [address] NVARCHAR(200) DEFAULT '',
	email varchar(100) default '',
	is_active int DEFAULT 1,
    created_at DATETIME default GetDate(),
    updated_at DATETIME default GETDATE(),
	role_id int not null default 0,
	FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


CREATE TABLE categories(
    id INT PRIMARY KEY ,
    [name] NVARCHAR(100) NOT NULL DEFAULT ''
);


CREATE TABLE products(
    id INT PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(350),
    price FLOAT NOT NULL CHECK (price >= 0),
	quantity int not null,
    [description] nvarchar(max) DEFAULT '',
	image varchar default '',
    created_at DATETIME default GetDate() ,
    updated_at DATETIME default GetDate(),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


create table shipping(
	id int primary key identity(1,1),
	total_money float check(total_money>=0),
	user_id int,
	FOREIGN KEY (user_id) REFERENCES users(id),
	status varchar(20) default ''
)


CREATE TABLE orders(
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    shipping_address nVARCHAR(200) NOT NULL,
    note VARCHAR(100) DEFAULT '',
    order_date DATETIME DEFAULT GETDATE(),
    status VARCHAR(20) default '',
    total_money FLOAT CHECK(total_money >= 0),
    FOREIGN KEY (user_id) REFERENCES users(id),
	shipping_id int,
	FOREIGN KEY (shipping_id) REFERENCES shipping(id),
);


CREATE TABLE order_details(
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    product_id INT,
    price FLOAT CHECK(price >= 0),
    number_of_products INT CHECK(number_of_products > 0),
    total_money FLOAT CHECK(total_money >= 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
