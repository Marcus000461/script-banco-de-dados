select * from exemplar
where disponibilidade is true;


select * from exemplar e 
left join palavra_chave p on 
e.id = p.id_exemplar
where e.autor = :autor
or e.assunto = :assunto
or e.nome_da_obra = :obra
or p.descricao  = :descricao;




