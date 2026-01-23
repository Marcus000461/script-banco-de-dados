--- 1. TABELA USUÁRIO
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    login VARCHAR(50),
    email VARCHAR(20),
    contato VARCHAR(15),
    validade_matricula DATE,
    historico TEXT, -- Pode armazenar um resumo de atividades
    adimplente BOOLEAN -- Indica se possui multas pendentes
);

--- 2. TABELA EXEMPLAR
CREATE TABLE exemplar (
    id SERIAL PRIMARY KEY,
    codigo_exemplar VARCHAR(50),
    nome_da_obra VARCHAR(200),
    autor VARCHAR(150),
    assunto TEXT,
    cutter VARCHAR(20), -- Código de classificação de autor
    genero VARCHAR(50),
    data_lancamento DATE,
    cidade VARCHAR(100),
    estado CHAR(2),
    disponibilidade BOOLEAN,
    quantidade_total INT,
    unidades_disponiveis INT
);

--- 3. TABELA AVALIAÇÃO
CREATE TABLE avaliacao (
    id SERIAL PRIMARY KEY,
    id_exemplar INT,
    id_usuario INT,
    avaliacao_leitor TEXT, -- O comentário em si
    nota_geral DECIMAL(3,1), -- Ex: 4.5
    regiao VARCHAR(100) -- Região de onde a avaliação foi feita
);

--- 4. TABELA RESERVA (Controle de Empréstimos e Reservas)
CREATE TABLE reserva (
    id SERIAL PRIMARY KEY,
    id_usuario INT,
    id_exemplar INT,
    data_reserva DATE,
    data_emprestimo DATE,
    prazo_de_devolucao DATE,
    data_devolucao DATE,
    tempo_de_espera INT, -- Dias na fila
    numero_da_fila INT,
    status VARCHAR(20), -- 'Reservado', 'Emprestado', 'Devolvido'
    emprestimos_ativos INT, -- Contador de livros com o usuário
    renovacao INT -- Quantas vezes foi renovado
);

--- 5. TABELA INTERESSE
CREATE TABLE interesse (
    id SERIAL PRIMARY KEY,
    id_usuario INT,
    id_exemplar INT,
    data_registro TIMESTAMP
);

--- 6. TABELA PALAVRA-CHAVE
CREATE TABLE palavra_chave (
    id SERIAL PRIMARY KEY,
    id_exemplar INT,
    descricao VARCHAR(100)
);

select * from usuario

select * from exemplar

select * from avaliacao

select * from reserva

select * from interesse

select * from palavra_chave

alter table avaliacao add foreign key (id_usuario) references usuario(id);

alter table avaliacao add foreign key (id_exemplar) references exemplar(id);

alter table reserva add foreign key (id_usuario) references usuario(id);

alter table reserva add foreign key (id_exemplar) references exemplar(id);

alter table interesse add foreign key (id_usuario) references usuario(id);

alter table interesse add foreign key (id_exemplar) references exemplar(id);

alter table palavra_chave add foreign key (id_exemplar) references exemplar(id);

-- Usuarios
INSERT INTO usuario (nome, email, login, validade_matricula, adimplente) VALUES 
('Ana Souza', 'ana@email.com', 'anas', '2026-12-31', true), 
('Bruno Lima', 'bruno@email.com', 'brunol', '2026-06-15', false),
('Carla Dias', 'carla@email.com', 'carlad', '2026-10-20', true), 
('Daniel Vaz', 'daniel@email.com', 'danielv', '2026-08-12',true),
('Elisa Noé', 'elisa@email.com', 'elisan', '2026-11-05', false), 
('Fabio Rei', 'fabio@email.com', 'fabior', '2027-01-30', false),
('Gisele Me', 'gisele@email.com', 'giselem', '2026-09-22', true), 
('Helio Oz', 'helio@email.com', 'helioo', '2026-07-18', false),
('Igor Tuz', 'igor@email.com', 'igort', '2026-12-01', false), 
('Julia Aa', 'julia@email.com', 'juliaa', '2027-02-14', true);

