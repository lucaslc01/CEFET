
package testecardapio;

public class Refeicao {
    
    private String comida;
    private double calorias;
    
    public Refeicao(String comida,double calorias){     // 2 construtores;
        this.comida = comida;
        this.calorias = calorias;
    }
    public Refeicao(){
        comida = "";
        calorias = 0.0;
    }

    public String getComida() {
        return comida;
    }

    public void setComida(String comida) {
        this.comida = comida;
    }

    public double getCalorias() {
        return calorias;
    }

    public void setCalorias(double calorias) {
        this.calorias = calorias;
    }
    
    
}
