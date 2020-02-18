import java.util.*;

public class Teste
{
	public static void main(String[] args)
	{
		//instanciando
		Ponto2D p1 = new Ponto2D(1,1);
		Ponto2D p2 = new Ponto2D(2,2);
		Ponto2D p3 = new Ponto2D(2,1);

		Triangulo t = new Triangulo();


		//chamando a classe Ponto2D e seus metodos para mostrar
		System.out.print("A distancia entre os dois pontos e: " +p1.calculaDistancia(p2));

		if(t.formaTriangulo(p1,p2,p3) == true) //verifica se forma um triangulo
		{
			System.out.println("\nOs pontos formam um triângulo");
				
			if(t.isosceles(p1,p2,p3) == true)
			{
				System.out.println("\nForma um triangulo isosceles");

				if(t.equilatero(p1,p2,p3) == true) // verifica se o triangulo formado é equilatero
					System.out.println("\nForma um triangulo equilatero");
				else
				{}
			}
			else
				System.out.println("\nForma um triangulo escaleno");

			System.out.printf("\n O perimetro e = %.2f",t.perimetro(p1,p2,p3));
			System.out.printf("\nA área do triângulo mede = %.2f\n",t.area(p1,p2,p3));
		}
		else
			System.out.println("\nOs pontos NÃO formam um triângulo\n");

	}
}