-- Prueba - Introduccion a Bases de Datos

-- Creacion de Base de Datos
CREATE DATABASE ventas;

-- Cambiar BD a ventas (solo si usas \i)
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
    cliente_id INT REFERENCES clientes(id)
);

CREATE TABLE productos(
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(255),
    valor_unitario FLOAT,
    categoria_id INT REFERENCES categorias(id)
);

-- Creacion de Relaciones
CREATE TABLE listados_productos(
    id INT PRIMARY KEY,
    cantidad INT,
    factura_id INT REFERENCES facturas(id),
    producto_id INT REFERENCES productos(id)
);

-- Insertar registros
-- * 5 clientes
--          clientes        |id |nombre |    rut   |   direccion   |
INSERT INTO clientes VALUES (1, 'Pedro', '12345678-2', 'Av. Alameda 124');
INSERT INTO clientes VALUES (2, 'Juan', '23456789-3', 'Av. Vitacura 353');
INSERT INTO clientes VALUES (3, 'Diego', '34567890-2', 'Mapocho 678');
INSERT INTO clientes VALUES (4, 'Maria', '15514123-k', 'Moneda 102');
INSERT INTO clientes VALUES (5, 'Francisca', '57093412-6', 'San Diego 73');

SELECT * FROM clientes;

-- * 3 categorias
--          categorias        |id|     nombre    |                 descripcion                    |
INSERT INTO categorias VALUES (1, 'Linea Blanca', 'Lavadoras, Refrigeradores, entre otros');
INSERT INTO categorias VALUES (2, 'Electronicos', 'Televisores, Computadores, Sonido, entre otros');
INSERT INTO categorias VALUES (3, 'Muebles', 'Mesas, Sillas, Sillones, Camas, entre otros');

SELECT * FROM categorias;

-- * 8 productos
--          productos        |id|       nombre         |       descripcion        |  valor_unitario | categoria_id |                   
INSERT INTO productos VALUES (1, 'Refrigerador Samsung', 'Color Plateado, 220v, 50Hz, 50 lts', 50.06, 1);
INSERT INTO productos VALUES (2, 'Cocina Oster', 'Vitroceramica, 4 Quemadores, Color Negro, 220v, 50Hz', 60.24, 1);
INSERT INTO productos VALUES (3, 'Lavadora LG', 'Color Blanco, Lavado Inteligente, Modo Ecologico, 10kg, 220v, 50Hz', 40.35, 1);

INSERT INTO productos VALUES (4, 'Televisor Toshiba', '42" LED', 150.45, 2);
INSERT INTO productos VALUES (5, 'Laptop Asus', '15" Core-i9, 500GB, 32GB RAM', 230.78, 2);
INSERT INTO productos VALUES (6, 'BlueRay Sony', '1TB', 130.45, 2);

INSERT INTO productos VALUES (7, 'Comedor 4 puestos Ikea', 'Madera de Pino, Color Caoba', 155.90, 3);
INSERT INTO productos VALUES (8, 'Sofa-cama Rose', 'Color Gris', 215.65, 3);

SELECT * FROM productos;

-- * 10 facturas
--          facturas        |id| num_factura | fecha | subtotal | cliente_id |
--          listado_productos         | id | cantidad | factura_id | producto_id |

-- Cliente 1: Factura 1 (2 productos)
INSERT INTO facturas VALUES (1, 100101, '2020-10-30', 200.51, 1);
INSERT INTO listados_productos VALUES (1, 1, 1, 1);
INSERT INTO listados_productos VALUES (2, 1, 1, 4);

-- Cliente 1: Factura 2 (3 productos)
INSERT INTO facturas VALUES (2, 100102, '2020-11-30', 506.67, 1);
INSERT INTO listados_productos VALUES (3, 1, 2, 2);
INSERT INTO listados_productos VALUES (4, 1, 2, 5);
INSERT INTO listados_productos VALUES (5, 1, 2, 8);

--          facturas        |id| num_factura | fecha | subtotal | cliente_id |
--          listado_productos         | id | cantidad | factura_id | producto_id |

-- Cliente 2: Factura 1 (3 productos)
INSERT INTO facturas VALUES (3, 200101, '2020-11-01', 326.70, 2);
INSERT INTO listados_productos VALUES (6, 1, 3, 3);
INSERT INTO listados_productos VALUES (7, 1, 3, 6);
INSERT INTO listados_productos VALUES (8, 1, 3, 7);

