
package sistemapagamentoteste;


public abstract class Empregado implements Pagavel {
    protected String nome,sobrenome;
    protected int numeroIdentificacao;

    public Empregado() {
        this.nome = null;
        this.sobrenome = null;
        this.numeroIdentificacao = 0;
    }

    /*public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public int getNumeroIdentificacao() {
        return numeroIdentificacao;
    }

    public void setNumeroIdentificacao(int numeroIdentificacao) {
        this.numeroIdentificacao = numeroIdentificacao;
    }*/
    
    
    
    
}
