package Fonte;

import java.util.*;

public class TesteRelogio
{
	public static void main(String[] args)
	{
		//instanciando
		Relogio relogio = new Relogio();
		Scanner input = new Scanner(System.in);
                
		int formato = 0;

		//solicitando o formato aou usuario para ser exibido

		System.out.println("Informe o formato do relogio que deseja exibir :");
		relogio.mostrar(input.nextInt());
	}
}