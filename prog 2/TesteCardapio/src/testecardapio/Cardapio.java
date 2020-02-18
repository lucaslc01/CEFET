
package testecardapio;


public class Cardapio {
    
    private Refeicao[][] cardapio = new Refeicao [6][7];;
    private double totalCalorias = 0.0;

    public Cardapio() {
        for(int k=0;k<6;k++){
            for(int l=0;l<7;l++){
                cardapio[k][l] = new Refeicao();
            }
        }
    }

    public Refeicao[][] getCardapio() {
        return cardapio;
    }

    public void setCardapio(String descricao, double calorias, int i, int j) {
        cardapio[i][j].setComida(descricao);
        cardapio[i][j].setCalorias(calorias);
    }

    public double getTotalCalorias() {
        return totalCalorias;
    }

    public void setTotalCalorias(double totalCalorias) {
        this.totalCalorias = totalCalorias;
    }
    
   
    public void exibe(){
        for(int i=0;i<6;i++){
            if(i==0)
                System.out.println("Cafe da manha:");
            if(i==1)
                System.out.println("Lanche da manha:");
            if(i==2)
                System.out.println("Almoco");
            if(i==3)
                System.out.println("Lanche da tarde");
            if(i==4)
                System.out.println("Jantar");
            if(i==5)
                System.out.println("Ceia");
            
            for(int j=0;j<7;j++){
                if(j==0)
                    System.out.println("Segunda-feira");
                if(j==1)
                    System.out.println("Terca-feira");
                if(j==2)
                    System.out.println("Quarta-feira");
                if(j==3)
                    System.out.println("Quinta-feira");
                if(j==4)
                    System.out.println("Sexta feira");
                if(j==5)
                    System.out.println("Sabado");
                if(j==6)
                    System.out.println("Domingo");
                
                System.out.printf("\n\ndescricao: "+cardapio[i][j].getComida()+"\ncalorias: "+cardapio[i][j].getCalorias()+"\n\n");
            }
        }
    }
    
    public double calculaCalorias(int diaSemana){
        for(int i=0;i<6;i++){
            totalCalorias += cardapio[i][diaSemana].getCalorias();
        }
        return totalCalorias;
    }
    
}
