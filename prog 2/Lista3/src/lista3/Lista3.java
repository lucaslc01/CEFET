
package lista3;

import java.util.Scanner;

public class Lista3 {

    
    public static void main(String[] args) {
    
        
        int ordem,qntRegistros,pesquisa,cont=1;
        int registros[];
        
        Scanner input = new Scanner(System.in);
        
        System.out.println("Infome a ordem das 10 árvores:");
        ordem = input.nextInt();
     
        
        for(int i=10000;i<=100000;i+=10000)
        {
          ArvoreB arvore = new ArvoreB(ordem);
          for(int k=1;k<=10;k++){
            for(int j=1;j<=k*10000;j++){
              arvore.insere(j);  
            }
          }
          System.out.printf("Informe o elemento a ser pesquisado na arvore %d\n",cont);
          cont++;
          pesquisa = input.nextInt();
          arvore.pesquisa(pesquisa);
          System.out.printf("Numero de comparacoes : %d\nNumero de paginas visitadas : %d\n\n",arvore.getNumeroComparacoes(),arvore.getPaginasVisitadas());
          
          
        }
        
    }
    
}
