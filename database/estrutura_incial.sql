CREATE DATABASE IF NOT EXISTS sistema_gri;
USE sistema_gri;

CREATE TABLE empresas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('admin', 'usuario') DEFAULT 'usuario',
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE indicadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE respostas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    indicador_id INT,
    resposta TEXT,
    status ENUM('pendente', 'preenchido', 'revisado') DEFAULT 'pendente',
    data_resposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (indicador_id) REFERENCES indicadores(id)
);

CREATE TABLE anexos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resposta_id INT,
    arquivo VARCHAR(255),
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (resposta_id) REFERENCES respostas(id)
);
