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
public class HeapIndireto {
  private double p[]; 
  private int n, pos[], fp[];    // respectivamente tamanho do vetor de vertices menos 1, vetor de posicoes e vetor de vertices

  public HeapIndireto (double p[], int v[]) { 
    this.p = p; this.fp = v; this.n = this.fp.length-1;
    this.pos = new int[this.n];
    for (int u = 0; u < this.n; u++) this.pos[u] = u+1;
  }

  public void refaz (int esq, int dir) { // refaz a fila de prioridades
    int j = esq * 2;
    int x = this.fp[esq];
    while (j <= dir) {
      if ((j < dir) && (this.p[fp[j]] > this.p[fp[j + 1]])) j++;
      if (this.p[x] <= this.p[fp[j]]) break;
      this.fp[esq] = this.fp[j]; this.pos[fp[j]] = esq; 
      esq = j; j = esq * 2;
    }
    this.fp[esq] = x; this.pos[x] = esq;
  }

  public void constroi () { // controi o heap
    int esq = n / 2 + 1;
    while (esq > 1) { esq--; this.refaz (esq, this.n); }
  }
 
  public int retiraMin () throws Exception { //retira o item com menor chave refazendo o heap
    int minimo;
    if (this.n < 1) throw new Exception ("Erro: heap vazio");
    else {
      minimo = this.fp[1]; this.fp[1] = this.fp[this.n];
      this.pos[fp[this.n--]] = 1; this.refaz (1, this.n);
    }
    return minimo;
  }

  public void diminuiChave (int i, double chaveNova) throws Exception { //diminui o valor da chave do item i para um novo valor,
                                                                        //que e menor que o valor atual da chave
    i = this.pos[i]; int x = fp[i];
    if (chaveNova < 0)
      throw new Exception ("Erro: chaveNova com valor incorreto");
    this.p[x] = chaveNova;
    while ((i > 1) && (this.p[x] <= this.p[fp[i / 2]])) {
      this.fp[i] = this.fp[i / 2]; this.pos[fp[i / 2]] = i; i /= 2;
    }
    this.fp[i] = x; this.pos[x] = i;
  }

  boolean vazio () { return this.n == 0; }
    
  public void imprime () {
    for (int i = 1; i <= this.n; i++)
      System.out.print (this.p[fp[i]] + " ");
    System.out.println ();
  }
}
