package lista5;


public class ArvorePatricia {
    
    private NoArvorePatricia raiz;
    private final int numeroDeBitsNaChave;
    private int nosVisitadosPesquisa;
    private int caracteresDistintos;
    
    //método contrutor
    public ArvorePatricia(int nbitsChave){
        this.numeroDeBitsNaChave = nbitsChave;
    }
    
    public int pesquisa(char chavePesquisa){
        this.nosVisitadosPesquisa = 0;
        return pesquisa(chavePesquisa, this.raiz);
    }
    
    //inicializa o processo de insercao de um caractere a partir do nó raiz da árvore; 
    public void insere(char chaveInsercao){
        this.raiz = insere(chaveInsercao, this.raiz);
    }
    
    // retorna a quantidade de nós visitados durante uma pesquisa
    public int getNosVisitadosPesquisa(){
        return this.nosVisitadosPesquisa;
    }
    
    // retorna o número de chaves distintas encontradas em um texto
    public int getCaracteresDistintos(){
        return this.caracteresDistintos;
    }
    
    private static abstract class NoArvorePatricia{
        
    }
    
    private static class NoInternoArvorePatricia extends NoArvorePatricia{
        
        //índice que remete a posição do bit relativo a um conjunto de letras
        //em um no interno
        int indice;
        
        //Variáveis que indicam quem são os nos filhos de um no interno
        NoArvorePatricia filhoEsquerda, filhoDireita;
    }
    
    private static class NoExternoArvorePatricia extends NoArvorePatricia{
        
        //um caractere que aparece no mínimo uma vez
        char chave;
        
        //quantidade de vezes que a letra aparece
        int quantidade;
    }
    
    //Cria um nó interno
    private NoArvorePatricia criaNoInterno(int posicaoAtual, NoArvorePatricia filhoEsq, NoArvorePatricia filhoDir){
        NoInternoArvorePatricia p = new NoInternoArvorePatricia();
        p.indice = posicaoAtual;
        p.filhoEsquerda = filhoEsq;
        p.filhoDireita = filhoDir;
        
        return p;
    }
    
    private NoArvorePatricia criaNoExterno(char chaveInsercao){
        NoExternoArvorePatricia p = new NoExternoArvorePatricia();
        p.chave = chaveInsercao;
        p.quantidade = 0;
        
        return p;
    }
    
    // pesquisa e retorna quantas vezes um caractere apareceu no texto na árvore Patricia
    private int pesquisa(char chavePesquisa, NoArvorePatricia raizAtual){
        this.nosVisitadosPesquisa++;
        if(this.verificaNoExterno(raizAtual)){
            NoExternoArvorePatricia aux = (NoExternoArvorePatricia) raizAtual;
            if(aux.chave == chavePesquisa){
                System.out.println("Elemento encontrado");
            }
            else
                System.out.println("Elemento não encontrado");
        }
        else{
            NoInternoArvorePatricia aux = (NoInternoArvorePatricia) raizAtual;
            if(this.testaBit(aux.indice, chavePesquisa) == 0){
                pesquisa(chavePesquisa, aux.filhoEsquerda);
            }
            else{
                pesquisa(chavePesquisa, aux.filhoDireita);
            }
        }
        return this.nosVisitadosPesquisa;
    }
    
    
    //Verifica se p é nó externo
    private boolean verificaNoExterno(NoArvorePatricia noAtual){
        Class classe = noAtual.getClass();
        return classe.getName().equals(NoExternoArvorePatricia.class.getName());
    }
    
    //retorna o i-ésimo bit, a partir da esquerda, da chave passada nos parâmetros
    private int testaBit(int posicaoAtual, char chaveInsercao){
        if(posicaoAtual == 0)
            return 0;
        int c =(int)chaveInsercao;
        for(int j = 1; j<= this.numeroDeBitsNaChave - posicaoAtual; j++)
            c = c/2;
        return c%2;
    }
    
    
    //determina a subárvore onde um nó externo deve ser criado;
    //gera o nó interno que será pai do externo recém-comcebido;
    //transforma a raiz corrente da subárvore no outro filho do nó interno
    private NoArvorePatricia InsereEntre(char chaveInsercao, NoArvorePatricia raizAtual, int posicaoAtual){
        NoInternoArvorePatricia aux = null;
        if(!this.verificaNoExterno(raizAtual)){
             aux = (NoInternoArvorePatricia) raizAtual;
        }
        //a partir da raiz, a posicao correta para insercao do nodo é pesquisada
        if(this.verificaNoExterno(raizAtual) || (posicaoAtual < aux.indice)){ //cria um novo nó externo
            
            //Na posicao correta é criado um novo nó externo com a chave a ser inserida
            NoArvorePatricia p = this.criaNoExterno(chaveInsercao);
           
            //e um nó interno onde um filho é a chave corrente e o outro é a raiz inserida
            if(this.testaBit(posicaoAtual, chaveInsercao) == 1){
                return this.criaNoInterno(posicaoAtual, raizAtual, p);
            }
            else{
                return this.criaNoInterno(posicaoAtual, p, raizAtual);
            }
        }
        else{
            //Se a posição não for a correta, buscar na árvore recursivamente
            if(this.testaBit(aux.indice, chaveInsercao) == 1){
                aux.filhoDireita = this.InsereEntre(chaveInsercao, aux.filhoDireita, posicaoAtual);
            }
            else{
                aux.filhoEsquerda = this.InsereEntre(chaveInsercao, aux.filhoEsquerda, posicaoAtual);
            }
            return aux;
        }
    }
    
    
    //insere um novo caractere do texto na arvore Patricia
    //Ou atualiza a quantidade de vezes que a chave apareceu na redação, caso ela já exista na árvore
    private NoArvorePatricia insere(char chaveInsercao, NoArvorePatricia raizAtual){
        // Se a subárvore corrente for vazia, é criado um nó externo contendo a chaveInsercao
        caracteresDistintos++;
        if(raizAtual == null){
            return this.criaNoExterno(chaveInsercao);
        }
        
        // Se a raiz da subárvore corrente for um nó interno, vai-se para a subárvore
        //indicada pelo bit da chaveInsercao de índice dado pelo nó corrente
        NoArvorePatricia p = raizAtual;
        while(!this.verificaNoExterno(p)){
           NoInternoArvorePatricia aux = (NoInternoArvorePatricia)p;
           if(this.testaBit(aux.indice, chaveInsercao) == 1){
               p = aux.filhoDireita;
            }
           else{
                p = aux.filhoEsquerda;
            }
        }
        
        // Se a subárvore corrente for simplesmente um nó externo, os bits da chaveInsercao
        //são comparados com os bits correspondentes da chaveInsercao deste nó externo até encontrar
        //um índice i cujos bits difiram
        NoExternoArvorePatricia aux = (NoExternoArvorePatricia)p;
        int i = 1; // acha o primeiro bit diferente
        while((i <= this.numeroDeBitsNaChave) && (this.testaBit(i, chaveInsercao) == this.testaBit(i, aux.chave))){
            i++;
        }
        if(i > this.numeroDeBitsNaChave){
            System.out.println("Erro: chave ja esta na arvore");
            caracteresDistintos--;
            aux.quantidade++;
            return raizAtual;
        }
        else{
            return this.InsereEntre(chaveInsercao, raizAtual, i);
        }
    }
        
}
