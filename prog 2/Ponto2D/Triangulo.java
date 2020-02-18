public class Triangulo
{
	private Ponto2D p1;
	private Ponto2D p2;
	private Ponto2D p3;
	double perimetro;

	public Triangulo()
	{
		p1 = new Ponto2D();
		p2 = new Ponto2D();
		p3 = new Ponto2D();
		perimetro = 0.0;
	}

	static boolean formaTriangulo(Ponto2D p1,Ponto2D p2,Ponto2D p3)
	{
		if((p1.calculaDistancia(p2) + p1.calculaDistancia(p3)) > p2.calculaDistancia(p3))
			if((p2.calculaDistancia(p1) + p2.calculaDistancia(p3)) > p1.calculaDistancia(p3))
				if((p3.calculaDistancia(p2) + p3.calculaDistancia(p1)) > p2.calculaDistancia(p1))
					return true;
		return false;
	}

	boolean equilatero(Ponto2D p1,Ponto2D p2,Ponto2D p3)
	{
		if(p1.calculaDistancia(p2) == p1.calculaDistancia(p3) && p1.calculaDistancia(p2) == p2.calculaDistancia(p3) && p1.calculaDistancia(p3) == p2.calculaDistancia(p3))
			return true;
		return false;
	}

	boolean isosceles(Ponto2D p1,Ponto2D p2,Ponto2D p3)
	{
		if(p1.calculaDistancia(p2) == p1.calculaDistancia(p3) || p1.calculaDistancia(p2) == p2.calculaDistancia(p3) || p1.calculaDistancia(p3) == p2.calculaDistancia(p3))
			return true;
		return false;
	}

	double perimetro(Ponto2D p1,Ponto2D p2,Ponto2D p3)
	{
		perimetro = p1.calculaDistancia(p2) + p1.calculaDistancia(p3) + p2.calculaDistancia(p3);

		return perimetro;
	}

	double area(Ponto2D p1,Ponto2D p2,Ponto2D p3)
	{
		double area = 0.0;
		area = Math.sqrt(perimetro/2 * (perimetro/2 - p1.calculaDistancia(p2)) * (perimetro/2 - p1.calculaDistancia(p3)) * (perimetro/2 - p2.calculaDistancia(p3)));

		return area;
	}
}