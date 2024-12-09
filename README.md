# Exportações da Soja Brasileira: Uma Visão Geral de 2020 a 2024

## 1. Objetivo do Projeto

Realizar uma análise detalhada dos dados de exportação de soja do Brasil entre 2020 e 2024, com foco nos diferentes tipos de soja exportados, incluindo:
- **Farinhas e pellets da extração do óleo de soja**
- **Óleo de soja, em bruto, mesmo degomado**
- **Outros óleos de soja**
- **Soja, mesmo triturada, exceto para semeadura**

A análise considera as categorias de:
- **Valor FOB**: Valor das mercadorias exportadas.
- **Quantidade Estatística (Milhões de Toneladas)**: Volume estatístico exportado.
- **Quilograma Líquido (Milhões de Toneladas)**: Peso líquido exportado.

O projeto fornece insights sobre o desempenho das exportações, comparando volumes, valores e destinos durante o período mencionado. **Observação:** A coleta de dados foi realizada em **12 de novembro de 2024**, sendo a análise limitada até essa data.

---

## 2. Coleta de Dados

- **Fonte dos Dados**: Plataforma **ComexStat**, que fornece informações de comércio exterior do Brasil, como:
  - Países de destino.
  - Códigos NCM (Nomenclatura Comum do Mercosul).
  - Valor FOB.
  - Quantidade Estatística.
  - Quilograma Líquido.

- **Período Analisado**: 2020 a 2024.
- **Formato dos Dados**: Dados exportados no formato **CSV** e carregados no **Excel**.

---

## 3. Tratamento dos Dados

### Categorias de Soja Consideradas
- **Farinhas e pellets da extração do óleo de soja**
- **Óleo de soja, em bruto, mesmo degomado**
- **Outros óleos de soja**
- **Soja, mesmo triturada, exceto para semeadura**

### Tipos de Indicadores
- **Valor FOB (US$)**: Valor total das mercadorias exportadas.
- **Quilograma Líquido (Milhões de Toneladas)**: Peso líquido exportado.
- **Quantidade Estatística (Milhões de Toneladas)**: Medida estatística do volume exportado.
### Ferramentas Utilizadas no Processo de ETL

1. **Excel**:
   - Utilizado para o tratamento inicial dos dados, como:
     - Organização e formatação.
     - Limpeza e padronização.
     - Tratamento de colunas.

---

### Colunas Identificadas na Planilha Original

- **Países**
- **Código NCM**
- **Descrição NCM**
- **Unidade Estatística**
- **Valores FOB por Ano**
- **Quilograma Líquido por Ano**
- **Quantidade Estatística por Ano**

---

### Organização dos Dados

1. **Separação de Tabelas**:
   - Com base nos dados originais, foi estruturada a separação das tabelas para construção de dimensões e da tabela de valores (fato).

2. **Remoção de Colunas Irrelevantes**:
   - A coluna **Unidade Estatística (Tonelada Métrica Líquida)** foi removida por ser irrelevante para a análise.

3. **Normalização de Valores**:
   - A tabela principal foi reorganizada:
     - Substituição dos nomes de **países**, **categorias** e **produtos** por seus respectivos **IDs**, relacionados às dimensões.
     - Inclusão de uma coluna para representar os anos (2020 a 2024).
     - Consolidação das informações de valores em uma única coluna.

---

### Formatações Realizadas

- **Valor FOB**:
  - Formatado como moeda (R$).
- **Quilograma Líquido e Quantidade Estatística**:
  - Formatados como números com duas casas decimais.
- **Padronização Geral**:
  - Estruturação e padronização das tabelas para garantir consistência e legibilidade.

---

### Tratamento dos Dados

1. **Eliminação de Dados Irrelevantes**:
   - Exclusão de colunas desnecessárias.
   - Remoção de células vazias e dados duplicados.

2. **Renomeação de Colunas**:
   - Atribuição de nomes mais intuitivos para facilitar o entendimento:
     - Ex.: “Ano”, “País”, “Código NCM”, “Categoria”, “Valor”.

---

### Construção da Tabela de Valores

1. **Extração de Dados**:
   - As colunas extraídas foram: **Ano**, **País**, **Descrição NCM**, **Código NCM**, **Categoria** e **Valor**.
   
2. **Substituição por IDs**:
   - Nomes de **países**, **produtos (Código NCM)** e **categorias** foram substituídos por seus respectivos IDs, otimizando o modelo relacional.

3. **Unificação dos Dados**:
   - Todos os dados foram consolidados em uma única tabela chamada **Fato_Valores**, com as seguintes colunas:
     - **Ano**
     - **ID_Pais**
     - **ID_Produto**
     - **ID_Categoria**
     - **Valor**

4. **Garantia de Referências**:
   - O processo foi estruturado para assegurar consistência entre as tabelas de dimensões (País, Produto, Categoria) e a tabela fato.

---

Com isso, o processo de tratamento de dados foi finalizado, garantindo organização, padronização e a criação de uma base sólida para análises no Power BI.

## SQL: Criação de Dimensões

