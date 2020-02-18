/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lista8;

/**
 *
 * @author Aluno
 */
public class AgmPrim {
  private int antecessor[];// armazena o antecessor v da arvore
  private double p[];
  private Grafo grafo;

  public AgmPrim (Grafo grafo) { this.grafo = grafo; }  
  public void obterAgm (int raiz) throws Exception { // recebe o vertice raiz como entrada
    int n = this.grafo.numVertices();
    this.p = new double[n]; // peso dos vertices
    int vs[] = new int[n+1]; //vertices
    boolean itensHeap[] = new boolean[n]; this.antecessor = new int[n];
    for (int u = 0; u < n; u ++) {
      this.antecessor[u] = -1;
      p[u] = Double.MAX_VALUE; // atribui valor infinito para o peso dos vertices inicialmente
      vs[u+1] = u; //Heap indireto a ser construido
      itensHeap[u] = true;
    }
    p[raiz] = 0;
    HeapIndireto heap = new HeapIndireto (p, vs); //instancia HeapIndireto mandando o vetor de pesos e o vetor de vertices 
    heap.constroi (); // montando heap
    while (!heap.vazio ()) {
      int u = heap.retiraMin (); itensHeap[u] = false;// itensHeap e atualizado quando o vertice e retirado do heap
      if (!this.grafo.listaAdjVazia (u)) {
        Grafo.Aresta adj = grafo.primeiroListaAdj (u);
        while (adj != null) {
          int v = adj.v2 ();
          if (itensHeap[v] && (adj.peso () < this.peso (v))) {// teste para verificar se o vertice v pertence ao heap e o peso da aresta adjacente
                                                              //for menor que p(v), o antecessor de v e armazenado em antecessor[v]
            antecessor[v] = u; heap.diminuiChave (v, adj.peso ());//a chave e diminuida sobre o heap na posicao v
          }
          adj = grafo.proxAdj (u);
        }
      }
    }
  }
  public int antecessor (int u) { return this.antecessor[u]; }
  public double peso (int u) { return this.p[u]; }
  
  public void imprime () {          //imprimir as arestas da arvore
    for (int u = 0; u < this.p.length; u++)
      if (this.antecessor[u] != -1) 
        System.out.println ("(" +antecessor[u]+ "," +u+ ") -- p:" +
                            peso (u));
  }
  
  public double getPesoTotal(){
      double cont=0;
      for(int u=0; u<this.p.length; u++){
          if (this.antecessor[u] != -1)
              cont = cont + peso(u);
      }
      return cont;
  }
  
  public void getAntecessoresGrafo(){
      for(int u=0;u<this.p.length; u++){
          if (this.antecessor[u] != -1)
              System.out.printf("%d - ",antecessor(u));
      }
      System.out.printf("\n\n");
  }
  
  
  
}
