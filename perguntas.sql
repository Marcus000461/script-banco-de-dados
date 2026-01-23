--1- Como consultar quais exemplares estão disponíveis para empréstimo?

	--o sistema vai consultar a tabela exemplar para verificar a dsponibilidade .

--2- É possível pesquisar por título, autor, assunto ou palavra-chave?

--sim pois todas essas informaçoes estão disponiveis respectivamente nas tabelas obra,exemplar e palavra chave deste modo viabilizando a pesquisa.


--3- O usuário consegue visualizar a localização física da obra na biblioteca?

--sim é possivel achar a localização do livro na biblioteca atraves do codigo cutter disponibilizado na tabela exemplar


--4- Como realizar uma reserva de um livro emprestado?

--o usuario pode entrar numa listade espera onde o sistema vai consultar a tabela reserva para retornar o tempo de espera
--e sua possição na fila.


--5- O sistema informa a posição na fila de espera da reserva?

--na tabela reserva é possivel a consulta da lista de espera para o emprestimo de um livro fora de estoque.


--6- É possível consultar meus empréstimos ativos e a data de devolução?

-- sim é posivel pela tabela reserva atravez das colunas data de devolução e emprestimos ativos


--7- O usuário recebe alerta de devolução ou atraso?

--atraves da coluna adimplemte na tabela reserva o sistema pode verificar se o emprestimo esta em ida ou n e mandar um email automatico para o usuario


--8- É possível renovar um empréstimo pelo sistema?

--sim é possivel pela tabela reserva que possui a coluna renovação


--9- O sistema mostra o histórico de empréstimos do usuário?

--sim a tabela usuario armazena o historico na coluna histórico 

--10- O usuário consegue ver sugestões de obras relacionadas?

--sim pela tabela palavras chave que faz esse intermédio


