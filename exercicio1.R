#####################################################################
### Exerc?cios

# a) Crie uma matriz 5X6. Essa matriz deve ter o nome "matriz_exercicio_A"
> matriz_exercicio_A <- matrix(nrow = 5, ncol = 6) 

# b) Crie uma matriz 10X3. A primeira coluna deve ser uma vari?vel categ?rica, a segunda e a terceira uma vari?vel num?rica". Essa matriz deve ter o nome "matriz_exercicio_B"

# c) Crie uma matriz 50X4. Essa matriz deve ter o nome "matriz_exercicio_C"



##########################################################################

exec1:
  matriz_exercicio_A <- matrix(nrow = 5, ncol = 6)
  #a função matrix serve para criar uma matriz, nossa matriz tem valores NA, pq nao atribuimos valores, apenas criarmos ela..
  #nrow significa numero de linhas, ncol significa numero de colunas
  
  exec2:
    #criando uma variavel categorica
    categoricas <- factor(c("A","B","C","D","E","F","G","H","I","G"))
  #o factor serve para converter um vetor de valores em uma variavel categorica
  
  #criando duas variaveis numericas
  numerica1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  numerica2 <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
  
  #combinando essas variaveis para criar uma matriz
  matriz_exercicio_B <- cbind(categoricas, numerica1, numerica2)
  #usamos o cbind para combinar as 3 variaveis em uma matriz de 10 linhas e 3 col
  
  #viazualiando os resultados (a matriz)
  matriz_exercicio_B
  
  exec3:
    #criando a matriz
    matriz_exercicio_C <- matrix(nrow = 50, ncol = 4)
  
  #vizualizando o  resultado
  matriz_exercicio_C