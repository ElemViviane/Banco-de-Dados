						--< CURSO DE BANCO DE DADOS: POSTGRESQL >--
						 --< DOCUMENTAÇÃO PESSOAL ELEM VIVIANE >--

--< Tipos númericos >--
--> integer					    --> NUMEROS INTEIROS.
--> real						--> NUMEROS COM CASAS DECIMAIS, NUMEROS COM VIRGULA.
--> serial				    	--> SERIAL: complementa automaticamente.
--> numeric				    	--> 12345678,90.

--< Tipos de texto >--
--> varhar(n)					--> Controla o tamanho que quer.
--> char(n)					    --> Sabemos o tamanho exato.
--> text						--> Colocamos o tamanho que quisermos.

--< boolean types >--
--> boolean

--> Campos de data e hora >--
--> date						--> Coloca o ano, mês e dia, de qualquer data.
--> time 						--> É a hora o tempo, coloca também em qualquer horario.
--> timestamp					--> Coloca tanto a data como a hora nos dados.


--< BANCO DE DADOS TABELA ALUNO >--


CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC,
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_da_aula TIME,
	matriculado_em TIMESTAMP
	
);

SELECT * 
  FROM aluno;

DROP TABLE aluno;
INSERT INTO aluno (				       -->Implementar dados na tabela.
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_da_aula,
	matriculado_em

) 
VALUES(									-->Dizer o que é cada dados.
	'Paulo Victor Cruz Soares',
	'70149856820',
	'eu sou um chato',
	23,
	2500.00,
	1.74,
	TRUE,
	'1999-10-07',
	'18:55:36',
	'2022-07-15  15:20:45'
);

SELECT *
  FROM aluno
 WHERE id = 10;
 
 UPDATE aluno
	 SET nome = 'Paulo Victor',
	 cpf = '70149849130',
	 observacao = 'Hello world',
	 idade = 24,
	 dinheiro = 1000.00,
	 altura = 1.75,
	 ativo = FALSE,
	 hora_da_aula = '10:55:36',
	 matriculado_em = '2022-07-20  14:52:16'
WHERE id = 4;

SELECT *
  FROM aluno;
	
UPDATE aluno 							         -->Mudar algo nos dados da tabela.
  SET dinheiro = 5000.00
 WHERE id = 1;
	
UPDATE aluno 
  SET data_nascimento = '2000-04-13'
 WHERE id = 8;
 
   
DELETE									         -->Deletar algum dado da tabela.
  FROM aluno
 WHERE cpf = '70149849130';
  
  SELECT nome AS "Nome do Aluno",                -->para colocar titulo com espaçamento usa o AS e "" aspas. 
  		idade,
	    matriculado_em AS quando_se_matriculou   -->para colocar titulo usa AS.
	FROM aluno;

SELECT * 
  FROM aluno;

INSERT INTO aluno (nome) VALUES ('Monica Elias');
INSERT INTO aluno (nome) VALUES ('Jonas Silva');
INSERT INTO aluno (nome) VALUES ('Vania da Silva');
INSERT INTO aluno (nome) VALUES ('Vivane Domingos');
INSERT INTO aluno (nome) VALUES ('Elem viviane');
INSERT INTO aluno (nome) VALUES ('Paulo');
INSERT INTO aluno (nome) VALUES ('Paulo');

SELECT *
  FROM aluno
 WHERE nome <> 'Elem Viviane';     --> <> Diferente ou !=.
 
SELECT *
  FROM aluno
 WHERE nome LIKE '_aulo';          -->Para fazer busca de pessoas nao importa a onde coloque o _ tem que atender o 
 								   -->	requisito. E usa o like para dizer que quero isso.
--< Filtros dos caracters >--
SELECT *
  FROM aluno
 WHERE nome NOT LIKE '_aulo';    -->Não quero que a condição seja atendida.
  
SELECT *
  FROM aluno
 WHERE nome LIKE 'E%';		     -->Qualquer nome que começe com E.
   
SELECT *
  FROM aluno
 WHERE nome LIKE '%s';		     -->Qualquer nome que termine com s.
	
SELECT *
  FROM aluno
 WHERE nome LIKE '% %';          -->Qualquer coisa que tenha espaço.
	
