/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package common;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.ServletInputStream;

/**
 * @author Sreejith
 */
public class ImageBuffer {
        private String filename = "",destFolder = "",contentType = "",boundary = "",realPath="";
        private String imageFolder="",file,voterid="",folderPath="";
	private int startPos = 0,endPos = 0,formDataLength=0,byteRead = 0,totalBytesRead = 0,pos = 0; 
        private int lastIndex,boundaryLocation;
        private DataInputStream dis,dis1;
        private byte dataBytes[];
        private FileOutputStream fileOut;
        public static final int OFFSET_JPG= 3,OFFSET_PNG= 42,OFFSET_GIF_BMP_TIF= 32;
        public static final short HEADER_LENGTH= 15* 4;
        public static final byte[] VERSION_BYTE= {'2','0','0'};
        private static short compressionRatio= 0, temp;
        String message="",password="";
        private byte features=4,byteArrayIn[],byte1, byte2, byte3;
        private int inputFileSize,i, j, inputOutputMarker, messageSize, tempInt;
        private ByteArrayOutputStream byteOut;
        private String masterExtension;
        
        private void setData()throws Exception{
            while (totalBytesRead < formDataLength)  
		{	  
                    byteRead = dis1.read(dataBytes, totalBytesRead, formDataLength);  
                    totalBytesRead += byteRead;  
		}
            file=new String(dataBytes);
        }        
        private void setFileName(){
            filename=file.substring(file.indexOf("filename=\"")+10);
            filename=filename.substring(0,filename.indexOf("\n"));
            filename=filename.substring(filename.lastIndexOf("\\")+1,filename.indexOf("\""));
            lastIndex=contentType.lastIndexOf("=");
            boundary=contentType.substring(lastIndex+1,contentType.length());
        }
        private void setPosition(){
            pos=file.indexOf("filename=\"");
            pos=file.indexOf("\n",pos)+1;
            pos=file.indexOf("\n",pos)+1;
            pos=file.indexOf("\n",pos)+1;
            boundaryLocation=file.indexOf(boundary,pos)-4;
            startPos=((file.substring(0,pos)).getBytes()).length;
            endPos=((file.substring(0,boundaryLocation))).getBytes().length;
        }
        private String setPath(){                  
            System.out.println("App Path : "+realPath);
            destFolder=realPath.substring(0,realPath.indexOf("build"));
            destFolder =destFolder+folderPath+"/";//"web/Admin/candidate/";	  
            System.out.println("Destination : "+destFolder);
            filename=destFolder.concat(voterid+filename.substring(filename.lastIndexOf(".")));
            System.out.println("File Name :  "+filename);
            return filename;
        }
        private void writeImage()throws Exception{
            fileOut = new FileOutputStream(filename);  
            fileOut.write(dataBytes,startPos, (endPos - startPos));  
            fileOut.flush();  
            fileOut.close();
            filename=filename.substring(filename.indexOf(imageFolder+"/"));
        }
        public void initRequiredVars(String appPath,String voterid,String folderPath,String contentType,ServletInputStream sis,int formDataLength,String imageFolder){
            realPath = appPath;
            this.voterid=voterid;
            this.folderPath=folderPath;
            this.contentType=contentType;
            this.formDataLength=formDataLength;
            this.imageFolder=imageFolder;
            dataBytes=new byte[formDataLength];
            dis=new DataInputStream(sis);
            dis1=dis;
        }
        public String invokeRequiredFuns()throws Exception{
            setData();
            setFileName();
            setPosition();           
            String path=setPath();
            writeImage();
            return path;
        }
        public String getFileName(){
            return filename;
        }
        
