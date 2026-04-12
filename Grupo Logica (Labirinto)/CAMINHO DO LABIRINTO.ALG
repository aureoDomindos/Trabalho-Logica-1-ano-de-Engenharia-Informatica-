 algoritmo "Labirinto Escola"



var

   labirinto: vetor[1..10, 1..10] de inteiro
   posX, posY: inteiro
   saidaX, saidaY: inteiro
   tecla: caractere
   passos: inteiro
   jogo: logico
   
   i,j:inteiro

inicio
   // Criando  labirinto com  10 e 10  colunas (0 sera igual a  caminho, 1  sera as nossas parede)
   // Inicialmente tudo parede
   para i de 1 ate 10 faca
      para j de 1 ate 10 faca
         labirinto[i, j] <- 1
      fimpara
   fimpara
   

   // Desenhar caminho do labirinto



   // Linha 1
   labirinto[1, 1] <- 0
   labirinto[1, 2] <- 0
   labirinto[1, 3] <- 0
   labirinto[1, 4] <- 0
   labirinto[1, 5] <- 0

   // Linha 2
   labirinto[2, 5] <- 0
   labirinto[2, 6] <- 0
   labirinto[2, 7] <- 0

   // Linha 3
   labirinto[3, 1] <- 0
   labirinto[3, 2] <- 0
   labirinto[3, 3] <- 0
   labirinto[3, 7] <- 0
   labirinto[3, 8] <- 0
   labirinto[3, 9] <- 0
   labirinto[3, 10] <- 0

   // Linha 4
   labirinto[4, 3] <- 0
   labirinto[4, 4] <- 0
   labirinto[4, 5] <- 0
   labirinto[4, 6] <- 0
   labirinto[4, 7] <- 0

   // Linha 5
   labirinto[5, 1] <- 0
   labirinto[5, 2] <- 0
   labirinto[5, 7] <- 0
   labirinto[5, 8] <- 0
   labirinto[5, 9] <- 0

   // Linha 6
   labirinto[6, 3] <- 0
   labirinto[6, 4] <- 0
   labirinto[6, 5] <- 0
   labirinto[6, 9] <- 0
   labirinto[6, 10] <- 0

   // Linha 7
   labirinto[7, 1] <- 0
   labirinto[7, 2] <- 0
   labirinto[7, 5] <- 0
   labirinto[7, 6] <- 0
   labirinto[7, 7] <- 0
   labirinto[7, 8] <- 0

   // Linha 8
   labirinto[8, 7] <- 0
   labirinto[8, 8] <- 0
   labirinto[8, 9] <- 0

   // Linha 9
   labirinto[9, 1] <- 0
   labirinto[9, 2] <- 0
   labirinto[9, 3] <- 0
   labirinto[9, 4] <- 0
   labirinto[9, 9] <- 0
   labirinto[9, 10] <- 0

   // Linha 10
   labirinto[10, 5] <- 0
   labirinto[10, 6] <- 0
   labirinto[10, 7] <- 0
   labirinto[10, 8] <- 0
   labirinto[10, 9] <- 0
   labirinto[10, 10] <- 0

   // Posição inicial (entrada)
   posX <- 1
   posY <- 1
   labirinto[posX, posY] <- 2

   // Posição da saída   do labirinto
   saidaX <- 10
   saidaY <- 10
   labirinto[saidaX, saidaY] <- 3

   passos <- 0
   jogo <- verdadeiro

   // repetição  do jogo
   enquanto jogo = verdadeiro faca
      // Limpar tela
      para i de 1 ate 20 faca
         escreval()
      fimpara





      // Mostrar labirinto
      escreval("LABIRINTO - Passos: ", passos)
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
      escreval("W-cima S-baixo A-esquerda D-direita Q-sair")
      escreva("Digite: ")
      leia(tecla)

      // Movimentar com as teclas
      se (tecla = "w") ou (tecla = "W") entao
         se labirinto[posX-1, posY] <> 1 entao
            labirinto[posX, posY] <- 0
            posX <- posX - 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      se (tecla = "s") ou (tecla = "S") entao
         se labirinto[posX+1, posY] <> 1 entao
            labirinto[posX, posY] <- 0
            posX <- posX + 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      se (tecla = "a") ou (tecla = "A") entao
         se labirinto[posX, posY-1] <> 1 entao
            labirinto[posX, posY] <- 0
            posY <- posY - 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      se (tecla = "d") ou (tecla = "D") entao
         se labirinto[posX, posY+1] <> 1 entao
            labirinto[posX, posY] <- 0
            posY <- posY + 1
            labirinto[posX, posY] <- 2
            passos <- passos + 1
         fimse
      fimse

      // Sair do jogo  pressione q
      se (tecla = "q") ou (tecla = "Q") entao
         jogo <- falso
      fimse

      // Verificar se chegou na saída
      se (posX = saidaX) e (posY = saidaY) entao
         escreval("")
         escreval("PARABENS! Voce completou o labirinto!")
         escreval("Total de passos: ", passos)
         jogo <- falso
      fimse

   fimenquanto

   escreval("")
   escreval("Fim de jogo!")

fimalgoritmo