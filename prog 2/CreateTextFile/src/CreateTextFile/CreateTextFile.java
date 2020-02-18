
package CreateTextFile;

import java.io.FileNotFoundException;
import java.util.Formatter;
import java.util.FormatterClosedException;
import java.util.Scanner;


public class CreateTextFile { //COMO CRIAR UM ARQUIVO DE ACESSO SEQUENCIAL

    private static Formatter output; //envia uma saida de texto para um arquivo
    
    public static void main(String[] args) {
      openFile();
      addRecords();
      closeFile();
    }
    
    public static void openFile()
    {
        try
        {
            output = new Formatter("clientes.txt");// abre o arquivo
        }
        catch(SecurityException securityException)
        {
            System.err.println("Write permission denied.");
            System.exit(1);
        }
        catch(FileNotFoundException fileNotFoundException)
        {
            System.err.println("Error opening file.");
            System.exit(1);
        }
        
    }
    
    public static void addRecords()
    {
        Scanner input = new Scanner(System.in);
        System.out.printf("%s\n%s\n? ","Enter account number , first name, last name and balance","Enter end-of-file indicator to end input.");
        String verifica;
        boolean verificou = true;
        
       do
        {
            try
            {
                output.format("%d %s %s %.2f\n",input.nextInt(),input.next(),input.next(), input.nextDouble());
            }//le os dados e gera uma saida com um registro usando o formatter
            catch(FormatterClosedException formatterClosedException)
            {
                System.err.println("Error writin to file.");
            }
            finally
            {
                System.out.println("Type sair for terminate or no for not");
                verifica = input.next();
                if(verifica.equalsIgnoreCase("sair"))
                    verificou = false;
                
            }
        }while(verificou);
    }
    
    public static void closeFile()
    {
        if(output != null)
            output.close();
    }
    
}
