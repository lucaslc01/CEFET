package atividade100;
// classe enquete
public class Enquete
{
	// declaracao de variaveis
	private int notaMedia;

	//construtor
	public Enquete()
	{
		this.notaMedia = 0;
	}

	public int getNotaMedia() {
		return notaMedia;
	}

	public void setNotaMedia(int notaMedia) {
		this.notaMedia = notaMedia;
	}

	//metodo para ver frequencia das notas
	public void frequenciaDasNotas(int clientes[])
	{
		int[] contNotas = new int[10];

		for(int j=0;j<contNotas.length; j++)
		{
			contNotas[j] = 0;
		}

		for (int k=0; k<clientes.length; k++){
			for(int i=0; i<contNotas.length;i++){
				if (clientes[k] == i+1)
					contNotas[i]++;
			}
		}
		
		for(int l=0; l<contNotas.length; l++)
			System.out.println("Nota " + (l+1) + ": " + contNotas[l]);
	}

	// metodo para calcular a nota media
	public int mediaNota(int clientes[])
	{
		for(int i=0;i<clientes.length;i++)
		{
			notaMedia = notaMedia + clientes[i];
		}

		notaMedia = notaMedia/clientes.length;

		return notaMedia;
	}

	//metodo para informar o numero de clientes entrevistados
	public void nEntrevistados(int clientes[])
	{
		System.out.println("O numero de alunos entrevistados foi de " + clientes.length);
	}
}