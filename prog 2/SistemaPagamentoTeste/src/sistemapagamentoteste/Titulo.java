
package sistemapagamentoteste;


public class Titulo extends Conta{
    
    private double valor;
    private boolean atrasou;
    
    public Titulo(){
        super();
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public boolean getAtrasou() {
        return atrasou;
    }

    public void setAtrasou(boolean atrasou) {
        this.atrasou = atrasou;
    }
    
    
    
    @Override
    public double getValorAPagar(){
        if(atrasou == true){
            valor += valor*0.1;
            return valor;
        }
        else
            return valor;
    }
}
