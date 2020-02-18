
package lista8;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Lista8 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner ler = new Scanner(System.in);
        int qntVertices,qntArestas,noSaida,noEntrada,peso; //variáveis de entrada no grafo
        double pesoTotal; // peso total de uma arvore geradora minima
        Grafo grafo;
        AgmPrim primMinima; //algoritmo de prim para arvore geradora minima
        
        System.out.println("Informe o nome do arquivo:");
        String nome = ler.nextLine();
        
        try{
            FileReader arq = new FileReader(nome);
            BufferedReader lerArq = new BufferedReader(arq);
            
            String linha = lerArq.readLine(); // lendo linha do arquivo
            String[] numeros = linha.split(" ");  //separando os numeros da linha do arquivo
            qntVertices = Integer.parseInt(numeros[0]);
            qntArestas = Integer.parseInt(numeros[1]);
            
            grafo = new Grafo(qntVertices); 
            
            linha = lerArq.readLine();
            while(linha != null){  //enquanto nao for o final do arquivo, separa cada numero de aresta e peso e manda para o grafo
                numeros = linha.split(" ");
                noSaida = Integer.parseInt(numeros[0]);
                noEntrada = Integer.parseInt(numeros[1]);
                peso = Integer.parseInt(numeros[2]);
                
                grafo.insereAresta(noEntrada, noSaida, peso);
                grafo.insereAresta(noSaida, noEntrada, peso);
                
                linha = lerArq.readLine();
            }
            
            primMinima = new AgmPrim(grafo);
            System.out.println("Informe o vértice a sua escolha a para que a arvore geradora minima parta dele:");
            try{primMinima.obterAgm(ler.nextInt());}catch(Exception E){
                
            }
            
            pesoTotal = primMinima.getPesoTotal();
            System.out.printf("Peso total da árvore geradora mínima: %f\n",pesoTotal);
            primMinima.getAntecessoresGrafo();
            
            primMinima.imprime();
            
        }catch(IOException e){
        System.out.printf("Erro na abertura do arquivo: %s",e.getMessage());
         }
        
    }
    
}
