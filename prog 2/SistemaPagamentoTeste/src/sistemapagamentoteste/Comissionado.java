
package sistemapagamentoteste;


public class Comissionado extends Empregado {
    
    private double vendas,ganhoDaVenda;
    
    public Comissionado() {
        super();
        vendas = 0.0;
        ganhoDaVenda = 0.0;
    }
    
    public void ganhoDaVenda(double valorDaVenda){
        ganhoDaVenda = 0.06 * valorDaVenda;
        vendas += ganhoDaVenda;
    }
  
    
    
    @Override
    public double getValorAPagar(){
        return this.vendas;
    }
    
}
