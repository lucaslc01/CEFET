
package sistemapagamentoteste;


public class Concessionaria extends Conta {
    
    public Concessionaria(){
        super();
    }
    
    @Override
    public double getValorAPagar(){
        return valor;
    }
}
