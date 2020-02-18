
package readtextfile;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.NoSuchElementException;
import java.util.Scanner;

public class ReadTextFile {

    private static Scanner input;//sera usado para recuperar a entrada do arquivo
    
    public static void main(String[] args) {
       openFile();
       readRecords();
       closeFile();
    }
    public static void openFile()
    {
        try
        {
            input = new Scanner(Paths.get("clients.txt")); //Passamos um objeto Path para o construtor,
            //que especifica que o objeto Scanner irá ler a partir do arquivo "clients.txt" localizado no diretório
            //em que o aplicativo é executado. Se o arquivo não puder ser localizado, ocorrerá uma IOException.
        }
    
        catch(IOException ioException)
        {
            System.err.println("Error opening file.");
            System.exit(1);
        }
    
    }

    public static void readRecords()
    {
        System.out.printf("%-10s%-12s%-12s%10s%n", "Account","First Name", "Last Name", "Balance");
    
        try
        {
            while(input.hasNext()) //enquanto houver mais para ler
            {
                System.out.printf("%-10d%-12s%-12s%10.2f\n",input.nextInt(),input.next(),input.next(),input.nextDouble());
                //utilizam os métodos Scanner nextInt, next e nextDouble para inserir um int (o número de conta), duas Strings 
                //(nomes e sobrenomes) e um valor de double (o saldo). Cada registro é uma linha de dados no arquivo. Se as informações 
                //no arquivo não estão adequadamente formatadas (por exemplo, há um sobrenome onde deveria haver um saldo), ocorre uma 
                //NoSuchElementException quando o registro é inserido.
            }
        }
        catch(NoSuchElementException elementException)
        {
           System.err.println("File improperly formed. Terminating."); 
        }
        catch(IllegalStateException stateException)
        {
            System.err.println("Error reading from file. Terminating.");
        }
    }
    
    public static void closeFile()
    {
        if(input != null)
            input.close();
    }
}
