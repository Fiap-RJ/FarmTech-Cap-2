# 📘 Modelo Entidade-Relacionamento (MER) - Sistema de Monitoramento da Plantação

## Entidade: Sensor
| Atributo        | Tipo de Dado | Descrição                                |
| --------------- | ------------ | ---------------------------------------- |
| ID_Sensor (PK)  | Integer      | Identificador único do sensor            |
| Tipo            | VARCHAR(50)  | Tipo do sensor (Umidade, pH, Nutrientes) |
| Modelo          | VARCHAR(100) | Modelo do sensor                         |
| Data_Instalacao | DATE         | Data de instalação do sensor             |

---

## Entidade: Leitura_Sensor
| Atributo        | Tipo de Dado | Descrição                     |
| --------------- | ------------ | ----------------------------- |
| ID_Leitura (PK) | Integer      | Identificador da leitura      |
| Data_Hora       | DATETIME     | Data e hora da leitura        |
| Valor           | DOUBLE       | Valor registrado pelo sensor  |
| ID_Sensor (FK)  | Integer      | Sensor que realizou a leitura |
| ID_Cultura (FK) | Integer      | Cultura associada à leitura   |

---

## Entidade: Cultura
| Atributo        | Tipo de Dado | Descrição                         |
| --------------- | ------------ | --------------------------------- |
| ID_Cultura (PK) | Integer      | Identificador da cultura          |
| Nome            | VARCHAR(100) | Nome da cultura (ex: Soja, Milho) |
| Data_Plantio    | DATE         | Data de plantio                   |
| Area            | DOUBLE       | Área da plantação (em m²)         |

---

## Entidade: Ajuste_Aplicacao
| Atributo            | Tipo de Dado | Descrição                               |
| ------------------- | ------------ | --------------------------------------- |
| ID_Ajuste (PK)      | Integer      | Identificador do ajuste                 |
| Data_Hora           | DATETIME     | Data e hora do ajuste                   |
| Tipo_Ajuste         | VARCHAR(50)  | Tipo do ajuste (Água ou Nutriente)      |
| Quantidade_Aplicada | DOUBLE       | Quantidade aplicada (litros ou unidade) |
| ID_Cultura (FK)     | Integer      | Cultura associada ao ajuste             |

---

## 🔗 Relacionamentos

- **Sensor** 1:N **Leitura_Sensor**
- **Cultura** 1:N **Leitura_Sensor**
- **Cultura** 1:N **Ajuste_Aplicacao**