SELECT *
  FROM aluno
 WHERE nome LIKE '%i%a';		  -->No meio tem que ter uma letra e terminar com outra letra.
   
--< Filtro do restante numeros, data, hora, boolean >--

SELECT *  
  FROM aluno 
 WHERE cpf IS NULL;   			-->Que são null.
	
SELECT *
  FROM aluno 
 WHERE cpf IS NOT NULL;			-->Que não são null.
	
SELECT *
  FROM aluno
 WHERE idade = 19;				-->Que são igual a + numero.
	
SELECT *
  FROM aluno
 WHERE idade <> 19;				-->Que são diferente de + numero.
   
SELECT *
  FROM aluno
 WHERE idade <= 19;				-->Seleciona onde idade etc é menor ou igual a numero etc.
	
SELECT *
  FROM aluno 
 WHERE idade >= 19;				-->Seleciona onde idadw etc é maior ou igual a numero etc.
	
SELECT *
  FROM aluno 
 WHERE idade > 19;				-->Seleciona idade etc maior que numero etc.
	
SELECT *
  FROM aluno
 WHERE idade < 19;				-->Seleciona idade menor que numero etc.
	
SELECT *
  FROM aluno
 WHERE idade BETWEEN 15 AND 30;
	
SELECT *
  FROM aluno
 WHERE ativo = false;
	
SELECT *
  FROM aluno
 WHERE ativo IS null;
 
SELECT * 
  FROM aluno
 WHERE nome LIKE 'E%'
   AND cpf IS NOT NULL;				-->E O CPF NÃO É NULO.
   
SELECT *
  FROM aluno
 WHERE nome LIKE 'Elem'
   OR nome LIKE 'Paulo'
   OR nome LIKE 'Monica%';
   
SELECT *
  FROM aluno
 WHERE nome LIKE '%Viviane'        -->Retorna o primeiro nome e o segundo nome.
   AND nome LIKE 'Elem%';
   
--< BANCO DE DADOS TABELA CURSO >--
--< Usando Primary Key >--

SELECT *
  FROM curso;
  
DROP TABLE curso;
  
CREATE TABLE curso(
	id INTEGER NOT NULL UNIQUE,           		-->É UM ID ÚNICO.
	nome VARCHAR(255) NOT NULL					-->NÃO PODEM VALORES NULL.
);

INSERT INTO curso (id, nome) VALUES (NULL, NULL);
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Java Script');

CREATE TABLE curso(
	id INTEGER PRIMARY KEY,		-->SIMBOLIZA O UNIQUE E NOT NULL. ELE TEM A FUNÇÃO DE COLOCAR COMO ÚNICO E NOT NULL
	nome VARCHAR(255) NOT NULL
);
   
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Java Script');
INSERT INTO curso (id, nome) VALUES (3, 'Java: Orientação a Objetos');

SELECT *
  FROM curso;
   
SELECT nome AS "Nome do Curso"
  FROM curso;
   
DROP TABLE aluno;


--< BANCO DE DADOS TABELA ALUNO >--

CREATE TABLE aluno(
	id serial PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Elem');
INSERT INTO aluno (nome) VALUES ('Paulo');

SELECT *
  FROM aluno;
  
SELECT *
  FROM curso;
  
--< VAMOS AGORA RELACIONAR AS DUAS TABELAS: CURSO E ALUNO E USANDO PRIMARY KEY E FOREIGN KEY >--
--< PRIMARY KEY: CHAVE PRIMÁRIA.
--< FOREIGN KEY: CHAVE ESTRANGEIRA.
--< REFERENCES: USA A REFERENCIAS DAS TABELAS PARA EXECUTAR O COMANDO DA FOREIGN KEY.


DROP TABLE aluno_curso;


--< BANCO DE DADOS TABELA ALUNO_CURSO >--

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)				-->Não coloca vígula.
	REFERENCES curso (id)				-->Não coloca vígula.
);
   
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);	
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);   -->Essa linha não executa pois não existe na tabela
															 -->ninguém com ID 3. pois usou a foreign key e references
SELECT *
  FROM aluno_curso;
  
SELECT *
  FROM aluno
   WHERE nome LIKE 'E%';
   
