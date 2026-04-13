algoritmo "Labirinto Escola"

var
   labirinto: vetor[1..10, 1..10] de inteiro
   posX, posY: inteiro
   saidaX, saidaY: inteiro
   tecla: caractere
   passos: inteiro
   jogo: logico
   i, j: inteiro

inicio
   // Criando labirinto COM  10 E 10 COLUNAS  (0 = caminho, 1 = parede)
   // Inicialmente tudo parede
   para i de 1 ate 10 faca
      para j de 1 ate 10 faca
         labirinto[i, j] <- 1
      fimpara
   fimpara


   // CAMINHO  COM  A SAÍDA GARANTIDA


   // Linha 1 - caminho horizontal do  inicio
   labirinto[1, 1] <- 0
   labirinto[1, 2] <- 0
   labirinto[1, 3] <- 0
   labirinto[1, 4] <- 0
   labirinto[1, 5] <- 0

   // Linha 2 - desce e continua
   labirinto[2, 5] <- 0
   labirinto[2, 6] <- 0
   labirinto[2, 7] <- 0

   // Linha 3 - outro  caminho
   labirinto[3, 1] <- 0
   labirinto[3, 2] <- 0
   labirinto[3, 3] <- 0
   labirinto[3, 7] <- 0
   labirinto[3, 8] <- 0
   labirinto[3, 9] <- 0

   // Linha 4 - juntando os  caminhos
   labirinto[4, 3] <- 0
   labirinto[4, 4] <- 0
   labirinto[4, 5] <- 0
   labirinto[4, 6] <- 0
   labirinto[4, 7] <- 0
   labirinto[4, 9] <- 0
   
   
   // Linha 5 - continuação
   labirinto[5, 1] <- 0
   labirinto[5, 2] <- 0
   labirinto[5, 7] <- 0
   labirinto[5, 8] <- 0
   labirinto[5, 9] <- 0

   // Linha 6 - caminho para direita
   labirinto[6, 3] <- 0
   labirinto[6, 4] <- 0
   labirinto[6, 5] <- 0
   labirinto[6, 9] <- 0
   labirinto[6, 10] <- 0

   // Linha 7 - descendo para saida
   labirinto[7, 1] <- 0
   labirinto[7, 2] <- 0
   labirinto[7, 5] <- 0
   labirinto[7, 6] <- 0
   labirinto[7, 7] <- 0
   labirinto[7, 8] <- 0
   labirinto[7, 10] <- 0  // CONEXÃO PARA SAÍDA

   // Linha 8 - caminho final
   labirinto[8, 7] <- 0
   labirinto[8, 8] <- 0
   labirinto[8, 9] <- 0
   labirinto[8, 10] <- 0   // CAMINHO PARA SAÍDA

   // Linha 9 - prepara chegada
   labirinto[9, 1] <- 0
   labirinto[9, 2] <- 0
   labirinto[9, 3] <- 0
   labirinto[9, 4] <- 0
   labirinto[9, 9] <- 0
   labirinto[9, 10] <- 0   // CAMINHO PARA SAÍDA

   // Linha 10 - SAÍDA
   labirinto[10, 5] <- 0
   labirinto[10, 6] <- 0
   labirinto[10, 7] <- 0
   labirinto[10, 8] <- 0
   labirinto[10, 9] <- 0
   labirinto[10, 10] <- 0  // SAÍDA

   // =============================================
   // Posição inicial (entrada)
   posX <- 1
   posY <- 1
   labirinto[posX, posY] <- 2

   // Posição da saída
   saidaX <- 10
   saidaY <- 10
   labirinto[saidaX, saidaY] <- 3

   passos <- 0
   jogo <- verdadeiro

   // repetição principal do jogo
   enquanto jogo = verdadeiro faca
      // Limpar  a tela
      para i de 1 ate 20 faca
         escreval()
      fimpara

      // Mostrar labirinto
      escreval("=========================================")
      escreval("            LABIRINTO DO TESOURO        ")
      escreval("=========================================")
      escreval("Passos: ", passos)
      escreval("")

      para i de 1 ate 10 faca
         para j de 1 ate 10 faca
            se labirinto[i, j] = 1 entao
               escreva("# ")
            senao
               se labirinto[i, j] = 2 entao
                  escreva("P ")
               senao
                  se labirinto[i, j] = 3 entao
                     escreva("S ")
                  senao
                     escreva(". ")
                  fimse
               fimse
            fimse
         fimpara
         escreval()
      fimpara

      escreval("")
      escreval("=========================================")
      escreval("Comandos: W-cima | S-baixo | A-esquerda | D-direita | Q-sair")
      escreval("=========================================")
      escreva("Digite: ")
      leia(tecla)

      // Movimentar para CIMA
      se (tecla = "w") ou (tecla = "W") entao
         se (posX-1 >= 1) e (labirinto[posX-1, posY] <> 1) entao
            labirinto[posX, posY] <- 0
            posX <- posX - 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      // Movimentar para BAIXO
      se (tecla = "s") ou (tecla = "S") entao
         se (posX+1 <= 10) e (labirinto[posX+1, posY] <> 1) entao
            labirinto[posX, posY] <- 0
            posX <- posX + 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      // Movimentar para ESQUERDA
      se (tecla = "a") ou (tecla = "A") entao
         se (posY-1 >= 1) e (labirinto[posX, posY-1] <> 1) entao
            labirinto[posX, posY] <- 0
            posY <- posY - 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      // Movimentar para DIREITA
      se (tecla = "d") ou (tecla = "D") entao
         se (posY+1 <= 10) e (labirinto[posX, posY+1] <> 1) entao
            labirinto[posX, posY] <- 0
            posY <- posY + 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      // Sair do jogo
      se (tecla = "q") ou (tecla = "Q") entao
         jogo <- falso
         escreval("")
         escreval("Você desistiu do labirinto!")
      fimse

      // Verificar se chegou na saída
      se (posX = saidaX) e (posY = saidaY) entao
         escreval("")
         escreval("=========================================")
         escreval("             PARABENS! ??                ")
         escreval("=========================================")
         escreval("Voce completou o labirinto!")
         escreval("Total de passos: ", passos)
         escreval("=========================================")
         jogo <- falso
      fimse

   fimenquanto

   escreval("")
   escreval("Fim de jogo!")

fimalgoritmo
