
package lista5;

import java.util.Scanner;

public class Lista5 {

    
    public static void main(String[] args) {
        
        ArvorePatricia arvore;
        Scanner input = new Scanner(System.in);
        String frase;
        int nosVisitados;
        char c;
        
        System.out.println("Informe o número de bits da árvore:");
        arvore = new ArvorePatricia(input.nextInt()); input.nextLine();
        
        System.out.println("Informe o texto a ser inserido na árvore:");
        frase = input.nextLine();        
        for(int cont = 0; cont<frase.length(); cont++){
            arvore.insere(frase.charAt(cont));
        }
        
        System.out.printf("\nNúmero de chaves distintas:\n%d\n",arvore.getCaracteresDistintos());
        
        System.out.println("Qual caractere deseja pesquisar?");
        c = input.next().charAt(0);

        nosVisitados = arvore.pesquisa(c);
        System.out.printf("\nO número de nós visitados durante a pesquisa foi:\n%d\n",nosVisitados);
        
    }
    
}
