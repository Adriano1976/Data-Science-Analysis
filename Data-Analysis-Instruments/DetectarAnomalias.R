# Data Science Academy
# Microsoft Power BI Para Business Intelligence e Data Science
# Lab 8 - Detecção de Anomalias em Transações Financeiras com Linguagem R e Power BI

# Verificar a pasta de trabalho - Esse código verifica e mostra qual é a pasta de 
# trabalho atual.

getwd()

# Instalar os pacotes - Esse código em R está instalando pacotes importantes, como 
# o "tidyverse", "dplyr", "solitude", "ggplot2" e "readr", que fornecem ferramentas 
# para análise e visualização de dados, facilitando a manipulação, transformação 
# e criação de gráficos a partir de conjuntos de dados.

install.packages("tidyverse")
install.packages("dplyr")
install.packages("solitude")
install.packages("ggplot2")
install.packages("readr")

# Carregar os pacotes nesta sessão R - Esse código em R carrega uma série de pacotes 
# (bibliotecas) que fornecem funções úteis para manipulação e visualização de dados, 
# incluindo o tidyverse, dplyr, solitude, ggplot2 e readr. Esses pacotes são utilizados 
# para realizar tarefas como organização de dados, análise, criação de gráficos e 
# leitura de arquivos, facilitando a exploração e o entendimento de conjuntos de 
# dados de forma mais eficiente.

library(tidyverse)
library(dplyr)
library(solitude)
library(ggplot2)
library(readr)

# Carregar os dados históricos - Esse código em R lê um arquivo chamado 
# "dados_historicos.csv" e armazena os dados nele em uma variável chamada 
# "dados_historicos_dsa", e em seguida abre uma visualização dos dados em uma tabela.

dados_historicos_dsa <- read_csv("dados_historicos.csv")
View(dados_historicos_dsa)

# Criar o modelo de Machine Learning com algoritmo isolationForest - Esse código 
# em R cria um novo modelo de detecção de anomalias usando o algoritmo Isolation 
# Forest e o armazena na variável "modelo_ml_dsa".

?isolationForest 
modelo_ml_dsa = isolationForest$new() 

# Treinar o modelo - Esse código em R está ajustando um modelo de machine learning 
# (representado pela variável "modelo_ml_dsa") aos dados históricos (armazenados na 
# variável "dados_historicos_dsa") usando a função "fit", ou seja, está treinando o 
# modelo nos dados passados para que ele possa fazer previsões ou tomar decisões 
# com base nesses dados.

modelo_ml_dsa$fit(dados_historicos_dsa)

# Fazer as previsões com o modelo usando os dados históricos - Esse código em R 
# utiliza dados históricos para fazer previsões usando um modelo de aprendizado de 
# máquina (modelo_ml_dsa), depois organiza as previsões em ordem decrescente com 
# base em uma pontuação de anomalia.

previsoes_historico = dados_historicos_dsa %>%
  modelo_ml_dsa$predict() %>%
  arrange(desc(anomaly_score))

# Exibir visualização dos dados - Esse código em R exibe uma visualização dos dados 
# contidos na variável "previsoes_historico", permitindo que você veja e analise 
# facilmente as informações contidas nessa variável.

View(previsoes_historico)

# Density Plot - Esse código em R cria um gráfico de densidade para mostrar como 
# os escores de anomalia (valores que indicam o quão incomuns são os dados) estão 
# distribuídos ao longo do tempo no conjunto de previsões históricas, ajudando a 
# identificar padrões incomuns nos dados.

plot(density(previsoes_historico$anomaly_score))

# Quanto maior o anomaly score, maior a chance do registro ser uma anomalia.
# Vamos definir como regra que anomaly score acima de 0.62 é uma anomalia.
# Portanto, esse código em R seleciona e armazena em "indices_historico" as linhas 
# da tabela "previsoes_historico" que possuem um valor de "anomaly_score" maior que 
# 0.62.

indices_historico = previsoes_historico[which(previsoes_historico$anomaly_score > 0.62)]

# Fazer o filtro - Este código em R seleciona e separa dados históricos em duas 
# partes: "anomalias_historico" que contém as entradas cujos índices são especificados 
# na coluna "id" de "dados_historicos_dsa", enquanto "normais_historico" possui as 
# entradas restantes, ou seja, aquelas cujos índices não estão presentes na coluna 
# "id" de "indices_historico".

anomalias_historico = dados_historicos_dsa[indices_historico$id, ]
normais_historico = dados_historicos_dsa[-indices_historico$id, ]

# Criar gráfico - O código usa a linguagem R e a biblioteca ggplot2 para criar um gráfico 
# de dispersão com pontos representando transações normais e anômalas, onde os eixos
# x e y representam diferentes tipos de transações; os pontos de transações normais 
# são exibidos em azul claro e os pontos de transações anômalas são exibidos em 
# vermelho mais escuro, com transparência ajustada para distinguir visualmente entre
# eles.

colors()
ggplot() + 
  geom_point(data = normais_historico, 
             mapping = aes(transacao1,transacao2), 
             col = "skyblue3", 
             alpha = 0.5) + 
  geom_point(data = anomalias_historico,
             mapping = aes(transacao1,transacao2), 
             col = "red2", 
             alpha = 0.8)

