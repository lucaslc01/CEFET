package lista10;

import java.util.LinkedList;

public class fordFulkerson {

    /*grafo residual (grafoR) de um escoamento é um grafo que indica escoamentos adicionais. 
    Se esxiste um caminho de origem para o destino em um grafo residual, então é possível adicionar um escoamento. 
    Cada vértice de um grafo residual tem um valor chamado de capacidade rersidual que é igual a capacidade original
    do vértice o escoamento atual. Capacidade residual é basicamente a capacidade atual do vértice.*/
    final int V;    //Número de vértices no grafo
    int descendentes[][];

    int[][] grafoR;

    public fordFulkerson(int vertices) {
        descendentes = new int[vertices][vertices];
        this.V = vertices;
        grafoR = new int[V][V];

    }

    /* Retorna verdade se existe um caminho da origem 'verticeInicial' para o destino 
      'verticeFinal' em um grafo residual. também preenche parent[] para armazenar o caminho */
    boolean buscaEmLargura(int[][] grafoR, int verticeInicial, int verticeFinal, int parent[]) {
        // cria uma array visitada e marca como não visitada
        boolean[] visitada = new boolean[V];
        for (int i = 0; i < V; ++i) {
            visitada[i] = false;
        }

        // Cria a espera, que enfileira o vértice de origem e marcar o vértice de origem como visitado
        LinkedList<Integer> espera = new LinkedList<Integer>();
        espera.add(verticeInicial);
        visitada[verticeInicial] = true;
        parent[verticeInicial] = -1;

        // loop de busca em largura
        while (espera.size() != 0) {
            int u = espera.poll();

            for (int v = 0; v < V; v++) {
                if (visitada[v] == false && grafoR[u][v] > 0) {
                    espera.add(v);
                    parent[v] = u;
                    visitada[v] = true;
                }
            }
        }

        // Se chegarmos ao vértice destino na busca em largura a partir da fonte, então 
        // retorna true, senão false 
        return (visitada[verticeFinal] == true);
    }

    // retorna o escoamento máximo do verticeInicial para verticeFinal em um dado grafo 
    int fordFulkerson(int[][] grafo, int verticeInicial, int verticeFinal) {
        int u, v;

        // cria um grafo residual e o preenche
        // com a capacidade dada do grafo original como 
        // como capacidade residual no grafo residual 
        // Grafo residual onde grafoR[i][j] indica 
        // capacidade residual do vertice de i para j  
        // (se grafoR[i][j] é 0, então não existe) 
        for (u = 0; u < V; u++) {
            for (v = 0; v < V; v++) {
                grafoR[u][v] = grafo[u][v];
            }
        }

        // esse array é preenchido pela busca em largura para armazenar o caminho 
        int parent[] = new int[V];

        int escoamento_maximo = 0;  // não existe escoamento inicial

        int iteracao = 0;
        // Aumenta o escoamento enquanto existir um caminho da origem ao destino 
        while (buscaEmLargura(grafoR, verticeInicial, verticeFinal, parent)) {
            // Encontra a capacidade mínima residual dos vértices 
            // pelo caminho preenchido pela busca em profundidade.  
            // Ou então podemos dizer que  acha o escoamento máximo entre o caminho encontrado. 
            int caminho_escoamento = Integer.MAX_VALUE;
            for (v = verticeFinal; v != verticeInicial; v = parent[v]) {
                u = parent[v];
                caminho_escoamento = Math.min(caminho_escoamento, grafoR[u][v]);
            }

            // Atualiza a capacidade residual dos vértices e 
            // vértices reversos pelo caminho 
            for (v = verticeFinal; v != verticeInicial; v = parent[v]) {
                u = parent[v];
                grafoR[u][v] -= caminho_escoamento;
                grafoR[v][u] += caminho_escoamento;
            }
            descendentes[iteracao] = parent;
            iteracao++;
            // adiciona o caminho de escoamento ao escoamento total 
            escoamento_maximo += caminho_escoamento;
        }

        // Retorna o escoamento total 
        return escoamento_maximo;
    }

    public int[][] getGrafoR() {
        return grafoR;
    }

    public int[][] getPai() {
        return descendentes;
    }
}
