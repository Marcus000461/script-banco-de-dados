- Usuarios
INSERT INTO Usuario (nome, email, login, validade_da_matricula) VALUES 
('Ana Souza', 'ana@email.com', 'anas', '2026-12-31'), ('Bruno Lima', 'bruno@email.com', 'brunol', '2026-06-15'),
('Carla Dias', 'carla@email.com', 'carlad', '2026-10-20'), ('Daniel Vaz', 'daniel@email.com', 'danielv', '2026-08-12'),
('Elisa Noé', 'elisa@email.com', 'elisan', '2026-11-05'), ('Fabio Rei', 'fabio@email.com', 'fabior', '2027-01-30'),
('Gisele Me', 'gisele@email.com', 'giselem', '2026-09-22'), ('Helio Oz', 'helio@email.com', 'helioo', '2026-07-18'),
('Igor Tuz', 'igor@email.com', 'igort', '2026-12-01'), ('Julia Aa', 'julia@email.com', 'juliaa', '2027-02-14');

-- Exemplares
INSERT INTO Exemplar (nome_da_obra, autor, disponibilidade, codigo_do_exemplar, genero) VALUES 
('Dom Casmurro', 'Machado de Assis', 1, 'EX001', 'Clássico'), ('O Hobbit', 'J.R.R Tolkien', 1, 'EX002', 'Fantasia'),
('1984', 'George Orwell', 1, 'EX003', 'Distopia'), ('Sapiens', 'Yuval Harari', 0, 'EX004', 'História'),
('Duna', 'Frank Herbert', 1, 'EX005', 'Ficção Científica'), ('A Hora da Estrela', 'Clarice Lispector', 1, 'EX006', 'Literatura'),
('Clean Code', 'Robert Martin', 0, 'EX007', 'Tecnologia'), ('Drácula', 'Bram Stoker', 1, 'EX008', 'Terror'),
('Sherlock Holmes', 'Arthur Conan Doyle', 1, 'EX009', 'Mistério'), ('Hamlet', 'Shakespeare', 1, 'EX010', 'Teatro');

-- Interesse
INSERT INTO interesse (id_usuario, id_exemplar) VALUES 
(1,2), (2,5), (3,1), (4,7), (5,10), (6,3), (7,8), (8,9), (9,4), (10,6);

-- Palavras Chave (Usando 'dscrição' conforme a imagem)
INSERT INTO palavra_chave (id_exemplar, dscrição) VALUES 
(1, 'Romance'), (2, 'Aventura'), (3, 'Política'), (4, 'Evolução'), (5, 'Espaço'),
(6, 'Existencialismo'), (7, 'Código'), (8, 'Vampiros'), (9, 'Detetive'), (10, 'Tragédia');

-- Reservas
INSERT INTO Reserva (id_usuario, id_exemplar, status, data_de_reserva, numero_da_fila, adimplente) VALUES 
(1,2,'Ativa','2026-01-20',1,1), (2,5,'Ativa','2026-01-21',1,1), (3,1,'Concluída','2026-01-05',0,1),
(4,7,'Pendente','2026-01-19',2,1), (5,10,'Ativa','2026-01-18',1,1), (6,3,'Cancelada','2026-01-10',0,0),
(7,8,'Ativa','2026-01-22',1,1), (8,9,'Pendente','2026-01-15',3,1), (9,4,'Ativa','2026-01-10',1,1),
(10,6,'Concluída','2026-01-12',0,1);

-- Avaliações
INSERT INTO Avaliacao (id_usuario, id_exemplar, nota_geral, avaliacao_do_leitor) VALUES 
(1,1,5.0,'Obra prima'), (2,2,4.5,'Muito bom'), (3,3,4.0,'Assustador'), (4,4,5.0,'Leitura obrigatória'),
(5,5,4.8,'Excelente'), (6,6,3.5,'Interessante'), (7,7,5.0,'Essencial para dev'), (8,8,4.2,'Clássico imortal'),
(9,9,4.7,'Enigmático'), (10,10,4.9,'Emocionante');