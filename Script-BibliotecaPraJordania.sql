--- 1. TABELA USUÁRIO
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contato VARCHAR(15),
    validade_matricula DATE,
    historico TEXT, -- Pode armazenar um resumo de atividades
    adimplente BOOLEAN DEFAULT TRUE -- Indica se possui multas pendentes
);

--- 2. TABELA EXEMPLAR
CREATE TABLE exemplar (
    id_exemplar SERIAL PRIMARY KEY,
    codigo_exemplar VARCHAR(50) UNIQUE NOT NULL,
    nome_da_obra VARCHAR(200) NOT NULL,
    autor VARCHAR(150),
    assunto TEXT,
    cutter VARCHAR(20), -- Código de classificação de autor
    genero VARCHAR(50),
    data_lancamento DATE,
    cidade VARCHAR(100),
    estado CHAR(2),
    disponibilidade BOOLEAN DEFAULT TRUE,
    quantidade_total INT,
    unidades_disponiveis INT
);

--- 3. TABELA AVALIAÇÃO
CREATE TABLE avaliacao (
    id_avaliacao SERIAL PRIMARY KEY,
    id_exemplar INT REFERENCES exemplar(id_exemplar) ON DELETE CASCADE,
    id_usuario INT REFERENCES usuario(id_usuario),
    avaliacao_leitor TEXT, -- O comentário em si
    nota_geral DECIMAL(3,1), -- Ex: 4.5
    regiao VARCHAR(100) -- Região de onde a avaliação foi feita
);

--- 4. TABELA RESERVA (Controle de Empréstimos e Reservas)
CREATE TABLE reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuario(id_usuario),
    id_exemplar INT REFERENCES exemplar(id_exemplar),
    data_reserva DATE DEFAULT CURRENT_DATE,
    data_emprestimo DATE,
    prazo_de_devolucao DATE,
    data_devolucao DATE,
    tempo_de_espera INT, -- Dias na fila
    numero_da_fila INT,
    status VARCHAR(20), -- 'Reservado', 'Emprestado', 'Devolvido'
    emprestimos_ativos INT, -- Contador de livros com o usuário
    renovacao INT DEFAULT 0 -- Quantas vezes foi renovado
);

--- 5. TABELA INTERESSE
CREATE TABLE interesse (
    id_interesse SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuario(id_usuario),
    id_exemplar INT REFERENCES exemplar(id_exemplar),
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--- 6. TABELA PALAVRA-CHAVE
CREATE TABLE palavra_chave (
    id_palavra SERIAL PRIMARY KEY,
    id_exemplar INT REFERENCES exemplar(id_exemplar) ON DELETE CASCADE,
    descricao VARCHAR(100) NOT NULL
); s