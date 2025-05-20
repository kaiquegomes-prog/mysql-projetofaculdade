CREATE DATABASE Sistema_faculdade;
USE Sistema_faculdade;

CREATE TABLE tbl_professor (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (150) NOT NULL,
    disciplina VARCHAR (50) NOT NULL,
    UNIQUE INDEX (id)
);

CREATE TABLE tbl_telefone (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    id_professor INT NOT NULL,

    CONSTRAINT fk_professor_telefone
    FOREIGN KEY (id_professor)
    REFERENCES tbl_professor(id)
);

CREATE TABLE tbl_email (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (260) NOT NULL,
    id_professor INT NOT NULL,
    
    CONSTRAINT fk_professor_email
    FOREIGN KEY (id_professor)
    REFERENCES tbl_professor(id)
);

CREATE TABLE tbl_materia (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_materia VARCHAR (100) NOT NULL,
    carga_horaria VARCHAR (100) NOT NULL,
    inicio_materia DATE NOT NULL,
    id_professor INT NOT NULL,
    
    CONSTRAINT fk_professor_materia
    FOREIGN KEY (id_professor)
    REFERENCES tbl_professor(id)
);

CREATE TABLE tbl_curso(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR (60) NOT NULL,
    nivel VARCHAR(30) NOT NULL,
    semestre VARCHAR (40) NOT NULL,
    modalidade VARCHAR (45) NOT NULL,
    id_materia INT NOT NULL,
    
    CONSTRAINT fk_materia_curso
    FOREIGN KEY (id_materia)
    REFERENCES tbl_materia(id)
);

CREATE TABLE tbl_aluno(
	re INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (150) NOT NULL,
    cpf VARCHAR (15) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR (100) NOT NULL,
    cep VARCHAR (10) NOT NULL,
    estado VARCHAR (50) NOT NULL,
    cidade VARCHAR (50) NOT NULL,
    rua VARCHAR (70) NOT NULL,
    bairro VARCHAR (50),
    id_curso INT NOT NULL,
    
    CONSTRAINT fk_curso_aluno
    FOREIGN KEY (id_curso)
    REFERENCES tbl_curso (id)
);

CREATE TABLE tbl_email_aluno (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (260) NOT NULL,
    re_aluno INT NOT NULL,
    
    CONSTRAINT fk_aluno_email
    FOREIGN KEY (re_aluno)
    REFERENCES tbl_aluno(re)
);

CREATE TABLE tbl_telefone_aluno (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    re_aluno INT NOT NULL,

    CONSTRAINT fk_aluno_telefone
    FOREIGN KEY (re_aluno)
    REFERENCES tbl_aluno(re)
);

CREATE TABLE tbl_notas (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nota_1 DECIMAL(5,2) NOT NULL,
    nota_2 DECIMAL(5,2) NOT NULL,
    nota_final DECIMAL(5,2) NOT NULL,
    media DECIMAL(5,2) NOT NULL,
    situacao VARCHAR(50) NOT NULL,
    re_aluno INT NOT NULL,
    id_materia INT NOT NULL,

    CONSTRAINT fk_aluno_notas
    FOREIGN KEY (re_aluno)
    REFERENCES tbl_aluno(re),

    CONSTRAINT fk_materia_notas
    FOREIGN KEY (id_materia)
    REFERENCES tbl_materia(id)
);






SHOW TABLES;
RENAME TABLE tbl_email TO tbl_email_professor;
RENAME TABLE tbl_telefone TO tbl_telefone_professor;




