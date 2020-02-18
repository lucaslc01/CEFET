
package teste;

import java.util.ArrayList;
public class Cliente {
    private int id,idade,telefone;
    private String nome;

    public Cliente(int id, int idade, int telefone, String nome) {
        this.id = id;
        this.idade = idade;
        this.telefone = telefone;
        this.nome = nome;
    }
    
    public Cliente() {
        this.id = 0;
        this.idade = 0;
        this.telefone = 0;
        this.nome = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getTelefone() {
        return telefone;
    }

    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public void exibirClientes(){  // mostra os dados do cliente
        System.out.printf("ID : %d",getId() +"Idade : %d",getIdade() +"Telefone : %d",getTelefone() +"Nome : %s",getNome());
    }
    
}