-- Cliente 2: Factura 2 (2 productos)
INSERT INTO facturas VALUES (4, 200102, '2020-11-15', 346.10, 2);
INSERT INTO listados_productos VALUES (9, 1, 4, 6);
INSERT INTO listados_productos VALUES (10, 1, 4, 8);

-- Cliente 2: Factura 3 (3 productos)
INSERT INTO facturas VALUES (5, 200103, '2020-11-20', 341.14, 2);
INSERT INTO listados_productos VALUES (11, 1, 5, 2);
INSERT INTO listados_productos VALUES (12, 1, 5, 6);
INSERT INTO listados_productos VALUES (13, 1, 5, 4);

--          facturas        |id| num_factura | fecha | subtotal | cliente_id |
--          listado_productos         | id | cantidad | factura_id | producto_id |

-- Cliente 3: Factura 1 (1 producto)
INSERT INTO facturas VALUES (6, 300101, '2020-11-25', 155.40, 3);
INSERT INTO listados_productos VALUES (14, 1, 6, 7);

--          facturas        |id| num_factura | fecha | subtotal | cliente_id |
--          listado_productos         | id | cantidad | factura_id | producto_id |

-- Cliente 4: Factura 1 (2 productos)
INSERT INTO facturas VALUES (7, 400101, '2020-11-30', 100.59, 4);
INSERT INTO listados_productos VALUES (15, 1, 7, 2);
INSERT INTO listados_productos VALUES (16, 1, 7, 3);

-- Cliente 4: Factura 2 (3 productos)
INSERT INTO facturas VALUES (8, 400102, '2020-12-01', 496.55, 4);
INSERT INTO listados_productos VALUES (17, 1, 8, 4);
INSERT INTO listados_productos VALUES (18, 1, 8, 6);
INSERT INTO listados_productos VALUES (19, 1, 8, 8);

-- Cliente 4: Factura 3 (4 productos)
INSERT INTO facturas VALUES (9, 400103, '2020-12-10', 496.98, 4);
INSERT INTO listados_productos VALUES (20, 1, 9, 1);
INSERT INTO listados_productos VALUES (21, 1, 9, 5);
INSERT INTO listados_productos VALUES (22, 1, 9, 2);
INSERT INTO listados_productos VALUES (23, 1, 9, 7);

-- Cliente 4: Factura 4 (1 producto)
INSERT INTO facturas VALUES (10, 400104, '2020-12-15', 130.45, 4);
INSERT INTO listados_productos VALUES (24, 1, 10, 6);

-- CONSULTAS
-- ¿Que cliente realizó la compra mas cara?
SELECT total.nombre, total.rut, total.direccion, total.num_factura, total.subtotal
FROM(
    SELECT *
    FROM clientes INNER JOIN facturas
    ON clientes.id = facturas.cliente_id
) AS total
ORDER BY total.subtotal DESC LIMIT 1;

-- ¿Que cliente pagó sobre 300 de monto?
SELECT sobre_300.nombre, sobre_300.rut, sobre_300.direccion, sobre_300.num_factura, sobre_300.subtotal
FROM(
    SELECT *
    FROM clientes INNER JOIN facturas
    ON clientes.id = facturas.cliente_id
) AS sobre_300
WHERE sobre_300.subtotal >= 300;

-- ¿Cuantos clientes han comprado el producto 6?
SELECT clientes.nombre, clientes.rut, clientes.direccion
FROM(
    -- Subquery formado por "facturas" y "listado_productos"
    -- para obtener cuales "facturas" tienen el item con id 6
    -- y extraer de "facturas" el id del cliente(s)
    -- finalmente genera una tabla con solo los id's deseados
    SELECT item.cliente_id
    FROM(
        SELECT facturas.cliente_id, facturas.num_factura, listados_productos.producto_id
        FROM facturas INNER JOIN listados_productos
        ON facturas.id = listados_productos.factura_id
    ) AS item
    WHERE item.producto_id = 6
    GROUP BY item.cliente_id
    -- Posterior a genera la tabla con los id's deseados
    -- se hace un join con la tabla "clientes" para extraer
    -- la informacion personal de los clientes que compraron
    -- el item 6
) AS list_item_clientes INNER JOIN clientes
ON clientes.id = list_item_clientes.cliente_id;