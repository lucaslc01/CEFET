
package sistemapagamentoteste;


public abstract class Conta implements Pagavel {
    protected int dia,mes;
    protected double valor;
    
    public Conta(){
        dia = 0;
        mes = 0;
        valor = 0.0;
    }
    
    
}