SELECT *
  FROM aluno 
   WHERE id = 1;
SELECT * 
  FROM curso 
   WHERE id = 1;

SELECT *
  FROM aluno
   	WHERE id = 2;
SELECT *
  FROM curso 
   WHERE id = 1;



--< USAR A CHAVE PRIMÁRIA E A CHAVE ESTRANGUEIRA PARA NÃO INSERIR ALUNO QUE NAO EXISTEM >--

DROP TABLE cursos;


--< BANCO DE DADOS TABELA CURSOS >--

CREATE TABLE cursos(
	id SERIAL PRIMARY KEY,
	nome_curso VARCHAR(255) NOT NULL	
);

SELECT *
  FROM cursos;
  
INSERT INTO cursos(			
	nome_curso
)
VALUES(
	'Ciência da Computação'
);

DROP TABLE alunos;

CREATE TABLE alunos(
	id SERIAL PRIMARY KEY,
	nome_aluno VARCHAR(255) NOT NULL,
	cpf CHAR(11) NOT NULL,
	data_nascimento DATE,
	matriculado_em TIMESTAMP
);

INSERT INTO alunos(
	nome_aluno,
	cpf
)
VALUES(
	'João',
	'02536925841'
);

SELECT *
  FROM alunos;
  
SELECT *
  FROM cursos;
  
DROP TABLE faculdade;

CREATE TABLE faculdade(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(aluno_id, curso_id),
	
	FOREIGN KEY (aluno_id)
	REFERENCES alunos (id)
	ON DELETE CASCADE		--> ISSO VAI APAGAR O ALUNO E AUTOMATICAMENTE DESMATRICULAR ELE DO CURSO
	ON UPDATE CASCADE		--> ISSO VAI POSSIBILITAR FAZER ALTERAÇÕES E AUTOMATICO EM OUTRAS TABELAS QUE TEM RELAÇÃO.
	,
	
	FOREIGN KEY (curso_id)
	REFERENCES cursos (id)
);

INSERT INTO faculdade(
	aluno_id,
	curso_id
)
VALUES(
	3,
	3
);

SELECT *
  FROM alunos 
 WHERE id = 3;
   
SELECT *
  FROM cursos
 WHERE id = 1;
   
SELECT *
  FROM faculdade
 WHERE curso_id = 1; 

SELECT *
  FROM faculdade;
 
SELECT *
  FROM alunos
 WHERE nome_aluno LIKE 'E%'
  	OR nome_aluno LIKE 'P%';
	
	
--< COLOCANDO JOIN EM PRÁTICA >--  
--< JOIN = JUNTAR ALGO É JUNTAR OS DADOS DAS DUAS TABELAS.
--< LIGAMOS A TABELA ALUNOS, COM A TABELA FACULDADE, PELO ID DO ALUNO DA TABELA ALUNOS.		
--< ON = ONDE

SELECT *						
  FROM alunos
 JOIN faculdade ON faculdade.aluno_id = alunos.id     
 JOIN cursos    ON cursos.id          = faculdade.curso_id	
 
--< SE QUISER MOSTRAR SÓ O NOME DO ALUNO E O NOME DO CURSO FAZ O SEGUINTE >--

SELECT alunos.nome_aluno,
       cursos.nome_curso
  FROM alunos
 JOIN faculdade ON faculdade.aluno_id = alunos.id
 JOIN cursos    ON cursos.id          = faculdade.curso_id
 
 
 				--< OU >--
				
--< USA ESSE PARA RELATÓRIOS >--
SELECT alunos.id         AS "ID do Aluno",
	   cursos.id         AS "ID do Curso",
	   alunos.nome_aluno AS "Nome do Aluno",
       cursos.nome_curso AS "Nome do Curso"					
  FROM alunos
 JOIN faculdade ON faculdade.aluno_id = alunos.id
 JOIN cursos    ON cursos.id          = faculdade.curso_id


				--< OU >--
				

SELECT alunos.nome_aluno AS nome_aluno,
       cursos.nome_curso AS nome_curso
  FROM alunos
 JOIN faculdade ON faculdade.aluno_id = alunos.id
 JOIN cursos    ON cursos.id          = faculdade.curso_id
 
 

