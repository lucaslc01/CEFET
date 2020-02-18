public class Ponto2D
{
	//atributos
	private double x;
	private double y;
	private Ponto2D p;

	//construtores
	public Ponto2D()
	{
		this.x = 0;
		this.y = 0;
	}

	public Ponto2D(double x, double y)
	{
		this.x = x;
		this.y = y;
	}

	public Ponto2D(Ponto2D p)
	{
		this.p = new Ponto2D();
	}

	//metodos setting getting
	public void setX(double x)
	{
		this.x = x;
	}

	public double getX()
	{
		return x;
	}

	public void setY(double y)
	{
		this.y = y;
	}

	public double getY()
	{
		return y;
	}

	//metodo para calcular a distancia entre os dois pontos
	public double calculaDistancia(Ponto2D p2)
	{
		double d;		
		d = Math.sqrt( Math.pow(p2.getX()-this.x , 2) + Math.pow(p2.getY()-this.y , 2));

		return d;
	}

}
