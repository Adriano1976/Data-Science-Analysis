# Formação Cientista de Dados
# Limpeza e Tratamento de Dados


# Este código em R lê um arquivo chamado "Churn.csv" que contém dados, separados 
# por ponto e vírgula, sobre alguma coisa chamada "Churn". Em seguida, ele mostra 
# as primeiras linhas desses dados usando a função "head" e um resumo estatístico 
# usando a função "summary". 

dados = read.csv("Churn.csv", sep = ";", na.strings="", stringsAsFactors=T)
head(dados)
summary(dados)


# Este código em R renomeia as colunas de um conjunto de dados para os nomes 
# especificados: "Id", "Score", "Estado", "Gênero", "Idade", "Patrimônio", "Saldo", 
# "Produtos", "TemCartãoCredito", "Ativo", "Salário" e "Saiu". Em seguida, ele 
# exibe as primeiras linhas desse conjunto de dados.

colnames(dados) = c("Id","Score","Estado","Genero","Idade","Patrimonio","Saldo","Produtos","TemCartCredito","Ativo","Salario","Saiu")
head(dados)


# Estados - O código conta quantas vezes cada estado aparece na coluna "Estado" 
# dos dados e cria um gráfico de barras mostrando essas contagens. O título do 
# gráfico é "Estados" e o eixo horizontal é rotulado como "Estados".

counts = table(dados$Estado)
barplot(counts, main="Estados", xlab="Estados")


# Gênero - Esse código em R conta quantas vezes cada gênero aparece na coluna 
# 'Genero' do conjunto de dados 'dados' e cria um gráfico de barras que mostra 
# essas contagens. O título do gráfico é "Gêneros" e o rótulo do eixo x é "Gêneros".

counts = table(dados$Genero)
barplot(counts, main="Gêneros", xlab="Gêneros")


# Esse código R resume estatísticas básicas do conjunto de dados na coluna "Score", mostrando valores como média, mediana e quartis. 
# Em seguida, ele cria um gráfico de caixa que apresenta a distribuição e possíveis valores discrepantes dessa mesma coluna. 
# Por fim, é criado um histograma para visualizar como os valores estão distribuídos em diferentes intervalos.

summary(dados$Score)
boxplot(dados$Score)
hist(dados$Score)


# Esse código em R faz três coisas com a variável "Idade" dos dados: primeiro, 
# ele apresenta um resumo estatístico; em seguida, cria um gráfico de caixa (boxplot) 
# para mostrar a distribuição; por fim, gera um histograma para ilustrar como os 
# valores de idade estão agrupados.

summary(dados$Idade)
boxplot(dados$Idade)
hist(dados$Idade)


# Esse código em R resume estatísticas do atributo "Saldo" de um conjunto de dados, 
# mostrando informações como mínimo, máximo e média, mediana e quartis. Em seguida, 
# cria um gráfico de caixa (boxplot) para visualizar a distribuição desse atributo 
# e um histograma para ver como os valores estão agrupados.

summary(dados$Saldo)
boxplot(dados$Saldo)
hist(dados$Saldo)


# O código analisa os salários de um conjunto de dados no R. A primeira linha 
# mostra um resumo estatístico dos salários. A segunda linha cria um gráfico de 
# caixa (boxplot) para visualizar a distribuição dos salários. A terceira linha 
# recria o gráfico de caixa, mas sem mostrar os contornos externos dos valores, 
# focando apenas na representação dos dados principais.

summary(dados$Salario)
boxplot(dados$Salario)
boxplot(dados$Salario,outline = F)


# Esse código R filtra um conjunto de dados, selecionando apenas as linhas que não 
# estão completas, ou seja, aquelas que possuem valores ausentes em pelo menos uma 
# coluna. Ele usa a função `complete.cases()` para identificar as linhas completas, 
# e o operador `!` inverte essa lógica, selecionando as linhas não completas do 
# conjunto de dados "dados".

dados[!complete.cases(dados),]


# O código analisa o conjunto de dados chamado "dados" e extrai um resumo estatístico
# do atributo "Salario", mostrando informações como média, mediana e valores mínimo 
# e máximo desse atributo.

summary(dados$Salario)


