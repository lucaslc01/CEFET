package Fonte;

import java.util.*;
import java.text.*;
public class Relogio
{
	private Contador horas;
	private Contador minutos;
	private String ind = "AM";

	private final int H_12 = 0;
	private final int H_24 = 1;
	private DecimalFormat df = new DecimalFormat("##,00");  
	public Relogio()
	{
		horas = new Contador();
		minutos = new Contador();
	}

	public void ticTac(int type) //atualiza as horas quando os minutos zeram
	{
		if(type == 0){
			if(minutos.getValor() < 59 ){
				minutos.incrementar();
			}else if(minutos.getValor() == 59){
				minutos.setValor(0);
				if(horas.getValor() < 12)
				{
					horas.incrementar();
				}else{
					horas.setValor(1);
					ind = "PM";
				}
			}
		}else if(type == 1){
			if(minutos.getValor() < 59 ){
				minutos.incrementar();
			}else if(minutos.getValor() == 59){
				minutos.setValor(0);
				if(horas.getValor() < 23)
				{
					horas.incrementar();
				}else{
					horas.setValor(1);
				}
			}
		}
		
	}

	public void mostrar(int formato)
	{
		if(formato == 12)
		{
			horas.setValor(1);
			for(int a = 0 ; a < 1440  ; a++){
                           
				System.out.printf(df.format(horas.getValor())+":"+ df.format(minutos.getValor())+" "+ind+"\n");	
				ticTac(H_12);
			}
		} else if(formato == 24){
			for(int a = 0 ; a < 1440  ; a++){

				System.out.printf(horas.getValor() + " : " , minutos.getValor() +"\n");	

				ticTac(H_24);
			}	
		}else{
			System.out.println("erro");
		}
	}
}