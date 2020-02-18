
package lista10;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Lista10 {


    public static void main(String[] args) {
        
        Scanner ler = new Scanner(System.in);
        int qntVertices,qntArestas,noSaida,noEntrada,peso; //variáveis de entrada no grafo
        GrafoMatrizAdj grafo;
        fordFulkerson fluxo;
        int fluxoMaximo;
        int [][] descendentes;
        int grafoR [][];
        
        System.out.println("Informe o nome do arquivo:");
        String nome = ler.nextLine();
        
        try{
            FileReader arq = new FileReader(nome);
            BufferedReader lerArq = new BufferedReader(arq);
            
            String linha = lerArq.readLine(); // lendo linha do arquivo
            String[] numeros = linha.split(" ");  //separando os numeros da linha do arquivo
            qntVertices = Integer.parseInt(numeros[0]);
            qntArestas = Integer.parseInt(numeros[1]);
            
            grafo = new GrafoMatrizAdj(qntVertices); 
            
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
            
            fluxo = new fordFulkerson(qntVertices);
            
            System.out.println("Informe o vértice inicial e o final para calcular o fluxo máximo entre eles:");
            noEntrada = ler.nextInt();
            noSaida = ler.nextInt();
            fluxoMaximo = fluxo.fordFulkerson(grafo.getMatriz(), noEntrada, noSaida);
            System.out.printf("Valor do fluxo máximo: %d\n",fluxoMaximo);
             
            descendentes = fluxo.getPai();
            
            grafoR = fluxo.getGrafoR();
            
            int j = noSaida;
            int i = 0;
            
            System.out.printf("Os vértices que estão entre o caminho de maior fluxo são:\n");
            while(descendentes[i][j]!= -1){
                System.out.print(j + " <- ");
                j = descendentes[i][j];
            }
            System.out.println(j);
            
            System.out.printf("A capacidade residual do caminho com maior fluxo é:\n");
            j = noSaida;
            while(descendentes[i][j]!= -1){
                System.out.print(grafoR[descendentes[i][j]][j] + " ");
                j = descendentes[i][j];
                
            }
            System.out.println("");
            
        }catch(IOException e){
        System.out.printf("Erro na abertura do arquivo: %s",e.getMessage());
         }
    }
    
}
