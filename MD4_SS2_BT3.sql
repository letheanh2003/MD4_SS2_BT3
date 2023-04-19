create database md4_thietkevatao_csdl;

use md4_thietkevatao_csdl;
-- Category
create table Category(
Category_id int primary key auto_increment,
Category_name varchar(255) not null,
createDate datetime,
categry_status tinyint
);
insert into Category(Category_name,createDate,categry_status) values
("Quần","2023-1-1",1),
("Áo","2023-2-2",1),
("Tất","2023-3-3",1),
("Găng Tay","2023-4-4",1),
("Kính","2023-5-5",1);

-- Product
create table Product(
Product_id int primary key auto_increment,
Product_name varchar(255) not null,
Product_price float,
Product_image longtext,
Product_quantity int not null,
Product_title text,
createDate datetime,
Product_status tinyint,
category_id int,
foreign key(category_id) References Category(Category_id)
);
insert into Product(Product_name,Product_price,Product_image,Product_quantity,Product_title,createDate,Product_status,category_id) values
("Quần Sà Lỏong",50000,null,100,"Để mặc","2023-1-1",1,1),
("Quần suông Khá Bảnh",100000,null,100,"Để mặc,Nhảy","2023-1-1",1,1),
("Áo chim đại bàng",100000,null,100,"Để mặc,bay","2023-2-2",1,2),
("Áo bó Khá Bảnh",100000000,null,100,"Chất như nước cất","2023-2-2",1,2),
("Tất Nike Trắng Dài",540000,null,100,"Dùng để đi với giày","2023-3-3",1,3),
("Tất Nike Đen Dài",530000,null,100,"Dùng để đi với giày","2023-3-3",1,3),
("Găng tay đi xe máy",520000,null,100,"ấm","2023-4-4",1,4),
("Găng tay đi xe đạp",510000,null,100,"nóng","2023-4-4",1,4),
("Kính dâm đen",560000,null,100,"Ngầu Lòi","2023-5-5",1,5),
("Kính dâm xanh",570000,null,100,"Ngầu hơn cả lòi","2023-5-5",1,5);
select* from bangdiem Product;
-- User
create table Users(
User_id int primary key auto_increment,
User_fullname varchar(255),
User_username varchar(255) not null,
User_password varchar(255) not null,
User_role tinyint,
User_status tinyint,
Address_id int,
foreign key Users(Address_id)References Address(Address_id)
);
insert into Users(User_fullname,User_username,User_password,User_role,User_status,Address_id) values
("Lê Thế Anh","Thế Anh","123456",1,1,1),
("Nguyễn Phúc Thắng","Thắng","1234567",0,1,2),
("Thái Phương Nam","Nam","12345678",0,1,3),
("Nguyễn Thị Ngân","Ngân","123456789",0,1,4);
select *from Address;


-- Address
create table Address(
Address_id int primary key auto_increment,
Address_add text not null,
Phone_number varchar(255) not null,
nameReceiver varchar(255) not null
);
insert into Address(Address_add,nameReceiver,Phone_number) values
("Bắc Ninh","Lê Thế Anh","0123456789"),
("Nghệ An","Nguyễn Phúc Thắng","0234567891"),
("Hà Tĩnh","Thái Phương Nam","0345678912"),
("Thanh Hóa","Nguyễn Thị Ngân","0456789123");

-- Order
create table `Order`(
Order_id int primary key auto_increment,
createDate datetime,
Order_total float,
Users_id int not null,
foreign key `Order`(Users_id)References Users(User_id),
Order_status tinyint,
Order_type tinyint
);
insert into `Order`(Users_id) values
(13),(14),(15),(16);
select * from Users;


-- Order detail
create table Orderdetail(
Orderdetail_id int primary key auto_increment,
Order_id int not null references `Order`,
Product_id int not null references Product(Product_id),
Product_name varchar(255) not null,
Product_price float,
quantity int check (quantity>0)
);
insert into Orderdetail(Order_id,Product_id,Product_name,Product_price,quantity) values
(1,1,"Quần rách gối",100000,1234),
(1,1,"Quần xuông Khá Bảnh",120000,134),
(1,1,"Quần ống loe",13000,14),
(2,2,"Áo bó Khá bảnh",100330,134),
(2,2,"Áo sơ mi đại bàng",100000,1534),
(2,2,"Áo bomber sói",100000,134),
(3,3,"Tất nike đen",130000,134),
(3,3,"Tất nike Trắng",100300,122),
(3,3,"Tất Nike Fake",100000,1234),
(4,4,"Kính dâm trắng",100000,1234),
(4,4,"Kính dâm đen",100000,1234),
(4,4,"kính dâm gucci",100000,1234)

