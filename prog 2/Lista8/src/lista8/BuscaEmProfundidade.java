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
public class BuscaEmProfundidade {
    
  public static final byte branco = 0;// caso o vertice nao tenha sido descoberto
  public static final byte cinza  = 1; // vertice descoberto mas ainda faltam explorar alguns outros caminhos
  public static final byte preto  = 2; // vertice totalmente explorado, junto com seus filhos
  private int d[], t[], antecessor[];
  private Grafo grafo;
  
  
  public BuscaEmProfundidade (Grafo grafo) {
    this.grafo = grafo; int n = this.grafo.numVertices();
    d = new int[n]; t = new int[n]; antecessor = new int[n];
  }
  
  
  private int visitaDfs (int u, int tempo, int cor[]) { // pelo vertice u obtem o tempo de busca de todos seus sucessores e muda sua cor
    cor[u] = cinza; this.d[u] = ++tempo;// atribui cinza ao vertice e registra o tempo que foi descoberto
//    System.out.println ("Visita "+u+" Descoberta:"+this.d[u]+" cinza");
    if (!this.grafo.listaAdjVazia (u)) { // caso a lista de adjacentes ao vertice u nao estiver vazia
      Grafo.Aresta a = this.grafo.primeiroListaAdj (u); //aresta a recebe a primeira aresta
      while (a != null) { //enquanto a nao for nulo, vai verificando os sucessores
        int v = a.v2 ();
        if (cor[v] == branco) { // caso o vertice seja branco, acrescenta-o para o vetor de antecessores
          this.antecessor[v] = u;
          tempo = this.visitaDfs (v, tempo, cor);
        }
        a = this.grafo.proxAdj (u);
      }
    }
    cor[u] = preto; this.t[u] = ++tempo; // todos os sucessores verificados do vertice
//    System.out.println ("Visita " +u+ " Termino:" +this.t[u]+ " preto");
    return tempo;
  }
  
  
  public void buscaEmProfundidade () { // algoritmo para busca em profundidade
    int tempo = 0; int cor[] = new int[this.grafo.numVertices ()]; 
    for (int u = 0; u < grafo.numVertices (); u++) {
      cor[u] = branco; this.antecessor[u] = -1; // preenche o vetor de antecessores com -1 para inicializar
    }     
    for (int u = 0; u < grafo.numVertices (); u++) // para cada vertice verifica se ja foi descoberto ou nao, para assim poder visitar seus sucessores
      if (cor[u] == branco) tempo = this.visitaDfs (u, tempo, cor);
  }
  
  public int d (int v) { return this.d[v]; }
  public int t (int v) { return this.t[v]; }
  public int antecessor (int v) { return this.antecessor[v]; }
  
  
}
