## 2. ANOVA (Paramétrico)
##########################################################################

# Carrega o conjunto de dados "taxa_analfabetismo.csv" no objeto 'data'
data <- read.csv("taxa_analfabetismo.csv")

# Exibe as primeiras linhas dos dados para verificar sua estrutura
head(data)

# Exibe informações sobre a estrutura dos dados, como tipos de variáveis
str(data)

# Converte a coluna 'UF' em um fator, necessário para executar a ANOVA
data$UF <- as.factor(data$UF)

# Carrega a biblioteca "ggpubr" para criar gráficos
library("ggpubr")

# Cria um boxplot para visualizar a distribuição da taxa de analfabetismo por estado
ggboxplot(data, x = "UF", y = "T_ANALF25M", 
          color = "UF", 
          ylab = "Taxa de analfabetismo", xlab = "UF")

# Realiza a ANOVA para testar se há diferenças significativas nas taxas de analfabetismo entre os estados
res.aov <- aov(T_ANALF25M ~ UF, data = data)

# Exibe um resumo dos resultados da ANOVA, incluindo valores F e p
summary(res.aov)  

# Lembre-se que:
# H0 = não há diferença na taxa de analfabetismo entre os estados. A gente rejeita esta hipótese se o p-value do teste for menor que 0.05
# Ha = a taxa de analfabetismo entre os estados varia significativamente

getwd()

setwd("/Home/Documents/Exe/")