# Esse código em R calcula a mediana dos salários na coluna "Salario" de um conjunto 
# de dados chamado "dados", ignorando valores ausentes (NA). O resultado é o valor 
# que fica exatamente no meio da lista de salários quando eles estão organizados 
# em ordem crescente.

median(dados$Salario,na.rm = T)


# Este código R preenche os valores ausentes na coluna "Salario" do conjunto de 
# dados "dados" com a mediana dos salários existentes, excluindo os valores 
# ausentes ao calcular a mediana.

dados[is.na(dados$Salario),]$Salario = median(dados$Salario,na.rm = T)


# O código remove as linhas do conjunto de dados "dados" onde o valor do salário 
# ("Salario") está ausente, ou seja, onde há um valor faltando. Ele utiliza a 
# função "complete.cases" para identificar as linhas completas, o operador "!" 
# inverte essa seleção e, finalmente, os colchetes [ ] são usados para filtrar o 
# conjunto de dados conforme a condição especificada.

dados[!complete.cases(dados$Salario),]


# Ver valores - O código em R está analisando a coluna "Gênero" do conjunto de 
# dados "dados". A primeira linha retorna os valores únicos presentes nessa coluna, 
# ou seja, os diferentes gêneros. A segunda linha fornece um resumo estatístico 
# sobre a distribuição dos gêneros na coluna, incluindo contagem e frequência de 
# cada um.

unique(dados$Genero)
summary(dados$Genero)


# Tranformar F e Fem em Feminino e "" , M em Masculino (moda) - Este código em R 
# realiza uma substituição nos dados de uma coluna chamada "Genero". Ele substitui 
# os valores ausentes (NA) e os valores "M" por "Masculino", e substitui os valores 
# "F" e "Fem" por "Feminino". Essas substituições são feitas diretamente na coluna 
# "Genero" do conjunto de dados chamado "dados".

dados[is.na(dados$Genero) | dados$Genero == "M" ,]$Genero = "Masculino" 
dados[dados$Genero == "F" | dados$Genero == "Fem", ]$Genero = "Feminino" 


# Ver resultado - O código resume estatísticas básicas sobre a variável "Gênero" 
# no conjunto de dados "dados", mostrando contagem, média e valores mais comuns. 
# Isso ajuda a entender a distribuição dos gêneros nos dados.

summary(dados$Genero)


# Remover levels não utilizados - O código atribui a coluna "Gênero" do dataframe 
# "dados" como um fator, o que é útil para representar categorias em R de forma 
# eficiente. Isso ajuda a economizar memória e permite que você realize análises 
# estatísticas mais facilmente com dados categóricos.

dados$Genero = factor(dados$Genero)


# Visualizar novamente

summary(dados$Genero)


# O código "summary(dados$Idade)" resume estatísticas da coluna "Idade" do conjunto 
# de dados "dados", mostrando informações como média, mediana e outros valores 
# importantes relacionados à idade.

summary(dados$Idade)


# O código em R seleciona a coluna "Idade" do dataframe "dados" para todas as 
# linhas onde a idade é menor que 0 ou maior que 110. Em outras palavras, ele 
# extrai as idades que estão fora do intervalo considerado válido.

dados[dados$Idade < 0 | dados$Idade > 110 ,]$Idade


# Esse código R seleciona as linhas da coluna "Idade" do dataframe "dados" onde o 
# valor é ausente (NA), retornando todas as colunas para essas linhas.

dados[is.na(dados$Idade),]


# Opção, preencher com mediana - O código calcula a mediana das idades presentes 
# na coluna "Idade" do conjunto de dados chamado "dados". A mediana é o valor do 
# meio quando os números estão organizados em ordem, sendo útil para entender o 
# valor central das idades.

median(dados$Idade)


# Subtituição - Este código em R substitui os valores de idade que são menores que 
# 0 ou maiores que 110 no conjunto de dados 'dados' pela mediana das idades presentes 
# no conjunto. Isso é feito através da atribuição direta da mediana aos valores fora 
# do intervalo válido.

dados[dados$Idade < 0 | dados$Idade > 110 ,]$Idade = median(dados$Idade) 


# Buscamos novamente idades anormais - O código em R seleciona as linhas da tabela 
# 'dados' onde a coluna 'Idade' possui valores menores que 0 ou maiores que 110. 
# Em seguida, ele exibe um resumo estatístico da coluna 'Idade', mostrando estatísticas 
# como média, mediana e quartis.

