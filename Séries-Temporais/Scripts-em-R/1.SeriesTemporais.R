
'Formação Cientista de Dados - Prof. Fernando Amaral
Séries Temporais'

# ------------------------------------------------------------------------------

# No código fornecido, primeiro estamos instalando o pacote "forecast" por meio do 
# comando "install.packages". Em seguida, estamos carregando o pacote recém-instalado 
# usando "library(forecast)". Essas duas linhas são comuns em análises de dados no 
# ambiente R, onde estamos preparando o ambiente de trabalho, garantindo que o pacote 
# "forecast" esteja disponível para ser usado em funções subsequentes.'

install.packages("forecast")
library(forecast)

  
# O código em R tem como objetivo analisar a série temporal "AirPassengers". 
# Na primeira linha, "AirPassengers" é o conjunto de dados em questão. Nas três 
# linhas seguintes, são exibidos o primeiro período, o último período e a frequência 
# dos dados dessa série temporal, respectivamente. Isso ajuda a entender o intervalo 
# de tempo abrangido pelos dados e com que frequência eles foram coletados, 
# informações essenciais para análises de séries temporais.

AirPassengers
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)


# Esse código em R exibe dois gráficos relacionados aos dados de passageiros aéreos. 
# O primeiro gráfico, criado com `plot(AirPassengers)`, mostra o número de passageiros 
# ao longo do tempo, revelando uma tendência crescente. Já o segundo gráfico, gerado 
# com `plot(aggregate(AirPassengers))`, é uma representação da média anual dos passageiros, 
# permitindo visualizar uma visão mais suavizada da tendência de crescimento. Ambos os 
# gráficos são úteis para analisar e comparar os dados de passageiros aéreos.

plot(AirPassengers)
plot(aggregate(AirPassengers))


# O código em R começa criando um objeto chamado "subst" que armazena um subconjunto 
# dos dados de passageiros aéreos, limitando-se ao ano de 1960. Em seguida, ele exibe 
# os dados desse subconjunto e cria um gráfico de séries temporais com base nesses 
# dados. Basicamente, ele seleciona e visualiza os dados de passageiros aéreos apenas 
# para o ano de 1960.

subst = window(AirPassengers,start=c(1960,1), end=c(1960,12))
subst
plot(subst)


# Esse código em R realiza a decomposição de uma série temporal chamada "AirPassengers".
# A função "decompose" separa essa série em três componentes principais: tendência, 
# sazonalidade e resíduos. O resultado é armazenado na variável "dec". Em seguida, o 
# código exibe o resultado da decomposição, que inclui os três componentes mencionados, 
# fornecendo insights sobre padrões temporais, variações sazonais e erros residuais na 
# série temporal.

dec = decompose(AirPassengers)
dec


# No código apresentado, estamos trabalhando com a linguagem R. A primeira linha, `
# attributes(dec)`, é usada para acessar os atributos de um objeto chamado `dec`. 
# Em seguida, `dec$seasonal` extrai um atributo específico chamado `seasonal` 
# do objeto `dec`. Portanto, essas duas linhas de código permitem acessar e 
# verificar os atributos do objeto `dec`, focalizando especificamente no atributo 
#`seasonal`.

attributes(dec)
dec$seasonal


# Esse código em R cria cinco gráficos diferentes usando a biblioteca `forecast`. 
# O primeiro gráfico representa os valores da série temporal `dec`. Os quatro 
# gráficos subsequentes exibem as componentes da série: `x`, que é a série original, 
# `seasonal` representa a sazonalidade, `trend` mostra a tendência e `random` 
# revela os componentes aleatórios da série temporal. Esses gráficos são úteis 
# para analisar e entender a decomposição de uma série temporal em suas partes 
# constituintes.

plot(dec)
plot(dec$x)
plot(dec$seasonal)
plot(dec$trend)
plot(dec$random)


# No código apresentado, o comando `ets` está sendo usado para ajustar um modelo 
# de previsão Exponential Smoothing State Space (ETS) aos dados de séries temporais 
# do conjunto "AirPassengers". Essa função é parte do pacote estatístico em R. 
# Em seguida, o resultado do ajuste do modelo é simplesmente impresso na tela usando 
# `ets`. Este código é o ponto de partida para realizar previsões e análises futuras 
# com base nos dados de passageiros da série temporal.

ets = ets(AirPassengers)
ets


# No código apresentado, está sendo realizada uma previsão de séries temporais 
# utilizando o método ETS (Erro, Tendência e Sazonalidade Exponencial). A variável 
# "previsao" armazena as previsões para 12 períodos futuros. Em seguida, o gráfico 
# das previsões é plotado, permitindo visualizar a tendência prevista. Por fim, o 
# resultado das previsões é exibido, fornecendo os valores previstos para os próximos 
# 12 pontos no tempo. Este código é útil para analisar e visualizar previsões de 
# séries temporais usando o método ETS em R.

previsao = forecast(ets, h=12)
plot(previsao)
previsao


# Nesse código em R, é realizada uma análise de séries temporais no conjunto de dados 
# 'AirPassengers' usando o método 'auto.arima'. O objetivo é automaticamente 
# identificar e ajustar um modelo ARIMA (AutoRegressive Integrated Moving Average) 
# mais apropriado para os dados. Em seguida, o resultado do modelo ajustado é exibido 
# na tela. Esse código simplifica o processo de seleção de um modelo ARIMA adequado 
# para a série temporal 'AirPassengers'.


arima = auto.arima(AirPassengers)
arima


# Nesse código em R, estou realizando uma previsão de séries temporais usando o 
# modelo ARIMA (AutoRegressive Integrated Moving Average). A variável 'previsao' 
# armazena a previsão para os próximos 12 períodos, e em seguida, é gerado um 
# gráfico para visualização. Por fim, o resultado da previsão é exibido. É uma 
# maneira eficaz de analisar e prever tendências em séries temporais usando o 
# pacote forecast em R.

previsao = forecast(arima, h=12)
plot(previsao)
previsao