        // Embeds a message into a Master file
	//public  boolean embedMessage(File masterFile, File outputFile, String msg, int compression)
        public  boolean embedMessage(String msg)
	{
		//System.out.println(msg);
                int compression=3;
                File outputFile=new File(Constants.PROJECT_PATH+filename.substring(filename.lastIndexOf("web")+1,filename.length()));//new File(filename);
                System.out.println(outputFile);
                File masterFile=outputFile;//new File(filename);
		try
		{      
			byteOut= new ByteArrayOutputStream();
			// Convert message into a character array
			byte []messageArray= msg.getBytes();
			messageSize= messageArray.length;
			//inputFileSize= (int) masterFile.length();
                        inputFileSize= (int)filename.length();
			// create a byte array of length equal to size of input file
			byteArrayIn= new byte[inputFileSize];

			// Open the input file read all bytes into byteArrayIn
			DataInputStream in= new DataInputStream(new FileInputStream(masterFile));
			in.read(byteArrayIn, 0, inputFileSize);
			in.close();
                        
			String fileName= masterFile.getName();
			masterExtension= fileName.substring(fileName.length()-3, fileName.length());

			if(masterExtension.equalsIgnoreCase("jpg"))
			{
				// Skip past OFFSET_JPG bytes
				byteOut.write(byteArrayIn, 0, OFFSET_JPG);
				inputOutputMarker= OFFSET_JPG;
			}
			else if(masterExtension.equalsIgnoreCase("png"))
					{
						// Skip past OFFSET_PNG bytes
						byteOut.write(byteArrayIn, 0, OFFSET_PNG);
						inputOutputMarker= OFFSET_PNG;
					}
				  else
					{
						// Skip past OFFSET_JPG_BMP_TIF bytes
						byteOut.write(byteArrayIn, 0, OFFSET_GIF_BMP_TIF);
						inputOutputMarker= OFFSET_GIF_BMP_TIF;
					}


                    // Convert the 32 bit input file size into byte array

                        byte tempByte[]= new byte[4];
			for(i=24, j=0; i>=0; i-=8, j++)
			{
				tempInt= inputFileSize;
				tempInt>>= i;
				tempInt&= 0x000000FF;
				tempByte[j]= (byte) tempInt;
			}
			// Embed 4 byte input File size array into the master file
			embedBytes(tempByte);

			// Write the remaining bytes
			byteOut.write(byteArrayIn, inputOutputMarker, inputFileSize- inputOutputMarker);
			inputOutputMarker= inputFileSize;

			// Embed the 3 byte version information into the file
			writeBytes(VERSION_BYTE);

			// Write 1 byte for features
			writeBytes(new byte[]{features});

			// Compress the message 
			
				ByteArrayOutputStream arrayOutputStream= new ByteArrayOutputStream();
				ZipOutputStream zOut= new ZipOutputStream(arrayOutputStream);
				ZipEntry entry= new ZipEntry("MESSAGE");
				zOut.setLevel(compression);
				zOut.putNextEntry(entry);

				zOut.write(messageArray, 0, messageSize);
				zOut.closeEntry();
				zOut.finish();
				zOut.close();

				// Get the compressed message byte array
				messageArray= arrayOutputStream.toByteArray();
				compressionRatio= (short) ((double)messageArray.length / (double)messageSize * 100.0);
				messageSize= messageArray.length;
			

			// Embed 1 byte compression ratio into the output file
			writeBytes(new byte[]{(byte) compressionRatio});
			
			// Convery the 32 bit message size into byte array
			tempByte= new byte[4];
			for(i=24, j=0; i>=0; i-=8, j++)
			{
				tempInt= messageSize;
				tempInt>>= i;
				tempInt&= 0x000000FF;
				tempByte[j]= (byte) tempInt;
			}
			// Embed 4 byte messageSize array into the master file
			writeBytes(tempByte);

			// Embed the message
			writeBytes(messageArray);

			DataOutputStream out= new DataOutputStream(new FileOutputStream(outputFile));
			//out.write(byteArrayOut, 0, byteArrayOut.length);
			byteOut.writeTo(out);
			out.close();
		}
		catch(EOFException e)
		{
		}
		catch(Exception e)
		{
			message= "Oops!!\nError: "+ e.toString();
			e.printStackTrace();
			return false;
		}

		message= "Message embedded successfully in file '"+ outputFile.getName()+ "'.";
		return true;
	}
        
        // Method used to write bytes into the output array
	private void embedBytes(byte[] bytes)
	{
		int size= bytes.length;

		for(int i=0; i< size; i++)
		{
			byte1= bytes[i];
			for(int j=6; j>=0; j-=2)
			{
				byte2= byte1;
				byte2>>= j;
				byte2&= 0x03;

				byte3= byteArrayIn[inputOutputMarker];
				byte3&= 0xFC;
				byte3|= byte2;
				byteOut.write(byte3);
				inputOutputMarker++;
			}
		}
	}
        
        // Method used to write bytes into the output array
	private void writeBytes(byte[] bytes)
	{
		int size= bytes.length;

		for(int i=0; i< size; i++)
		{
			byteOut.write(bytes[i]);
			inputOutputMarker++;
		}
	}

}