dados[dados$Idade < 0 | dados$Idade > 110 ,]
summary(dados$Idade)


# Buscar duplicados pelo ID - O código em R verifica duplicatas na coluna 'Id' do 
# conjunto de dados 'dados' e atribui essas linhas duplicadas para a variável 'x', 
# exibindo o resultado.

x = dados[duplicated(dados$Id),]
x


# Verificamos que o ID 81 está duplicado e com isso, vamos excluir pelo indice 82 - O 
# código remove a linha 82 do conjunto de dados chamado "dados", excluindo essa 
# entrada da análise ou processamento posterior.

dados = dados[-c(82),]


# Buscamos a linha que estava duplicada - Esse código R filtra as linhas do dataframe 
# "dados" onde o valor da coluna "Id" é igual ao valor de "Id" no objeto "x". Em 
# outras palavras, ele extrai as linhas dos dados que correspondem ao mesmo ID que 
# está presente em "x".

dados[dados$Id == x$Id ,]


# Verificamos novamente duplicados - O código verifica duplicatas em um conjunto de 
# dados chamado "dados" com base na coluna "Id". Ele armazena as linhas duplicadas na 
# variável "x" e, em seguida, imprime essas linhas duplicadas.

x =  dados[duplicated(dados$Id),]
x


# O código em R primeiro extrai os valores únicos da coluna "Estado" do dataframe 
# "dados". Em seguida, ele gera um resumo estatístico dessa mesma coluna, exibindo 
# informações como contagem e ocorrência dos estados presentes nos dados.

unique(dados$Estado)
summary(dados$Estado)


# Preencher com a moda, RS - O código verifica uma coluna chamada "Estado" em um 
# conjunto de dados chamado "dados". Ele atribui "RS" aos valores da coluna "Estado" 
# que não são "RS", "SC" ou "PR". Em seguida, ele exibe um resumo dos valores na 
# coluna "Estado".

dados[!dados$Estado %in% c("RS","SC","PR"),]$Estado = "RS"
summary(dados$Estado)


# Removemos fatores não usados - Este código R adiciona uma coluna chamada "Estado" 
# aos dados existentes. A função "factor" é usada para converter os valores dessa 
# coluna em fatores, que são categorias ou grupos distintos. Isso pode ser útil 
# para análises e gráficos que envolvam categorias.

dados$Estado = factor(dados$Estado)


# visualizar novamente

summary(dados$Estado)


# Outliers, criando um parametro com desvio padrão - O código calcula o desvio 
# padrão dos salários em um conjunto de dados e armazena o resultado na variável 
# 'desv'. Em seguida, imprime o valor do desvio padrão. Por fim, ele filtra e 
# exibe os salários maiores ou iguais a duas vezes o desvio padrão a partir dos 
# dados originais.

desv = sd(dados$Salario, na.rm = T)
desv
dados[dados$Salario >= 2 *desv  , ]$Salario


# Outra forma, resultado semelhante, mas sem os NAs - O código cria um gráfico de 
# boxplot para visualizar a distribuição dos salários da variável 'Salario' em um 
# conjunto de dados chamado 'dados'. A segunda linha remove os pontos fora do gráfico. Em seguida, o código armazena os valores que estão fora do boxplot na variável 'x' e exibe esses valores.

boxplot(dados$Salario)
boxplot(dados$Salario, outline = F)
x = boxplot(dados$Salario)$out
x


# Atualizamos todos para mediana - Este código em R calcula a mediana dos salários 
# na base de dados "dados". Em seguida, ele seleciona os registros onde os salários 
# são pelo menos duas vezes o valor do desvio padrão e define esses salários como 
# sendo a mediana calculada anteriormente.

median(dados$Salario)
dados[dados$Salario >= 2 *desv  , ]$Salario = median(dados$Salario)


# Checamos se sairam os outliers - O código seleciona e retorna os valores da 
# coluna "Salario" de um conjunto de dados chamado "dados", mas apenas daqueles 
# registros cujo valor de "Salario" seja maior ou igual a duas vezes o valor do 
# desvio padrão (armazenado na variável "desv").

dados[dados$Salario >= 2 *desv  , ]$Salario