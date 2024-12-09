Dim_Pais

CREATE TABLE Dim_Pais (
    ID_Pais INT PRIMARY KEY,       -- Chave Primária
    Nome_Pais VARCHAR(100)         -- Nome do país
);

--Inserção de dados na Dim_Pais
INSERT INTO Dim_Pais (ID_Pais, Nome_Pais) VALUES 
(1, 'China'),
(2, 'Espanha'),
(3, 'Tailândia'),
(4, 'Turquia'),
(5, 'Irã'),
(6, 'México'),
(7, 'Taiwan (Formosa)'),
(8, 'Índia'),
(9, 'Bangladesh'),
(10, 'Vietnã'),
(11, 'Países Baixos (Holanda)'),
(12, 'Rússia'),
(13, 'Indonésia'),
(14, 'Itália'),
(15, 'Argélia'),
(16, 'Japão'),
(17, 'Egito'),
(18, 'Reino Unido'),
(19, 'Polônia'),
(20, 'Coreia do Sul'),
(21, 'Alemanha'),
(22, 'Iraque'),
(23, 'França'),
(24, 'Tunísia'),
(25, 'Noruega'),
(26, 'Chile'),
(27, 'Argentina'),
(28, 'Portugal'),
(29, 'Arábia Saudita'),
(30, 'Eslovênia'),
(31, 'Israel'),
(32, 'Estados Unidos'),
(33, 'Malásia'),
(34, 'Grécia'),
(35, 'Costa Rica'),
(36, 'Dinamarca'),
(37, 'Romênia'),
(38, 'Venezuela'),
(39, 'Emirados Árabes Unidos'),
(40, 'Bélgica'),
(41, 'Líbano'),
(42, 'República Dominicana'),
(43, 'Uruguai'),
(44, 'Omã'),
(45, 'Austrália'),
(46, 'Suíça'),
(47, 'Honduras'),
(48, 'Colômbia'),
(49, 'Guiana'),
(50, 'Aruba'),
(51, 'Canadá'),
(52, 'Jamaica'),
(53, 'Peru'),
(54, 'Coveite (Kuweit)'),
(55, 'Senegal'),
(56, 'Virgens, Ilhas (Britânicas)'),
(57, 'Guatemala'),
(58, 'Paraguai'),
(59, 'El Salvador'),
(60, 'Quênia'),
(61, 'Lituânia'),
(62, 'Nicarágua'),
(63, 'Equador'),
(64, 'Áustria'),
(65, 'Panamá'),
(66, 'Paquistão'),
(67, 'Bolívia'),
(68, 'Madagascar'),
(69, 'Libéria'),
(70, 'Marshall, Ilhas'),
(71, 'Singapura'),
(72, 'Chipre'),
(73, 'Hong Kong'),
(74, 'Malta'),
(75, 'Gibraltar'),
(76, 'Bahamas'),
(77, 'Antígua e Barbuda'),
(78, 'Ilha de Man'),
(79, 'Guiné-Bissau'),
(80, 'Cook, Ilhas'),
(81, 'Bulgária'),
(82, 'Marrocos'),
(83, 'África do Sul'),
(84, 'Moçambique'),
(85, 'Jordânia'),
(86, 'Cuba'),
(87, 'Maurício'),
(88, 'Filipinas'),
(89, 'Curaçao'),
(90, 'Suriname'),
(91, 'Cabo Verde'),
(92, 'São Vicente e Granadinas'),
(93, 'Barbados'),
(94, 'Irlanda'),
(95, 'Cayman, Ilhas'),
(96, 'Mianmar'),
(97, 'Angola'),
(98, 'Luxemburgo'),
(99, 'Ucrânia'),
(100, 'Gana'),
(101, 'Liechtenstein'),
(102, 'Serra Leoa'),
(103, 'Finlândia'),
(104, 'Nova Zelândia'),
(105, 'Afeganistão'),
(106, 'Toquelau'),
(107, 'Catar'),
(108, 'Estônia'),
(109, 'Pacífico, Ilhas do (EUA)'),
(110, 'Croácia');

Dim_Produto
CREATE TABLE Dim_Produto (
    ID_Produto INT PRIMARY KEY,        -- Chave Primária
    Codigo_NCM VARCHAR(20),            -- Código NCM do produto
    Descricao_NCM VARCHAR(255)         -- Descrição do produto
);

-- Inserção de dados na Dim_Produto
INSERT INTO Dim_Produto (ID_Produto, Codigo_NCM, Descricao_NCM) VALUES
(101, '12019000', 'Soja, mesmo triturada, exceto para semeadura'),
(102, '15071000', 'Óleo de soja, em bruto, mesmo degomado'),
(103, '23040010', 'Farinhas e pellets, da extração do óleo de soja'),
(104, '15079090', 'Outros óleos de soja');

Dim_Categoria

CREATE TABLE Dim_Categoria (
    ID_Categoria INT PRIMARY KEY,        -- Chave Primária
    Nome_Categoria VARCHAR(255)          -- Nome da Categoria
);

--Inserção de dados na Dim_Categoria

INSERT INTO Dim_Categoria (ID_Categoria, Nome_Categoria) VALUES
(201, 'Valor FOB'),
(202, 'Quilograma Líquido Milhões de Toneladas'),
(203, 'Quantidade Estatística Milhões de Toneladas');
