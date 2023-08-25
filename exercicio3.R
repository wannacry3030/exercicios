
######################################################################################
######################################################################################

# Prof. Weeberb Requia

# Testes paramétricos e não paramétricos

######################################################################################
######################################################################################



## 1. Teste T Student (Paramétrico, amostras independentes)
##########################################################################
# Carregando dados de peso de recém-nascidos
install.packages("MASS")
data(birthwt, package = "MASS")

# Teste t de Student para comparar o peso médio de recém-nascidos de mães que fumam e não fumam
t.test(birthwt$bwt[which(birthwt$smoke == 1)], birthwt$bwt[which(birthwt$smoke == 0)], alternative = "two.sided")

# Um valor de p menor que 0.05 no teste acima indica que a diferença é estatisticamente significativa.



## 2. ANOVA (Paramétrico)
##########################################################################
data <- read.csv("taxa_analfabetismo.csv")
head(data)

str(data)

data$UF <- as.factor(data$UF)
  
library("ggpubr")
ggboxplot(data, x = "UF", y = "T_ANALF25M", 
          color = "UF", 
          ylab = "Taxa de analfabetismo", xlab = "UF")

# Rodar o ANOVA
res.aov <- aov(T_ANALF25M ~ UF, data = data)

summary(res.aov)  

# Lembre-se que:
  # H0 = não há diferença na taxa de analfabetismo entre os estados. A gente rejeita esta hipótese se o p-value do teste for menor que 0.05
  # Ha = a taxa de analfabetismo entre os estados varia significativamente



## 3. Teste de Wilcoxon (não paramétrico, amostras dependentes)
###########################################################################

a = c(6, 8, 2, 4, 4, 5)
b = c(7, 10, 4, 3, 5, 6)

# H0: os dois grupos possuem a mesma medida de tendência central
# Ha: os grupos estão centrados em pontos diferentes

wilcox.test(a,b, correct=FALSE, alternative = "two.sided")

# Resultado: O teste apresenta a estatística de teste 'W' calculada e
# o p-valor do teste, além disso é apresentada a hipótese alternativa em estudo.
# Conclusão: Não há evidências para rejeitar H0 (p=0,5174), concluindo que os dois grupos são da mesma população. 



## 4. Teste de Mann-Whitney (teste não paramétrico, amostras independentes)
###########################################################################
# Carregando dados de preços de casas em duas áreas diferentes
install.packages("mlbench")
data(BostonHousing, package = "mlbench")

# Teste de Mann-Whitney para comparar os preços médios das casas nas duas áreas
wilcox.test(BostonHousing$medv[which(BostonHousing$chas == 1)], BostonHousing$medv[which(BostonHousing$chas == 0)], alternative = "two.sided")



## 5. Teste de Kruskal-Wallis (teste não paramétrico, comparar 3 ou mais grupos independentes)
############################################################################################

baixo<-c(85,90,107,85,100,97,101,64)
medio<-c(78,97,107,80,90,83)
alto<-c(93,100,97,79,97)

QI<-c(baixo,medio,alto)
QI

grupo <- c(rep("b",length(baixo)),rep("m",length(medio)),rep("a",length(alto)))
grupo

kruskal.test(QI~factor(grupo))

# H0: os grupos são semelhantes
# Ha: pelo menos 1 grupo difere dos demais

# Resultado Não há evidências para rejeitar H0 (p=0,7036), ou seja, não há
# evidências de que os grupos apresentam diferentes escores de QI. 


############################################################################################################################

# Trabalho 3 (3)
# 1) Pegar um banco de dados da sua escolha
# 2) Estabelecer as hipótes
# 3) Aplicar um dos testes praticados na aula de hoje.
# 4) Interpretar os resultados







