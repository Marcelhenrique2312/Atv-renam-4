CREATE DATABASE LivrariaDB;
USE LivrariaDB;



CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Livros (
    LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Preco DECIMAL(10,2)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensPedido (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    LivroID INT,
    Quantidade INT,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);


INSERT INTO Clientes (Nome, Email) VALUES
('Ana Souza', 'ana@gmail.com'),
('Bruno Lima', 'bruno@hotmail.com'),
('Carlos Mendes', 'carlos@outlook.com'),
('Diana Ribeiro', 'diana@yahoo.com'),
('Eduardo Costa', 'edu@gmail.com'),
('Fernanda Luz', 'fer.luz@gmail.com'),
('Gustavo Nunes', 'gustavo@live.com'),
('Helena Dias', 'helenadias@gmail.com'),
('Igor Martins', 'igor.m@hotmail.com'),
('Julia Rocha', 'julia.rocha@gmail.com');


INSERT INTO Livros (Titulo, Autor, Preco) VALUES
('Dom Casmurro', 'Machado de Assis', 29.90),
('Capitães da Areia', 'Jorge Amado', 34.50),
('O Alquimista', 'Paulo Coelho', 39.00),
('1984', 'George Orwell', 45.00),
('A Revolução dos Bichos', 'George Orwell', 35.00),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 49.90),
('Senhor dos Anéis', 'J.R.R. Tolkien', 59.90),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 25.00),
('Cem Anos de Solidão', 'Gabriel García Márquez', 42.00),
('It: A Coisa', 'Stephen King', 55.00);


INSERT INTO Pedidos (ClienteID, DataPedido) VALUES
(1, '2024-05-01'),
(2, '2024-05-03'),
(3, '2024-05-05'),
(4, '2024-05-07'),
(5, '2024-05-08'),
(6, '2024-05-09'),
(7, '2024-05-10'),
(8, '2024-05-11'),
(9, '2024-05-12'),
(10, '2024-05-13');


INSERT INTO ItensPedido (PedidoID, LivroID, Quantidade) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 4, 1),
(3, 2, 3),
(4, 5, 1),
(5, 6, 2),
(6, 7, 1),
(7, 8, 2),
(8, 9, 1),
(9, 10, 1),
(10, 1, 1);




SELECT c.Nome, l.Titulo
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
INNER JOIN Livros l ON ip.LivroID = l.LivroID
WHERE l.Autor LIKE '%Orwell%';

SELECT c.Nome, l.Titulo
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
INNER JOIN Livros l ON ip.LivroID = l.LivroID
WHERE c.Email LIKE '%gmail.com';

SELECT p.PedidoID, l.Titulo
FROM Pedidos p
INNER JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
INNER JOIN Livros l ON ip.LivroID = l.LivroID
WHERE l.Titulo LIKE 

SELECT DISTINCT c.Nome, l.Autor
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
INNER JOIN Livros l ON ip.LivroID = l.LivroID
WHERE l.Autor LIKE '%Coelho%' OR l.Autor LIKE 

SELECT c.Nome, l.Titulo
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN ItensPedido ip ON p.PedidoID = ip.PedidoID
INNER JOIN Livros l ON ip.LivroID = l.LivroID
WHERE l.Titulo LIKE '%dos%';

