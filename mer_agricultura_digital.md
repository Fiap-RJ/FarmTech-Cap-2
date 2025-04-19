# 📘 Modelo Entidade-Relacionamento (MER) - Sistema de Monitoramento da Plantação

## Entidade: Sensor
| Atributo         | Tipo de Dado | Descrição                        |
|------------------|--------------|----------------------------------|
| ID_Sensor (PK)   | INT          | Identificador único do sensor    |
| Tipo             | VARCHAR(50)  | Tipo do sensor (Umidade, pH, Nutrientes) |
| Modelo           | VARCHAR(100) | Modelo do sensor                 |
| Data_Instalacao  | DATE         | Data de instalação do sensor     |

---

## Entidade: Leitura_Sensor
| Atributo         | Tipo de Dado | Descrição                          |
|------------------|--------------|------------------------------------|
| ID_Leitura (PK)  | INT          | Identificador da leitura           |
| Data_Hora        | DATETIME     | Data e hora da leitura             |
| Valor            | DOUBLE       | Valor registrado pelo sensor       |
| ID_Sensor (FK)   | INT          | Sensor que realizou a leitura      |
| ID_Cultura (FK)  | INT          | Cultura associada à leitura        |

---

## Entidade: Cultura
| Atributo         | Tipo de Dado | Descrição                          |
|------------------|--------------|------------------------------------|
| ID_Cultura (PK)  | INT          | Identificador da cultura           |
| Nome             | VARCHAR(100) | Nome da cultura (ex: Soja, Milho)  |
| Data_Plantio     | DATE         | Data de plantio                    |
| Area             | DOUBLE       | Área da plantação (em m²)          |

---

## Entidade: Ajuste_Aplicacao
| Atributo              | Tipo de Dado | Descrição                                  |
|-----------------------|--------------|--------------------------------------------|
| ID_Ajuste (PK)        | INT          | Identificador do ajuste                    |
| Data_Hora             | DATETIME     | Data e hora do ajuste                      |
| Tipo_Ajuste           | VARCHAR(50)  | Tipo do ajuste (Água ou Nutriente)         |
| Quantidade_Aplicada   | DOUBLE       | Quantidade aplicada (litros ou unidade)    |
| ID_Cultura (FK)       | INT          | Cultura associada ao ajuste                |

---

## Entidade: Histórico_Ajuste_Agua
| Atributo              | Tipo de Dado | Descrição                                  |
|-----------------------|--------------|--------------------------------------------|
| ID_Historico (PK)     | INT          | Identificador do histórico                 |
| ID_Ajuste (FK)        | INT          | Ajuste de aplicação relacionado            |
| Data_Hora             | DATETIME     | Data e hora do histórico                   |
| Quantidade_Agua       | DOUBLE       | Quantidade de água aplicada                |

---

## 🔗 Relacionamentos

- **Sensor** 1:N **Leitura_Sensor**
- **Cultura** 1:N **Leitura_Sensor**
- **Cultura** 1:N **Ajuste_Aplicacao**
- **Ajuste_Aplicacao** 1:N **Histórico_Ajuste_Agua**
