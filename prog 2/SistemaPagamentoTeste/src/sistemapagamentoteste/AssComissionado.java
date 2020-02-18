
package sistemapagamentoteste;


public class AssComissionado extends Comissionado {
    
    public AssComissionado(){
        super();
    }
    
    @Override
    public double getValorAPagar(){
        double x = (0.1)*(954.00) + (ganhoDaVenda(double ValorDaVenda));
        return x;
    }
}