-- Exemplares (Versão Completa)
INSERT INTO exemplar (
    nome_da_obra, 
    autor, 
    disponibilidade, 
    codigo_exemplar, 
    genero, 
    assunto, 
    cutter, 
    data_lancamento, 
    cidade, 
    estado
) VALUES  
('Dom Casmurro', 'Machado de Assis', true, 'EX001', 'Clássico', 'A dúvida sobre a traição de Capitu.', 'M149d', '1899-01-01', 'Rio de Janeiro', 'RJ'),  
('O Hobbit', 'J.R.R Tolkien', true, 'EX002', 'Fantasia', 'A jornada de Bilbo Bolseiro.', 'T649h', '1937-09-21', 'Londres', 'UK'),
('1984', 'George Orwell', true, 'EX003', 'Distopia', 'Vigilância estatal e totalitarismo.', 'O79n', '1949-06-08', 'Londres', 'UK'),
('Sapiens', 'Yuval Harari', false, 'EX004', 'História', 'A evolução da humanidade.', 'H254s', '2011-01-01', 'Jerusalém', 'IL'),
('Duna', 'Frank Herbert', true, 'EX005', 'Ficção Científica', 'Conflitos políticos no planeta Arrakis.', 'H536d', '1965-08-01', 'Filadélfia', 'PA'),  
('A Hora da Estrela', 'Clarice Lispector', true, 'EX006', 'Literatura', 'A vida miserável de Macabéa.', 'L769h', '1977-10-26', 'Rio de Janeiro', 'RJ'),
('Clean Code', 'Robert Martin', false, 'EX007', 'Tecnologia', 'Boas práticas de programação.', 'M381c', '2008-08-01', 'Boston', 'MA'),  
('Drácula', 'Bram Stoker', true, 'EX008', 'Terror', 'O confronto entre Van Helsing e o vampiro.', 'S875d', '1897-05-26', 'Westminster', 'UK'),
('Sherlock Holmes', 'Arthur Conan Doyle', true, 'EX009', 'Mistério', 'As aventuras do detetive de Baker Street.', 'D754s', '1892-10-14', 'Londres', 'UK'),  
('Hamlet', 'Shakespeare', true, 'EX010', 'Teatro', 'A vingança do príncipe da Dinamarca.', 'S527h', '1603-01-01', 'Stratford', 'UK');

-- Interesse
INSERT INTO interesse (id_usuario, id_exemplar) VALUES 
(1,2), 
(2,5), 
(3,1), 
(4,7), 
(5,10), 
(6,3), 
(7,8), 
(8,9), 
(9,4), 
(10,6);

-- Palavras Chave (Usando 'dscrição' conforme a imagem)
INSERT INTO palavra_chave (id_exemplar, descricao) VALUES 
(1, 'Romance'), 
(2, 'Aventura'), 
(3, 'Política'), 
(4, 'Evolução'),
(5, 'Espaço'),
(6, 'Existencialismo'),
(7, 'Código'), 
(8, 'Vampiros'), 
(9, 'Detetive'), 
(10, 'Tragédia');

-- Reservas
INSERT INTO reserva (id_usuario, id_exemplar, status, data_reserva, numero_da_fila) VALUES 
(1,2,'Ativa','2026-01-20',1), 
(2,5,'Ativa','2026-01-21',1), 
(3,1,'Concluída','2026-01-05',0),
(4,7,'Pendente','2026-01-19',2), 
(5,10,'Ativa','2026-01-18',1), 
(6,3,'Cancelada','2026-01-10',0),
(7,8,'Ativa','2026-01-22',1), 
(8,9,'Pendente','2026-01-15',3), 
(9,4,'Ativa','2026-01-10',1),
(10,6,'Concluída','2026-01-12',0);

-- Avaliações
INSERT INTO avaliacao (id_usuario, id_exemplar, nota_geral, avaliacao_leitor) VALUES 
(1,1,5.0,'Obra prima'), 
(2,2,4.5,'Muito bom'), 
(3,3,4.0,'Assustador'), 
(4,4,5.0,'Leitura obrigatória'),
(5,5,4.8,'Excelente'), 
(6,6,3.5,'Interessante'), 
(7,7,5.0,'Essencial para dev'), 
(8,8,4.2,'Clássico imortal'),
(9,9,4.7,'Enigmático'), 
(10,10,4.9,'Emocionante');