INSERT INTO alunos (nome_aluno) VALUES ('Nico Stepatt');

INSERT INTO cursos (nome_curso, id) VALUES ('HTML', 4);
INSERT INTO cursos (nome_curso, id) VALUES ('CSS', 5);

SELECT *
  FROM cursos;
  
SELECT *
  FROM alunos;


--< USANDO O LEFT JOIN >--		

--< TENHO O DADO NA TABELA DE ALUNOS, MAIS TALVEZ NÃO TENHO O DADO NA TABELA DE CURSOS.
--< CONSEQUENTEMENTE POSSO NÃO TER NA TABELA CURSOS.
--< O LEFT JOIN SE PREOCUPA COM OS DADOS DA TABELA DA ESQUERDA.
--< POR ISSO USA O LEFT JOIN >--

SELECT alunos.nome_aluno AS "Nome do Aluno",
       cursos.nome_curso AS "Nome do Curso"
  FROM alunos													
LEFT JOIN faculdade ON faculdade.aluno_id = alunos.id    		
LEFT JOIN cursos    ON cursos.id          = faculdade.curso_id  
																

--< AGORA O INVERÇO USANDO RIGHT JOIN >--    

--< SIGNIFICA QUE TENHO UM DADO NA TABELA DE CURSOS MAIS TALVEZ NÃO TENHO O DADO NA TABELA ALUNOS.
--< CONSEQUENTEMENTE POSSO NÃO TER NA TABELA ALUNOS.
--< O RIGHT JOIN SE PREOCUPA COM OS DADOS DA TABELA DA DIREITA.
--< POR ISSO USA O RIGHT JOIN >--
												
SELECT alunos.nome_aluno AS "Nome do Aluno",    
       cursos.nome_curso AS "Nome do Curso"
  FROM alunos
RIGHT JOIN faculdade ON faculdade.aluno_id = alunos.id
RIGHT JOIN cursos    ON cursos.id          = faculdade.aluno_id

DELETE 
  FROM alunos
WHERE id = 6 ;

--< AGORA VAMOS USAR O FULL JOIN >--
--< NÃO IMPORTA SE OS DADOS ESTÃO NA DIREITA OU NA ESQUERDA EU QUERO OS DADOS DAS DUAS TABELAS.

SELECT alunos.nome_aluno AS "Nome do Aluno",
       cursos.nome_curso AS "Nome do Curso"
  FROM alunos
FULL JOIN faculdade ON faculdade.aluno_id = alunos.id
FULL JOIN cursos    ON cursos.id          = faculdade.aluno_id


--< TEMOS MAIS UM CASO CROSS JOIN >--
--< QUANDO QUEREMOS QUE TODOS OS DADOS DA TABELA A ESTEJAM RELACIONADOS COM OS DADOS DA TABELA B.
--< ELE PEGA A QUANTIDADES DE DADOS DA TABELA A E MULTIPLICAR PELA QUANTIDADE DE DADOS NA TABELA B.

SELECT alunos.nome_aluno AS "Nome do Aluno",
       cursos.nome_curso AS "Nome do Curso"
  FROM alunos
CROSS JOIN cursos

INSERT INTO alunos (
	nome_aluno,
	cpf, 
	data_nascimento,
	matriculado_em
) 
VALUES (
	'João',
	'78962154302',
	'2000-03-06',
	'2022-06-12 07:25:04'
);

SELECT *
  FROM alunos;
 
SELECT *
  FROM cursos;
  
SELECT *
  FROM faculdade;
  
UPDATE alunos
  SET cpf = '78965412302',
      data_nascimento = '1997-12-27',
	  matriculado_em = '2022-07-16  11:56:10'
 WHERE id = 3;

  
  
  
--< ORDENANDO TABLEAS COM O ORDER BY >--
--> SE QUISER EM ORDEM CRESCENTE COLOCO ASC OU COLOCO NADA POIS ELE JÁ ENETENDE.
--> SE QUISER COLOCAR EM ORDEM DECRESCENTE COLOCA DESC.

SELECT *
  FROM alunos
 ORDER BY nome_aluno DESC;
 
SELECT *
  FROM alunos 
 ORDER BY nome_aluno;
  
  
  








