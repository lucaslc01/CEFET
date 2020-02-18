
package teste;

import java.util.ArrayList;
import java.util.Scanner;
public class Teste {

    
    public static void main(String[] args) {
        ArrayList<Cliente> tabela = new ArrayList<Cliente>(); //instanciando array de clientes;
        Scanner input = new Scanner(System.in);
        
        int id,idade,telefone; //campos para alterar os campos da instancia cliente
        String nome;
        
        for(;;){ // for para verificar se o id nao é negativo. caso seja o laço é quebrado e exibe todos os clientes
            System.out.println("informe a id do cliente :");
            id = input.nextInt();
            if(id<0) //verifica se id é negativo
                break;
            System.out.println("informe a idade :");
            idade = input.nextInt();
            System.out.println("informe o telefone :");
            telefone = input.nextInt();
            System.out.println("informe o nome :");
            nome = input.nextLine();
            
            tabela.add(new Cliente(id,idade,telefone,nome)); //manda as informacoes para o array de clientes;
        }
        
        for(int i=0;i<tabela.size();i++){ // exibe todos os clientes chamando o metodo exibirClientes da classe clientes;
            tabela.get(i).exibirClientes();
        }
    }
    
}
