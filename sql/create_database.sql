CREATE DATABASE livraria;
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    endereco TEXT,
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    biografia TEXT
);
CREATE TABLE editoras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    site VARCHAR(255)
);
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    imagem_capa VARCHAR(255),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_autor INT,
    id_editora INT,
    id_categoria INT,
    CONSTRAINT fk_livros_autores FOREIGN KEY (id_autor) REFERENCES autores(id),
    CONSTRAINT fk_livros_editoras FOREIGN KEY (id_editora) REFERENCES editoras(id),
    CONSTRAINT fk_livros_categorias FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);
CREATE TABLE carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT DEFAULT 1,
    data_adicao DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_carrinho_usuarios FOREIGN KEY (id_cliente) REFERENCES usuarios(id),
    CONSTRAINT fk_carrinho_livros FOREIGN KEY (id_livro) REFERENCES livros(id)
);
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pendente', 'Pago', 'Enviado', 'Cancelado') DEFAULT 'Pendente',
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_pedidos_usuarios FOREIGN KEY (id_cliente) REFERENCES usuarios(id)
);
CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_livro INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_itenspedido_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    CONSTRAINT fk_itenspedido_livros FOREIGN KEY (id_livro) REFERENCES livros(id)
);