As dimensões foram criadas para organizar os dados de forma relacional. Cada dimensão foi projetada com um propósito específico:

1. **Dim_País**: Criada a partir da coluna de países, com atribuição de IDs únicos.
2. **Dim_Produto**: Criada a partir dos códigos e descrições NCM, com IDs únicos.
3. **Dim_Categoria**: Criada para associar IDs às categorias (Valor FOB, Quilograma Líquido e Quantidade Estatística).

---
```
### Tabela Dim_Pais

CREATE TABLE Dim_Pais (
    ID_Pais INT PRIMARY KEY,       -- Chave Primária
    Nome_Pais VARCHAR(100)         -- Nome do país
);

-- Inserção de dados na Dim_Pais
INSERT INTO Dim_Pais (ID_Pais, Nome_Pais) VALUES 
(1, 'China'),
(2, 'Espanha'),
(3, 'Tailândia'),
(4, 'Turquia');
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

### Tabela Dim_Produto

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


### Tabela Dim_Categoria

CREATE TABLE Dim_Categoria (
    ID_Categoria INT PRIMARY KEY,        -- Chave Primária
    Nome_Categoria VARCHAR(255)          -- Nome da Categoria
);

-- Inserção de dados na Dim_Categoria
INSERT INTO Dim_Categoria (ID_Categoria, Nome_Categoria) VALUES
(201, 'Valor FOB'),
(202, 'Quilograma Líquido Milhões de Toneladas'),
(203, 'Quantidade Estatística Milhões de Toneladas');
```

### Modelagem de Dados no Power BI

#### Relacionamento Entre Tabelas

