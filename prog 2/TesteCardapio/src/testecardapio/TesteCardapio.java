
package testecardapio;

import java.util.*;
public class TesteCardapio {

   
    public static void main(String[] args) {
       Cardapio cardapio = new Cardapio();
       Scanner input = new Scanner(System.in);
       
       int opcao,diaSemana,tipoRefeicao;
       String descricao;
       double calorias;
       
       System.out.println("Digite 1 para incluir refeicao, 2 para excluir, 3 para substituir, 4 para listar, 5 para calcular as calorias consumidas na semana e 0 para sair :");
       opcao = input.nextInt();
       do{
           switch(opcao){
               case 1: System.out.println("Informe o tipo de refeicao (0-cafe da manha, 1-lanche da manha, 2-almoco, 3-lanche da tarde, 4-jantar e 5-ceia):");
                       tipoRefeicao = input.nextInt();
                       System.out.println("Informe o dia da semana (0-segunda ,1-terca, 2-quarta, 3-quinta, 4-sexta, 5-sabado, 6-domingo) :");
                       diaSemana = input.nextInt();
                       System.out.println("Informe a descricao das refeicoes: ");
                       descricao = input.nextLine();
                       input.next();
                       System.out.println("Informe as calorias totais :");
                       calorias = input.nextDouble();
                      
                       cardapio.setCardapio(descricao,calorias,tipoRefeicao,diaSemana);
                       break;
                      
               case 2: System.out.println("Informe o tipo de refeicao a (0-cafe da manha, 1-lanche da manha, 2-almoco, 3-lanche da tarde, 4-jantar e 5-ceia):");
                       tipoRefeicao = input.nextInt();
                       System.out.println("Informe o dia da semana (0-segunda ,1-terca, 2-quarta, 3-quinta, 4-sexta, 5-sabado, 6-domingo) :");
                       diaSemana = input.nextInt();
                       cardapio.setCardapio("nenhuma", 0.0, tipoRefeicao, diaSemana);
                       break;
                      
               case 3: System.out.println("Informe o tipo de refeicao (0-cafe da manha, 1-lanche da manha, 2-almoco, 3-lanche da tarde, 4-jantar e 5-ceia):");
                       tipoRefeicao = input.nextInt();
                       System.out.println("Informe o dia da semana (0-segunda ,1-terca, 2-quarta, 3-quinta, 4-sexta, 5-sabado, 6-domingo) :");
                       diaSemana = input.nextInt();
                       System.out.println("Informe a descricao das refeicoes: ");
                       descricao = input.nextLine();
                       input.next();
                       System.out.println("Informe as calorias totais :");
                       calorias = input.nextDouble();
                      
                       cardapio.setCardapio(descricao,calorias,tipoRefeicao,diaSemana);
                       break;
                      
               case 4: cardapio.exibe();
                       break;
                       
               case 5: System.out.println("Escolha a semana (0-segunda ,1-terca, 2-quarta, 3-quinta, 4-sexta, 5-sabado, 6-domingo)");
                       diaSemana = input.nextInt();
                       System.out.printf("\nO total de calorias consumidas na semana foi de :"+cardapio.calculaCalorias(diaSemana));
                       break;
                      
           }
           System.out.println("\nDigite 1 para incluir refeicao, 2 para excluir, 3 para substituir, 4 para listar, 5 para calcular as calorias consumidas na semana e 0 para sair :");
           opcao = input.nextInt();
       }while(opcao !=0);
    }
    
}
