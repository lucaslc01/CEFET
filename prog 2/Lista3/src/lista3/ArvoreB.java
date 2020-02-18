/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lista3;

/**
 *
 * @author Aluno
 */
public class ArvoreB {
     
    private Pagina pagRaiz;
    private final int minimoRegistrosPagina, maximoRegistrosPagina;
    private boolean arvoreDesbalanceada;
    private int regRetorno;
    private int paginasVisitadas;
    private int numeroComparacoes;
    
    public ArvoreB(int qtdeminimaRegistros){
        this.pagRaiz = null;
        this.minimoRegistrosPagina = qtdeminimaRegistros;
        this.maximoRegistrosPagina = 2*qtdeminimaRegistros;
        regRetorno = -1;
        paginasVisitadas = 0;
        numeroComparacoes = 0;
    }
    
    private Pagina insere(int registro, Pagina paginaAtual){
        Pagina paginaRetorno = null;
        
        if(paginaAtual == null){
            arvoreDesbalanceada = true;
            regRetorno = registro;
            
        }
        else{
            int i = 0;
            
            while((i < paginaAtual.numeroCorrenteItens - 1) && (registro - paginaAtual.itensPagina[i] > 0)){
                i++;
            }
            
            if(registro == paginaAtual.itensPagina[i]){
                System.out.println("Erro: Registro ja existente");
                arvoreDesbalanceada = false;
            }
            else{
                if(registro - paginaAtual.itensPagina[i]>0){
                    i++;
                }
                paginaRetorno = insere(registro, paginaAtual.paginasFilhas[i]);
                if(arvoreDesbalanceada){
                    if(paginaAtual.numeroCorrenteItens < this.maximoRegistrosPagina){
                        paginaAtual.insereNaPagina(paginaAtual, regRetorno, paginaRetorno);
                        arvoreDesbalanceada = false;
                        paginaRetorno = paginaAtual;
                    }
                    else{
                        Pagina apTemp = new Pagina(this.maximoRegistrosPagina);
                        apTemp.paginasFilhas[0] = null;
                        
                        if (i <= this.minimoRegistrosPagina){
                            paginaAtual.insereNaPagina(apTemp , paginaAtual.itensPagina[this.maximoRegistrosPagina - 1], paginaAtual.paginasFilhas[this .maximoRegistrosPagina]); 
                            paginaAtual.numeroCorrenteItens --; 
                            paginaAtual.insereNaPagina(paginaAtual , regRetorno , paginaRetorno); 
                        }
                        else{
                            paginaAtual.insereNaPagina(apTemp, regRetorno, paginaRetorno);
                        }
                        for (int j = this.minimoRegistrosPagina + 1; j < this. maximoRegistrosPagina; j++) { 
                            paginaAtual.insereNaPagina(apTemp , paginaAtual.itensPagina[j], paginaAtual.paginasFilhas[j + 1]); 
                            paginaAtual.paginasFilhas[j + 1] = null; 
                        }
                        
                        paginaAtual.numeroCorrenteItens = this.minimoRegistrosPagina ; 
                        apTemp.paginasFilhas[0] = paginaAtual.paginasFilhas[this. minimoRegistrosPagina + 1]; 
                        regRetorno = paginaAtual.itensPagina[this.minimoRegistrosPagina]; 
                        paginaRetorno = apTemp;
                    }
                }
            }
        }
        return (arvoreDesbalanceada ? paginaRetorno : paginaAtual);
    }
    
    private static class Pagina{
         int numeroCorrenteItens;
         int itensPagina[];
         Pagina paginasFilhas[];
     
         public Pagina(int qtdemaximaRegistros){
         this.numeroCorrenteItens = 0;
         this.itensPagina = new int[qtdemaximaRegistros];
         this.paginasFilhas = new Pagina[qtdemaximaRegistros + 1];
         }
        
         private void insereNaPagina(Pagina paginaAtual, int registro, Pagina filhaDireita){
             int k = paginaAtual.numeroCorrenteItens - 1;
             
             while(k >= 0 && (registro - paginaAtual.itensPagina[k]) < 0){
                 paginaAtual.itensPagina[k+1] = registro;
                 paginaAtual.paginasFilhas[k+2] = filhaDireita;
                 paginaAtual.numeroCorrenteItens++;
             }
         } 
     }
    
    private int pesquisa(int reg, Pagina ap){
        if(ap == null)
            return 0;
        else{
            int i = 0;
            while((i < ap.numeroCorrenteItens-1) && reg >0){
                numeroComparacoes++;
                i++;
            }
            
            if(reg == 0){
                paginasVisitadas++;
                return ap.itensPagina[i];
            }
            else if(reg < 0){
                paginasVisitadas++;
                return pesquisa(reg, ap.paginasFilhas[i]);
            }
            
            else{
                paginasVisitadas++;
                return pesquisa(reg,ap.paginasFilhas[i+1]);
            }
        }
    }
    
    public int pesquisa(int reg){
        return pesquisa(reg,pagRaiz);
    }
     
    public void insere(int reg){
        insere(reg,pagRaiz);
    }
    
    public int getPaginasVisitadas(){
        return paginasVisitadas;
    }
    
    public int getNumeroComparacoes(){
        return numeroComparacoes;
    }
}
