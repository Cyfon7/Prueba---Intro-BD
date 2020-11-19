-- Prueba - Introduccion a Bases de Datos

-- Creacion de Base de Datos
CREATE DATABASE ventas;

-- Cambiar BD a ventas
\c ventas

-- Creacion de Entidades
CREATE TABLE clientes(
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    rut VARCHAR (15),
    direccion VARCHAR(255)
);

CREATE TABLE categorias(
    id INT PRIMARY KEY,
    nombre VARCHAR(80),
    descripcion VARCHAR(255)
);

CREATE TABLE facturas(
    id INT PRIMARY KEY,
    num_factura INT,
    fecha DATE,
    subtotal FLOAT,
    cliente_id REFERENCES clientes(id)
);

CREATE TABLE productos(
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(255),
    valor_unitario FLOAT,
    categoria_id REFERENCES categorias(id)
);

-- Creacion de Relaciones
CREATE TABLE listados_productos(
    id INT PRIMARY KEY,
    cantidad INT,
    factura_id REFERENCES facturas(id),
    producto_id REFERENCES productos(id)
);


