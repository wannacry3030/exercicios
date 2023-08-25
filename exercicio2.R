##########################################################################
### 8) Exercícios
##########################################################################


# a) Crie uma matriz com 20 observações. 
#    Essa matriz deve conter variáveis do tipo categóricas e quantitativas, pois será necessário para as outras etapas do exercício.
#    Fique à vontade para simular qualquer tipo de situação com essa matriz. Use a creatividade!!!


# Criando variáveis categóricas e quantitativas simuladas
set.seed(123)  
# Define uma semente para a geração de números aleatórios
num_observacoes <- 20

variavel_categorica <- sample(c("A", "B", "C"), num_observacoes, replace = TRUE)
variavel_quantitativa <- rnorm(num_observacoes, mean = 50, sd = 10)
outra_variavel_quantitativa <- rnorm(num_observacoes, mean = 30, sd = 5)

# Criando a matriz
matriz <- data.frame(Variavel_Categorica = variavel_categorica,
                     Variavel_Quantitativa = variavel_quantitativa,
                     Outra_Variavel_Quantitativa = outra_variavel_quantitativa)

# Visualizando a matriz criada
print(matriz)



# b) Faça um tipo de agregação para alguma variável categórica que você criou.
#    Nessa agregação, consolide as informaçõess quantitativas por N, média e desvio padrão.


library(dplyr)  # Carrega o pacote dplyr para manipulação de dados

# Agregação dos dados pela variável categórica
agregado <- matriz %>%
  group_by(Variavel_Categorica) %>%
  summarize(N = n(),
            Media_Variavel_Quantitativa = mean(Variavel_Quantitativa),
            Desvio_Padrao_Variavel_Quantitativa = sd(Variavel_Quantitativa))

# Visualizando o resultado da agregação
print(agregado)


# c) Crie uma variável condicional
#    Vamos criar uma variável que indica se a "Variavel_Quantitativa" é maior que a média dela.

media_variavel_quantitativa <- mean(matriz$Variavel_Quantitativa)

# Criando variável condicional
matriz$Condicao = ifelse(matriz$Variavel_Quantitativa > media_variavel_quantitativa, "Maior", "Menor ou igual")

# Visualizando a matriz com a nova variável condicional
print(matriz)


# d) Crie alguns gráficos

library(ggplot2)  # Carrega o pacote ggplot2 para criação de gráficos

# Gráfico de barras para a variável categórica
grafico_barras <- ggplot(matriz, aes(x = Variavel_Categorica)) +
  geom_bar() +
  labs(title = "Gráfico de Barras",
       x = "Variável Categórica",
       y = "Frequência")

# Gráfico de dispersão
grafico_dispersao <- ggplot(matriz, aes(x = Variavel_Quantitativa, y = Outra_Variavel_Quantitativa)) +
  geom_point() +
  labs(title = "Gráfico de Dispersão",
       x = "Variável Quantitativa",
       y = "Outra Variável Quantitativa")

# Mostra os gráficos
print(grafico_barras)
print(grafico_dispersao)


# e) Crie uma segunda matriz. 
#   Essa matriz deve ser criada com um elemento identificador no qual será utilizado para um merge com a matriz criada na letra "a"

# Criando uma segunda matriz com um elemento identificador
id_identificador <- 1:num_observacoes
segunda_matriz <- data.frame(ID = id_identificador)

# Visualizando a segunda matriz
print(segunda_matriz)


# f) Aplique um merge: Matriz criada na letra "a" com a matriz criada na letra "e".

# Realizando o merge
matriz_com_identificador <- merge(matriz, segunda_matriz, by = NULL)

# Visualizando a matriz resultante do merge
print(matriz_com_identificador)





