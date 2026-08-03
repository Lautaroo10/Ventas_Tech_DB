-- creo la base de datos
create database Ventas_Tech_DB ;

-- me situo en la base de datos
use Ventas_Tech_DB ;

-- creo las primeras tablas 
create table Categorias (
id_categoria int not null identity (1,1) primary key , 
nombre_categoria varchar(50) not null , 
descripcion varchar(200) );

create table Clientes (
id_cliente int not null identity (1,1) primary key , 
nombre varchar(100) not null , 
email varchar(100) unique, 
ciudad varchar(50) , 
fecha_registro date not null ) ;

create table Productos ( 
id_producto int not null identity (1,1) primary key ,
nombre_producto varchar(100) not null , 
id_categoria int not null foreign key references Categorias(id_categoria),
precio decimal(10,2) not null ,
stock int default 0 ,
activo tinyint default 1 ) ;

create table Ventas ( 
id_venta int not null identity (1,1) primary key , 
id_cliente int not null foreign key references clientes(id_cliente) ,
id_producto int not null foreign key references Productos(id_producto),
cantidad int not null ,
precio_unitario decimal(10,2) not null ,
fecha_venta date not null )

-- compruebo que esten bien creadas
select * from Ventas ;
select * from Clientes;
select * from Categorias;
select * from Productos;


-- Ingreso primeros valores
INSERT INTO Categorias VALUES ('Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES ( 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES ( 'Audio', 'Auriculares y parlantes');
INSERT INTO Categorias VALUES ('Almacenamiento', 'Discos y memorias');

select * from Categorias;

INSERT INTO Clientes VALUES ( 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO Clientes VALUES ( 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO Clientes VALUES ( 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO Clientes VALUES ( 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO Clientes VALUES ( 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

select * from Clientes;

INSERT INTO Productos VALUES ( 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO Productos VALUES ( 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO Productos VALUES ( 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO Productos VALUES ( 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO Productos VALUES ( 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO Productos VALUES ('Teclado Mecánico',    2,   95.00, 40, 1);

select * from Productos ;


INSERT INTO Ventas VALUES (  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO Ventas VALUES (  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO Ventas VALUES (  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO Ventas VALUES (  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO Ventas VALUES (  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO Ventas VALUES (  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO Ventas VALUES (  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO Ventas VALUES (  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO Ventas VALUES (  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO Ventas VALUES ( 5, 3, 2,  450.00, '2024-03-15');


select * from Ventas;