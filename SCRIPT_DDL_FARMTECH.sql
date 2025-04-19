-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-04-19 17:44:11 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE Ajuste_Aplicacao CASCADE CONSTRAINTS 
;

DROP TABLE Cultura CASCADE CONSTRAINTS 
;

DROP TABLE Leitura_Sensor CASCADE CONSTRAINTS 
;

DROP TABLE Sensor CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Ajuste_Aplicacao 
    ( 
     id_ajuste           INTEGER  NOT NULL , 
     data_hora           DATE  NOT NULL , 
     tipo_ajuste         VARCHAR2 (50)  NOT NULL , 
     quantidade_aplicada NUMBER  NOT NULL , 
     Cultura_id_cultura  INTEGER  NOT NULL 
    ) 
;

COMMENT ON COLUMN Ajuste_Aplicacao.id_ajuste IS 'Identificador do ajuste' 
;

COMMENT ON COLUMN Ajuste_Aplicacao.data_hora IS 'Data e hora do ajuster' 
;

COMMENT ON COLUMN Ajuste_Aplicacao.tipo_ajuste IS 'Tiipo do ajuste (Água ou Nutriente)' 
;

COMMENT ON COLUMN Ajuste_Aplicacao.quantidade_aplicada IS 'Quantidade aplicada (litros ou unidade)' 
;

COMMENT ON COLUMN Ajuste_Aplicacao.Cultura_id_cultura IS 'Cultura associada ao ajuste' 
;

ALTER TABLE Ajuste_Aplicacao 
    ADD CONSTRAINT Ajuste_Aplicacao_PK PRIMARY KEY ( id_ajuste, Cultura_id_cultura ) ;

CREATE TABLE Cultura 
    ( 
     id_cultura   INTEGER  NOT NULL , 
     nome         VARCHAR2 (100) , 
     data_plantio DATE , 
     area         NUMBER 
    ) 
;

COMMENT ON COLUMN Cultura.id_cultura IS 'Identificador da cultura' 
;

COMMENT ON COLUMN Cultura.nome IS 'Nome da cultura (ex: Soja, Milho)' 
;

COMMENT ON COLUMN Cultura.data_plantio IS 'Data de plantio' 
;

COMMENT ON COLUMN Cultura.area IS 'Área da plantação (em m2)' 
;

ALTER TABLE Cultura 
    ADD CONSTRAINT PK_Cultura PRIMARY KEY ( id_cultura ) ;

CREATE TABLE Leitura_Sensor 
    ( 
     id_leitura         INTEGER  NOT NULL , 
     data_hora          DATE , 
     valor              NUMBER  NOT NULL , 
     Sensor_id_sensor   INTEGER  NOT NULL , 
     Cultura_id_cultura INTEGER  NOT NULL 
    ) 
;

COMMENT ON COLUMN Leitura_Sensor.id_leitura IS 'Identificador da leitura' 
;

COMMENT ON COLUMN Leitura_Sensor.data_hora IS 'Data e hora da leitura' 
;

COMMENT ON COLUMN Leitura_Sensor.valor IS 'Valor registrado pelo sensor' 
;

COMMENT ON COLUMN Leitura_Sensor.Sensor_id_sensor IS 'Sensor que realizou a leitura' 
;

COMMENT ON COLUMN Leitura_Sensor.Cultura_id_cultura IS 'Cultura associada à leitura' 
;

ALTER TABLE Leitura_Sensor 
    ADD CONSTRAINT Leitura_Sensor_PK PRIMARY KEY ( id_leitura, Sensor_id_sensor, Cultura_id_cultura ) ;

CREATE TABLE Sensor 
    ( 
     id_sensor       INTEGER  NOT NULL , 
     tipo            VARCHAR2 (50)  NOT NULL , 
     modelo          VARCHAR2 (100) , 
     data_instalacao DATE 
    ) 
;

COMMENT ON COLUMN Sensor.id_sensor IS 'Identificador único do sensor' 
;

COMMENT ON COLUMN Sensor.tipo IS 'Tipo do sensor (Umidade, pH, Nutrientes)' 
;

COMMENT ON COLUMN Sensor.modelo IS 'Modelo do sensor' 
;

COMMENT ON COLUMN Sensor.data_instalacao IS 'Data de instalação do sensor' 
;

ALTER TABLE Sensor 
    ADD CONSTRAINT PK_Sensor PRIMARY KEY ( id_sensor ) ;

ALTER TABLE Ajuste_Aplicacao 
    ADD CONSTRAINT Ajuste_Aplicacao_Cultura_FK FOREIGN KEY 
    ( 
     Cultura_id_cultura
    ) 
    REFERENCES Cultura 
    ( 
     id_cultura
    ) 
;

ALTER TABLE Leitura_Sensor 
    ADD CONSTRAINT FK_Leitura_Sensor_Cultura FOREIGN KEY 
    ( 
     Cultura_id_cultura
    ) 
    REFERENCES Cultura 
    ( 
     id_cultura
    ) 
;

ALTER TABLE Leitura_Sensor 
    ADD CONSTRAINT FK_Leitura_Sensor_Sensor FOREIGN KEY 
    ( 
     Sensor_id_sensor
    ) 
    REFERENCES Sensor 
    ( 
     id_sensor
    ) 
;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