# OBSERVAÇÕES DO CODIGO:
# EXERCICIO A ->
    # set.seed(123): Define uma semente para a geração de números aleatórios. Isso garante que, ao rodar o código repetidamente, os mesmos números aleatórios sejam gerados, o que é útil para obter resultados consistentes durante o desenvolvimento e depuração.

    # num_observacoes <- 20: Define o número de observações que queremos criar na matriz, neste caso, 20 observações.

    # variavel_categorica <- sample(c("A", "B", "C"), num_observacoes, replace = TRUE): A função sample() é usada para criar valores amostrados aleatoriamente de um vetor de categorias ("A", "B" e "C") com o número de observações definido. O argumento replace = TRUE indica que a amostragem é feita com reposição, o que permite que a mesma categoria apareça em várias observações.

    # variavel_quantitativa <- rnorm(num_observacoes, mean = 50, sd = 10): A função rnorm() gera valores aleatórios a partir de uma distribuição normal. Aqui, estamos criando valores para uma variável quantitativa com uma média de 50 e um desvio padrão de 10.

    # outra_variavel_quantitativa <- rnorm(num_observacoes, mean = 30, sd = 5): Similar ao passo anterior, estamos gerando valores para outra variável quantitativa com uma média de 30 e um desvio padrão de 5.

    # matriz <- data.frame(Variavel_Categorica = variavel_categorica, Variavel_Quantitativa = variavel_quantitativa, Outra_Variavel_Quantitativa = outra_variavel_quantitativa): A função data.frame() é usada para criar um data frame, que é uma estrutura de dados tabular semelhante a uma matriz, onde cada coluna pode conter diferentes tipos de dados. Aqui, estamos criando um data frame chamado matriz com as variáveis categóricas e quantitativas criadas anteriormente.



# EXERCICIO B ->
#     matriz %>%: O operador %>%, chamado de operador pipe, é usado para encadear operações. Ele pega o resultado da operação à esquerda e o utiliza como entrada para a operação à direita.

#     group_by(Variavel_Categorica): A função group_by() é usada para agrupar os dados da matriz com base na variável categórica Variavel_Categorica.

#     summarize(N = n(), Media_Variavel_Quantitativa = mean(Variavel_Quantitativa), Desvio_Padrao_Variavel_Quantitativa = sd(Variavel_Quantitativa)): A função summarize() é usada para calcular resumos estatísticos dentro de cada grupo definido pelo group_by(). Aqui, estamos calculando três resumos:
#         N = n(): Calcula o número de observações em cada grupo.
#         Media_Variavel_Quantitativa = mean(Variavel_Quantitativa): Calcula a média da variável quantitativa Variavel_Quantitativa em cada grupo.
#         Desvio_Padrao_Variavel_Quantitativa = sd(Variavel_Quantitativa): Calcula o desvio padrão da variável quantitativa Variavel_Quantitativa em cada grupo.

# No final, a variável agregado conterá uma tabela resumida que mostra a contagem de observações (N), a média e o desvio padrão da variável quantitativa para cada categoria da variável categórica.

# A agregação é uma técnica útil para resumir informações e obter uma visão geral dos padrões nos seus dados.

# EXERCICIO C 
#     matriz$Condicao: Aqui, estamos criando uma nova coluna chamada Condicao na matriz matriz. O uso de $ permite acessar uma coluna específica dentro de um data frame.

#     ifelse(matriz$Variavel_Quantitativa > media_variavel_quantitativa, "Maior", "Menor ou igual"): A função ifelse() é usada para aplicar uma condição a cada elemento de um vetor. Neste caso, estamos verificando se cada valor na coluna Variavel_Quantitativa é maior que a media_variavel_quantitativa calculada anteriormente. Se for verdadeiro, atribuímos "Maior", caso contrário, atribuímos "Menor ou igual".

# O resultado é que a nova coluna Condicao irá conter a informação se cada observação possui uma Variavel_Quantitativa maior que a média ou não.

# Essa variável condicional pode ser útil para categorizar ou segmentar seus dados com base em uma determinada condição.