# Carregar novos dados - Esse código em R lê um arquivo chamado "novos_dados.csv" 
# e armazena as informações dele em uma variável chamada "novos_dados_dsa", em 
# seguida, mostra esses dados em uma visualização tabular.

novos_dados_dsa <- read.csv("novos_dados.csv")
View(novos_dados_dsa)

# Fazer previsões com o modelo treinado - Esse código em R utiliza um modelo de 
# aprendizado de máquina chamado "modelo_ml_dsa" para fazer previsões em um 
# conjunto de novos dados chamado "novos_dados_dsa" e armazena essas previsões na 
# variável "previsoes_novos_dados".

previsoes_novos_dados = modelo_ml_dsa$predict(novos_dados_dsa)

# Se o anomaly score é maior que 0.62 consideramos como anomalia - Este código em 
# R cria uma nova variável chamada "indices_novos_dados" que contém as linhas da 
# estrutura de dados "previsoes_novos_dados" onde o valor da coluna "anomaly_score" 
# é maior que 0.62.

indices_novos_dados = previsoes_novos_dados[which(previsoes_novos_dados$anomaly_score > 0.62)]

# Filtrar dados - Esse código em R separa um conjunto de novos dados em dois grupos:
# "anomalias_novos_dados", que contém as linhas dos novos dados com índices presentes
# em "indices_novos_dados$id", e "normais_novos_dados", que contém as linhas dos 
# novos dados com índices que não estão em "indices_novos_dados$id".

anomalias_novos_dados = novos_dados_dsa[indices_novos_dados$id, ]
normais_novos_dados = novos_dados_dsa[-indices_novos_dados$id, ]

# Criar gráfico das previsões - Este código em R utiliza a biblioteca ggplot2 para 
# criar um gráfico de dispersão (scatter plot) com dois conjuntos de pontos: um 
# conjunto representando dados normais (cor turquesa, transparência de 0.5) e outro 
# conjunto representando anomalias (cor vermelho-tomate, transparência de 0.8) com 
# base nos valores das variáveis de transação1 e transação2.

ggplot() + 
  geom_point(data = normais_novos_dados, 
             mapping = aes(transacao1,transacao2), 
             col = "turquoise3", 
             alpha = 0.5) + 
  geom_point(data = anomalias_novos_dados, 
             mapping = aes(transacao1,transacao2), 
             col = "tomato3", 
             alpha = 0.8)

# Exibir uma visualização tabular dos dados de previsões_novos_dados.

View(previsoes_novos_dados)

# Arredondar a coluna 'anomaly_score' para 2 casas decimais - O código em R está 
# arredondando os valores da coluna "anomaly_score" no conjunto de dados 
# "previsoes_novos_dados" para duas casas decimais e, em seguida, exibindo esse 
# conjunto de dados ajustado em uma visualização.

previsoes_novos_dados <- previsoes_novos_dados %>%
  mutate(anomaly_score = round(anomaly_score, 2))

View(previsoes_novos_dados)

# Criar uma nova coluna com base na condição - O código em R está adicionando uma 
# nova coluna chamada "status" aos dados de previsões, onde cada linha recebe o 
# valor "anomalia" se o valor da coluna "anomaly_score" for maior que 0.62 ou 
# "normal" caso contrário, e em seguida, exibe os dados atualizados em uma 
# visualização.

previsoes_novos_dados <- previsoes_novos_dados %>%
  mutate(status = ifelse(anomaly_score > 0.62, "anomalia", "normal"))

View(previsoes_novos_dados)

# Carregar biblioteca - Esse código em R utiliza a biblioteca "ggplot2" para criar 
# gráficos e visualizações de dados de maneira mais avançada e personalizada. A 
# função "library(ggplot2)" carrega essa biblioteca para o ambiente R.

library(ggplot2)

# Criar box plot - Este código em R utiliza a biblioteca ggplot2 para criar 
# um gráfico de caixa (box plot) que compara os scores de anomalia entre diferentes
# estados (status). O eixo x representa os estados, o eixo y representa os scores 
# de anomalia e a cor das caixas indica o status. O gráfico é estilizado com um 
# tema minimalista, as cores das caixas são personalizadas para vermelho (anomalia)
# e azul (normal) e a legenda é removida.

ggplot(previsoes_novos_dados, aes(x = status, y = anomaly_score, fill = status)) +
  geom_boxplot() +
  labs(title = "Box Plot de Anomalias e Normais",
       x = "Status",
       y = "Anomaly Score") +
  theme_minimal() +
  scale_fill_manual(values = c("anomalia" = "red", "normal" = "blue")) +
  theme(legend.position = "none")

# Salvar em disco - Este código R está escrevendo os dados contidos no objeto 
# "previsoes_novos_dados" para um arquivo CSV chamado "previsoes_novos_dados.csv". 
# Isso permitirá que os dados sejam armazenados em um formato de planilha que pode 
# ser facilmente compartilhado ou importado para outros programas.

write.csv(previsoes_novos_dados, "previsoes_novos_dados.csv")


