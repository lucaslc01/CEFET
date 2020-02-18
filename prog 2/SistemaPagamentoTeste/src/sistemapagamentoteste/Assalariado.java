
package sistemapagamentoteste;


public  class Assalariado extends Empregado {

    private int horaExtra;
    
    public Assalariado() {
        super();
        horaExtra = 0;
    }

    public int getHoraExtra() {
        return horaExtra;
    }

    public void setHoraExtra(int horaExtra) {
        this.horaExtra = horaExtra;
    }
    
    
    
    @Override
    public double getValorAPagar() {
        double x = 954.00;
        x = x + horaExtra * 8;
        return x;
    }
    
    
}
