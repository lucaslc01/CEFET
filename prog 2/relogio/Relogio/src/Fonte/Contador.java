package Fonte;

public class Contador
{
	private int valor;

	public Contador()
	{
		this.valor = 0;
	}

	public void setValor(int valor)
	{
		this.valor = valor;
	}

	public int getValor()
	{
		return valor;
	}

	public void incrementar()
	{
		this.valor += 1;

	}
}