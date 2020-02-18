
package lista4;


public class Heap {

    private final int[] heap;
    private final int[] heapOrdenado;
    private int trocasDePosições;
    
    public Heap(int[] h) {
        this.heap = h;
        construcaoHeap();
        this.heapOrdenado = h; //podemos ter problemas aqui
        this.trocasDePosições = 0;
    }
    
    private void construcaoHeap(){ // metodo para construir o heap
        int esq = this.heap.length/2+1;
        
        while(esq > 1){
            esq--;
            this.manutencaoHeap(esq, this.heap.length);
        }
    }
     
    private int compara(int a, int b){ // verifica se existem as chaves e qual delas é maior 
        if(a >= 0 && b >= 0){
            if(a>=b){
                return a;
            }
            else
                return b;
        }
        return -1;
    }
    
    private void manutencaoHeap(int noAtual, int tamanhoHeap){ //metodo para refazer o heap
        int j = noAtual * 2;
        int x = this.heap[noAtual]; // pode ter problemas
        
        while(j <= tamanhoHeap){
            if((j < tamanhoHeap) && (compara(this.heap[j], this.heap[j + 1]) < 0)){
                j++;
            }
            if(compara(x,this.heap[j]) >= 0)break;
            this.heap[noAtual] = this.heap[j];
            noAtual = j;
            j = noAtual - 2;
        }
        this.heap[noAtual] = x;
    }
    
    private int retiraMaximo(int tamanhoHeap) throws Exception{ //remove o registro de maior valor do heap e o reorganiza
        int maximo;
        if(tamanhoHeap < 1)throw new Exception("\nHeap vazio!\n");
        else{
            maximo = this.heap[tamanhoHeap--];
            manutencaoHeap(1,tamanhoHeap);
        }
        return maximo;
    }
    
    
}
