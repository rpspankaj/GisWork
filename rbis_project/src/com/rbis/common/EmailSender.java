package com.rbis.common;




import java.util.Properties;
import javax.mail.AuthenticationFailedException;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;


public class EmailSender {

    private static final String SERVER = "smtp.gmail.com";
    public static String errorType = "UNKNOWN";
    private static String fromAddress, username, password;

    public static synchronized boolean sendMail(final String toAddress,
            final String subject, final String content) {
        
        new Thread(new Runnable() {

            public void run() {
                try {
                fromAddress = "\"RBIS\"<ashishkumargautam99@gmail.com>";
                username = "ashishkumargautam99@gmail.com";
                password = "agautam111";
                Properties properties = System.getProperties();

                //properties.setProperty("http.proxyHost", "172.16.50.1");
                //properties.setProperty("http.proxyPort", "25");
                properties.put("mail.smtps.host", SERVER);
                properties.put("mail.smtps.auth", "true");
                properties.put("mail.smtps.quitwait", "false");
                Session session = Session.getInstance(properties);
                
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(fromAddress));
                    if (toAddress != null) {
                        msg.addRecipients(Message.RecipientType.TO, toAddress);
                    }
                    msg.setSubject(subject);
                    // Create the message part
                    BodyPart messageBodyPart = new MimeBodyPart();
                    // Fill the message
                    messageBodyPart.setContent(content, "text/html");
                    // Create a Multipart
                    Multipart multipart = new MimeMultipart();
                    // Add part one
                    multipart.addBodyPart(messageBodyPart);
                    msg.setContent(multipart);
                    msg.saveChanges();
                    Transport tr = session.getTransport("smtps");
                    tr.connect(SERVER, username, password);
                    tr.sendMessage(msg, msg.getAllRecipients());
                    tr.close();
                    
                } catch (AuthenticationFailedException e) {
                    JOptionPane.showMessageDialog(null, "Email could not be send to "
                            + "recepients.\n\n\t\tYour Email ID or password is invalid.\n"
                            + "\t\tCorrect it and try again.\n\n" + (e != null ? e : "") + "\n" + toAddress + "\t" + subject + "\n" + content,
                            "Authentication Failed:",
                            JOptionPane.WARNING_MESSAGE);
                    errorType = "AUTHENTICATION_FAILED";

                } catch (SendFailedException e) {
                    JOptionPane.showMessageDialog(null, "Email could not be send to "
                            + "recepients.\n\n\t\tYour To:, CC:,"
                            + "BCC: Email addresses are invalid.\n"
                            + "\t\tCorrect it and try again.\n\n" + (e != null ? e : "") + "\n" + toAddress + "\n" + subject + "\n" + content,
                            "Send Failed Error:",
                            JOptionPane.WARNING_MESSAGE);
                    errorType = "SEND_FAILED";

                } catch (MessagingException e) {
                    JOptionPane.showMessageDialog(null, "Email could not be send to "
                            + "recepients.\nMessaging Error:\n" + (e != null ? e : "") + "\n" + toAddress + "\n" + subject + "\n" + content,
                            "Messging Error:", JOptionPane.WARNING_MESSAGE);
                    errorType = "MESSAGING_EXCEPTION";

                }
            }
        }).start();


return true;
    }
}
