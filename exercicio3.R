
######################################################################################
######################################################################################

# Prof. Weeberb Requia

# Testes param�tricos e n�o param�tricos

######################################################################################
######################################################################################



## 1. Teste T Student (Param�trico, amostras independentes)
##########################################################################
# Carregando dados de peso de rec�m-nascidos
install.packages("MASS")
data(birthwt, package = "MASS")

# Teste t de Student para comparar o peso m�dio de rec�m-nascidos de m�es que fumam e n�o fumam
t.test(birthwt$bwt[which(birthwt$smoke == 1)], birthwt$bwt[which(birthwt$smoke == 0)], alternative = "two.sided")

# Um valor de p menor que 0.05 no teste acima indica que a diferen�a � estatisticamente significativa.



## 2. ANOVA (Param�trico)
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
  # H0 = n�o h� diferen�a na taxa de analfabetismo entre os estados. A gente rejeita esta hip�tese se o p-value do teste for menor que 0.05
  # Ha = a taxa de analfabetismo entre os estados varia significativamente



## 3. Teste de Wilcoxon (n�o param�trico, amostras dependentes)
###########################################################################

a = c(6, 8, 2, 4, 4, 5)
b = c(7, 10, 4, 3, 5, 6)

# H0: os dois grupos possuem a mesma medida de tend�ncia central
# Ha: os grupos est�o centrados em pontos diferentes

wilcox.test(a,b, correct=FALSE, alternative = "two.sided")

# Resultado: O teste apresenta a estat�stica de teste 'W' calculada e
# o p-valor do teste, al�m disso � apresentada a hip�tese alternativa em estudo.
# Conclus�o: N�o h� evid�ncias para rejeitar H0 (p=0,5174), concluindo que os dois grupos s�o da mesma popula��o. 



## 4. Teste de Mann-Whitney (teste n�o param�trico, amostras independentes)
###########################################################################
# Carregando dados de pre�os de casas em duas �reas diferentes
install.packages("mlbench")
data(BostonHousing, package = "mlbench")

# Teste de Mann-Whitney para comparar os pre�os m�dios das casas nas duas �reas
wilcox.test(BostonHousing$medv[which(BostonHousing$chas == 1)], BostonHousing$medv[which(BostonHousing$chas == 0)], alternative = "two.sided")



## 5. Teste de Kruskal-Wallis (teste n�o param�trico, comparar 3 ou mais grupos independentes)
############################################################################################

baixo<-c(85,90,107,85,100,97,101,64)
medio<-c(78,97,107,80,90,83)
alto<-c(93,100,97,79,97)

QI<-c(baixo,medio,alto)
QI

grupo <- c(rep("b",length(baixo)),rep("m",length(medio)),rep("a",length(alto)))
grupo

kruskal.test(QI~factor(grupo))

# H0: os grupos s�o semelhantes
# Ha: pelo menos 1 grupo difere dos demais

# Resultado N�o h� evid�ncias para rejeitar H0 (p=0,7036), ou seja, n�o h�
# evid�ncias de que os grupos apresentam diferentes escores de QI. 


############################################################################################################################

# Trabalho 3 (3)
# 1) Pegar um banco de dados da sua escolha
# 2) Estabelecer as hip�tes
# 3) Aplicar um dos testes praticados na aula de hoje.
# 4) Interpretar os resultados







