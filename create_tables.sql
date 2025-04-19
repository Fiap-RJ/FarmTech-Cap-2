CREATE TABLE Cultura (
    ID_Cultura INT PRIMARY KEY,
    Nome VARCHAR(100),
    Data_Plantio DATE,
    Area DOUBLE
);

CREATE TABLE Sensor (
    ID_Sensor INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Modelo VARCHAR(100),
    Data_Instalacao DATE
);

CREATE TABLE Leitura_Sensor (
    ID_Leitura INT PRIMARY KEY,
    Data_Hora DATETIME,
    Valor DOUBLE,
    ID_Sensor INT,
    ID_Cultura INT,
    FOREIGN KEY (ID_Sensor) REFERENCES Sensor(ID_Sensor),
    FOREIGN KEY (ID_Cultura) REFERENCES Cultura(ID_Cultura)
);

CREATE TABLE Ajuste_Aplicacao (
    ID_Ajuste INT PRIMARY KEY,
    Data_Hora DATETIME,
    Tipo_Ajuste VARCHAR(50),
    Quantidade_Aplicada DOUBLE,
    ID_Cultura INT,
    FOREIGN KEY (ID_Cultura) REFERENCES Cultura(ID_Cultura)
);

CREATE TABLE Historico_Ajuste_Agua (
    ID_Historico INT PRIMARY KEY,
    ID_Ajuste INT,
    Data_Hora DATETIME,
    Quantidade_Agua DOUBLE,
    FOREIGN KEY (ID_Ajuste) REFERENCES Ajuste_Aplicacao(ID_Ajuste)
);
