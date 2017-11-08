/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package security;

import common.Constants;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.zip.ZipInputStream;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import security.SteganoInformation;

/**
 *
 * @author Administrator
 */
public class RetrieveData {
 
    private byte features=4,byteArrayIn[];
    private static int i, j, inputOutputMarker, messageSize, tempInt;
    private static File masterFile;//=new File();
    private static Cipher cipher;
    String message="Decrypted message";
    
        // Retrieves an embedded message from a Master file
	public String retrieveMessage(SteganoInformation info)
	{
		String messg= null;
		features= info.getFeatures();

		try
		{
			masterFile= info.getFile();
			byteArrayIn= new byte[(int) masterFile.length()];

			DataInputStream in= new DataInputStream(new FileInputStream(masterFile));
			in.read(byteArrayIn, 0, (int)masterFile.length());
			in.close();

			messageSize= info.getDataLength();
			
			byte[] messageArray= new byte[messageSize];
			inputOutputMarker= info.getInputMarker();
			readBytes(messageArray);
			
                        ByteArrayOutputStream by= new ByteArrayOutputStream();
                        DataOutputStream out= new DataOutputStream(by);

                        ZipInputStream zipIn= new ZipInputStream(new ByteArrayInputStream(messageArray));
                        zipIn.getNextEntry();
                        byteArrayIn= new byte[1024];
                        while((tempInt= zipIn.read(byteArrayIn, 0, 1024))!= -1)
                                out.write(byteArrayIn, 0, tempInt);

                        zipIn.close();
                        out.close();
                        messageArray= by.toByteArray();
                        messageSize= messageArray.length;
			
			messg= new String(SteganoInformation.byteToCharArray(messageArray));
		}
		catch(Exception e)
		{
			return("#NODATA#");
		}

		message= "Message size: "+ messageSize+ " B";
		return messg;
	}
        
        // Method used to read bytes into the output array
	private void readBytes(byte[] bytes)
	{
		int size= bytes.length;
		for(int i=0; i< size; i++)
		{
			bytes[i]= byteArrayIn[inputOutputMarker];
			inputOutputMarker++;
		}                
	}
        
        public String RetrieveData(File masterFile){
            SteganoInformation steg;
            steg= new SteganoInformation(masterFile);
            return retrieveMessage(steg);            
        }        
        
//        public static void main(String []str){
//            File f=new File(Constants.PROJECT_PATH+"tempfiles/1.jpg");
//            new RetrieveData(f);
//        }
}
