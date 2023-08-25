##########################################################################
### 8) Exercicios - Aula 2
##########################################################################

##########################################################################
# a) Crie uma matriz com 20 observações. 
##########################################################################


#-- Definindo tamanho da matriz

set.seed(123)
num_observations <- 20
num_variables <- 4

#-- Gerando variavel categorica 1 -> Regiao do país

regions <- c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")
categorical_data <- sample(regions, num_observations, replace = TRUE)

#-- Gerando variavel categorica 1 -> Cidades (fictícias)

city_names <- c("Aqua Vista", "Belle Haven", "Cedarwood", "Daisyville", "Emerald Bay",
                "Fountain Springs", "Golden Meadows", "Harmony Falls", "Ivory Haven", "Jasmine Ridge",
                "Lavender Ridge", "Maplewood", "Nova Bay", "Oasis Springs", "Peachtree", "Quartzville",
                "Riverbend", "Sapphire City", "Topaz Springs", "Umbra Vista")


#-- Gerando variaveis numéricas -> criando 4 variaveis numericas a partir de uma distribuição normal com media 50 e desvio padrao 10

quantitative_data <- matrix(rnorm(num_observations * num_variables, mean = 50, sd = 10), ncol = num_variables)

#-- Juntando todas as variaveis em um dataframe (melhor do que uma matriz)

df <- data.frame(Regiao = categorical_data,
                             Cidade = sample(city_names, num_observations, replace = TRUE),
                             Populacao = quantitative_data[, 1],
                             PIB = quantitative_data[, 2],
                             Desemprego = quantitative_data[, 3],
                             IDH = quantitative_data[, 4])

df

##########################################################################
# b) Faça um tipo de agregaçãoo para alguma variavel categorica que voce criou. -> Nessa agregacao, consolide as informacoes quantitativas por N, media e desvio padrao.
##########################################################################

library(plyr)

agg_stats <- ddply(df, c("Regiao"), summarise,
                   N    = length(Populacao),
                   Mean_Populacao = mean(Populacao),
                   SD_Populacao   = sd(Populacao),
                   SE_Populacao   = SD_Populacao / sqrt(N)
)

print(agg_stats)

##########################################################################
# c) Crie uma variavel condicional 
##########################################################################

#-- Criando variavel que diz se a população da cidade é alta ou baixa

library(dplyr)

df <- df %>%
  mutate(Populacao_Categoria = ifelse(Populacao > 60, "Alta", "Baixa"))

print(df)


##########################################################################
# d) Crie alguns graficos
##########################################################################


library(ggplot2)

#-- Grafico de barras com a media de populaçao por regiao

ggplot(df, aes(x = Regiao, y = Populacao)) +
  geom_bar(stat = "summary", fun = "mean", fill = "red") +
  labs(title = "Media Populacao por Regiao", x = "Regiao", y = "Populacao media")


#-- Distribuição de valores nas variaveis numericas

ggplot(df, aes(x = Populacao)) +
  geom_density(fill = "blue", color = "black") +
  labs(title = "Density of Population", x = "Population", y = "Density")

ggplot(df, aes(x = PIB)) +
  geom_density(fill = "blue", color = "black") +
  labs(title = "Density of GDP", x = "GDP", y = "Density")

ggplot(df, aes(x = Desemprego)) +
  geom_density(fill = "blue", color = "black") +
  labs(title = "Density of Unemployment", x = "Unemployment", y = "Density")

ggplot(df, aes(x = IDH)) +
  geom_density(fill = "blue", color = "black") +
  labs(title = "Density of IDH", x = "IDH", y = "Density")


##########################################################################
# e) Crie uma segunda matriz. --> Essa matriz deve ser criada com um elemento identificador no qual sera utilizado para um merge com a matriz criada na letra "a"
##########################################################################

set.seed(456)  
num_observations <- 20

city_matrix <- data.frame(Cidade = df$Cidade,
                          Altitude = rnorm(num_observations, mean = 10, sd = 2))

#-- Dando mesmo nome à coluna com o nome Cidade

colnames(city_matrix)[1] <- "Cidade"

##########################################################################
# f) Aplique um merge: Matriz criada na letra "a" com a matriz criada na letra "e".
##########################################################################


merged_matrix <- merge(df, city_matrix, by = "Cidade", all.x = TRUE)

print(merged_matrix)