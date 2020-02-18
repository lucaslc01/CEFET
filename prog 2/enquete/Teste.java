package atividade100;

import java.security.SecureRandom;
import java.util.*;


public class Teste
{
	public static void main(String[] args)
	{
		//variaveis
		Enquete e = new Enquete();
		int []clientes;
		Scanner input = new Scanner(System.in);
		SecureRandom gerador = new SecureRandom();
		System.out.println("Insira o numero de clientes: ");
		clientes = new int[input.nextInt()];
		
		for (int i=0; i< clientes.length; i++)
			clientes[i] = gerador.nextInt(10) + 1;
	
		e.frequenciaDasNotas(clientes);
		System.out.println("Nota média: " + e.mediaNota(clientes));
		e.nEntrevistados(clientes);
	}
}