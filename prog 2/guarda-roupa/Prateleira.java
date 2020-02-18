// criacao da classe
public class Prateleira
{
	//declaracao dos atributos
	private String material;
	private int tamanho;

	//contrutor
	public Prateleira(String material, int tamanho)
	{
		this.material = "nao definido";
		this.tamanho  = 0;
	}

	//setting e getting (métodos)

	public String getMaterial()
	{
		return material;
	}

	public void setMaterial(String material)
	{
		this.material = material;
	}

	public int getTamanho()
	{
		return tamanho;
	}

	public void setTamanho(int tamanho)
	{
		this.tamanho = tamanho;
	}

	//outros métodos
	private void armazenarRoupa(Roupa roupa)
	{
		NAO SEI FAZER
	}

	private void retirarRoupa(Roupa roupa)
	{
		NAO SEI FAZER
	}
}