1. **Valores ↔ Dim_Pais**  
   - **Chave Relacional**: `Valores.ID_Pais = Dim_Pais.ID_Pais
   - **Cardinalidade**: Muitos para Um (* - 1)  
   - **Descrição**:  
     A tabela **Dim_Pais** contém informações únicas sobre os países de destino das exportações, como o nome do país. Na tabela **Valores**, o campo `ID_Pais` é utilizado para identificar o país correspondente, garantindo consistência e evitando duplicação de informações.

2. **Valores ↔ Dim_Produto**  
   - **Chave Relacional**: `Valores.ID_Produto = Dim_Produto.ID_Produto`  
   - **Cardinalidade**: Muitos para Um (* - 1)  
   - **Descrição**:  
     A tabela **Dim_Produto** contém informações detalhadas sobre os produtos exportados, como o código e a descrição NCM. Na tabela **Valores**, o campo `ID_Produto` vincula cada registro às características do produto exportado.

3. **Valores ↔ Dim_Categoria**  
   - **Chave Relacional**: `Valores.ID_Categoria = Dim_Categoria.ID_Categoria`  
   - **Cardinalidade**: Muitos para Um (* - 1)  
   - **Descrição**:  
     A tabela **Dim_Categoria** define as categorias de análise, como **Valor FOB**, **Quilograma Líquido**, e **Quantidade Estatística**. Cada registro na tabela **Valores** está associado a uma única categoria representada na **Dim_Categoria**.

---

### Criação do Dashboard

No Power BI, os seguintes elementos foram criados para análise dos resultados de cada descrição NCM de acordo com as categorias:
- **Filtros**: Para seleção dinâmica de dados.
- **Cartões**: Para exibição de métricas resumidas.
- **Gráficos**: Representação visual de tendências e comparações.
- **Tabelas**: Detalhamento das métricas por categoria e país.
- **Mapas**: Visualização geográfica dos principais destinos de exportação.

---

## Resultados Obtidos

### Farinhas e Pellets da Extração do Óleo de Soja

#### Valor FOB
- **Total Exportado**: R$ 10.484.267.970,00  
- **Análise Temporal (2020-2024)**:  
  Crescimento de 17,55% em 2021, seguido por 96,86% em 2022 e 5,48% em 2023, com queda de 28,65% em 2024.  
- **Principais Destinos**:  
  1. Indonésia  
  2. Polônia  
  3. Tailândia  

#### Quantidade Estatística
- **Total Exportado**: 22,06 milhões de toneladas estatísticas  
- **Análise Temporal (2020-2024)**:  
  Constante entre 2020 e 2021 com aumento de 7,01%, seguido por aumento de 57,14% em 2022 e crescimento adicional de 6,44% em 2023. Em 2024, houve queda de 17,05%.  
- **Principais Destinos**:  
  1. Indonésia  
  2. Polônia  
  3. Tailândia  

#### Quilograma Líquido
- **Total Exportado**: 22.057,12 milhões de quilogramas  
- **Análise Temporal (2020-2024)**:  
  Crescimento de 7,23% em 2021, seguido por 56,91% em 2022 e 6,54% em 2023. Em 2024, houve queda de 17,21%.  
- **Principais Destinos**:  
  1. Indonésia  
  2. Polônia  
  3. Tailândia  

---

### Óleo de Soja, em Bruto, Mesmo Degomado

#### Valor FOB
- **Total Exportado**: R$ 9.083.299.067,00  
- **Análise Temporal (2020-2024)**:  
  Crescimento de 193,72% em 2021, seguido por 105,65% em 2022 com queda de 36,93% em 2023 e outra de 57,69% em 2024.  
- **Principais Destinos**:  
  1. Índia  
  2. China  
  3. Bangladesh  

#### Quantidade Estatística
- **Total Exportado**: 7,99 milhões de toneladas estatísticas  
- **Análise Temporal (2020-2024)**:  
  Crescimento de 58,06% em 2021, seguido por 62,59% em 2022 com queda de 10,46% em 2023 e outra de 50,47% em 2024.  
- **Principais Destinos**:  
  1. Índia  
  2. China  
  3. Bangladesh  

#### Quilograma Líquido
- **Total Exportado**: 7.957,44 milhões de quilogramas  
- **Análise Temporal (2020-2024)**:  
  Crescimento de 57,44% em 2021, seguido por 63,78% em 2022 com queda de 10,65% em 2023 e outra de 51,71% em 2024.  
- **Principais Destinos**:  
  1. Índia  
  2. China  
  3. Bangladesh  

---

### Outros Óleos de Soja

#### Valor FOB
- **Total Exportado**: R$ 817.550,00  
- **Análise Temporal (2020-2024)**:  
  Queda de 55,14% em 2021, aumento de 30,16% em 2022, crescimento expressivo de 65,20% em 2023 e queda acentuada de 70,17% em 2024.  
- **Principais Destinos**:  
  1. Paraguai  
  2. Venezuela  
  3. Nicarágua  

#### Quantidade Estatística
- **Total Exportado**: 0,08 toneladas estatísticas  
- **Análise Temporal (2020-2024)**:  
  Crescimento de 33,33% em 2021, queda de 100% em 2022, constante em 2023 e 2024.  
- **Principais Destinos**:  
  1. Portugal  
  2. Bélgica  
  3. Paraguai  

#### Quilograma Líquido
- **Total Exportado**: 0,68 toneladas  
- **Análise Temporal (2020-2024)**:  
  Queda de 61,54% em 2021, nova queda de 20,00% em 2022, aumento de 137,50% em 2023 e redução de 68,42% em 2024.  
- **Principais Destinos**:  
  1. Paraguai  
  2. Venezuela  
  3. Portugal  

# Soja, mesmo triturada, exceto para semeadura

## Valor FOB
- **Total Exportado**: R$ 207.940.864.752,00
- **Análise Temporal (2020-2024)**:
  - Crescimento de **35,27%** em 2021
  - Crescimento de **20,46%** em 2022
  - Crescimento de **14,39%** em 2023
  - Queda de **23,08%** em 2024
- **Principais Destinos**:
  1. **China**
  2. **Espanha**
  3. **Tailândia**

---

## Quantidade Estatística
- **Total Exportado**: 447,52 toneladas estatísticas
- **Análise Temporal (2020-2024)**:
  - Crescimento de **4,40%** em 2021
  - Queda de **10,09%** em 2022
  - Aumento de **29,92%** em 2023
  - Redução de **7,53%** em 2024
- **Principais Destinos**:
  1. **China**
  2. **Espanha**
  3. **Tailândia**

---

## Quilograma Líquido
- **Total Exportado**: 443.909,15 toneladas
- **Análise Temporal (2020-2024)**:
  - Crescimento de **3,78%** em 2021
  - Queda de **8,57%** em 2022
  - Aumento de **29,36%** em 2023
  - Redução de **7,47%** em 2024
- **Principais Destinos**:
  1. **China**
  2. **Espanha**
  3. **Tailândia**

---

## Conclusão: Comparação Entre Métricas

### Tendências de Valor FOB
- O **Valor FOB** apresentou variações significativas em todas as descrições NCM:
  - **Óleo de soja, em bruto, mesmo degomado** teve crescimento expressivo até 2022, seguido por quedas acentuadas em 2023 e 2024.
  - **Farinhas e pellets** mostraram estabilidade crescente a partir de 2022.
  - **Outros óleos de soja** tiveram comportamento errático, com picos e quedas bruscas.
  - **Soja, mesmo triturada** teve crescimento constante até 2023, mas sofreu queda significativa em 2024 (-23,08%).

### Comparação Entre Quantidade Estatística e Quilograma Líquido
- As métricas apresentaram comportamentos similares, com crescimentos graduais até 2023 e quedas em 2024.

### Principais Destinos
- A **China** destacou-se como o maior importador de **soja triturada**.
- **Indonésia, Polônia e Tailândia** lideraram as exportações de **farinhas e pellets**.
- **Índia, China e Bangladesh** dominaram as exportações de **óleo de soja em bruto**.
- **Paraguai e Venezuela** receberam volumes menores de **outros óleos de soja**.

---

## Melhorias

### Expansão do Escopo
- Analisar outras commodities, como milho e carne bovina.
- Incluir análises mensais ou trimestrais para identificar sazonalidades.

### Automação
- Utilizar ferramentas como **Power Query**, **SQL** ou **Python** para automatizar o fluxo de dados.

### Publicação
- Disponibilizar dashboards do Power BI por meio do **Power BI Service** para acesso público.


