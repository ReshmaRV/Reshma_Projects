package common;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Properties;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Administrator
 * 
 * set username and password first
 */
public class JavaEmail {

 
  Properties emailProperties;
  Session mailSession;
  MimeMessage emailMessage;
 
  public static void main(String args[]) throws AddressException,
      MessagingException {
 
    JavaEmail javaEmail = new JavaEmail();
 
    javaEmail.setMailServerProperties();
    javaEmail.createEmailMessage();
    javaEmail.sendEmail();
  }
 
  public void setMailServerProperties() {
 
    String emailPort = "587";//gmail's smtp port
 
    emailProperties =System.getProperties();
    emailProperties.put("mail.smtp.port", emailPort);
    emailProperties.put("mail.smtp.auth", "true");
    emailProperties.put("mail.smtp.starttls.enable", "true");
 
  }
 
  public void createEmailMessage() throws AddressException,
      MessagingException {
    String[] toEmails = { "sreejithekm.pc@gmail.com" };
    String emailSubject = "sree";
    String emailBody = "hai.. test mail..";
 
    mailSession = Session.getDefaultInstance(emailProperties, null);
    emailMessage = new MimeMessage(mailSession);
 
    for (int i = 0; i < toEmails.length; i++) {
      emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
    }
 
    emailMessage.setSubject(emailSubject);
    //emailMessage.setContent(emailBody, "text/html");//for a html email
    emailMessage.setText(emailBody);// for a text email
 
  }
 
  public void sendEmail() throws AddressException, MessagingException {
 
    String emailHost = "smtp.gmail.com";
    String fromUser = "lccjavateamtestmail";//just the id alone without @gmail.com
    String fromUserEmailPassword = "javateam2015";
 
    Transport transport = mailSession.getTransport("smtp");
 
    transport.connect(emailHost, fromUser, fromUserEmailPassword);
    transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
    transport.close();
    System.out.println("Email sent successfully.");
  }
 
}


