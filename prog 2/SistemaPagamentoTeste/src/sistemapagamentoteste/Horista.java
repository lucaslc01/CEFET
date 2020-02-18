
package sistemapagamentoteste;


public class Horista extends Empregado{
    
    private int horaExtra;
    public Horista() {
        super();
        this.horaExtra = 0;
    }

    public int getHoraExtra() {
        return horaExtra;
    }

    public void setHoraExtra(int horaExtra) {
        this.horaExtra = horaExtra;
    }
    
    
    
    @Override
    public double getValorAPagar(){
        double valor = 954.00;
        valor += ((this.horaExtra) * (8.00));
        return valor;
    }
}
