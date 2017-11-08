<%-- 
    Document   : shareprocessing
    Created on : 29 Jan, 2015, 12:18:38 PM
    Author     : Administrator
--%>

<%@page import="sun.misc.BASE64Encoder"%>
<%@page import="java.net.NetworkInterface"%>
<%@page import="java.net.InetAddress"%>
<%@page import="security.RetrieveData"%>
<%@page import="dbconnection.QueryGenerator"%>
<%@page import="java.util.Date"%>
<%@page import="common.Constants"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<jsp:useBean id="settings" class="beanfiles.Settings"/>
<jsp:setProperty name="settings" property="*"/>
<jsp:useBean id="embed" class="security.EmbedData"/>
<jsp:useBean id="con" class="dbconnection.DbConnection"/>
<jsp:useBean id="enc" class="security.DataEncryption"/>

<%
    Date dt=new Date();
    String date_time="_"+dt.toGMTString();
    date_time=(date_time.substring(0, date_time.length()-4)).replace(" ", "").replace(":", "");
    settings.setUid(session.getAttribute("uid").toString());
    String []shareIDS=settings.getIds().split(" ");
    File orig=new File(Constants.PROJECT_PATH+"tempfiles/"+session.getAttribute("uid").toString()+".jpg");
    File dest=new File(Constants.PROJECT_PATH+"image_shares/"+session.getAttribute("uid").toString()+date_time+".jpg");
    Vector v=null;
    String uploadConfig="",shares="";
    String sharedBy=session.getAttribute("uid").toString();
    
    //checking for data in the image to be shared
    RetrieveData data=new RetrieveData();
    String existingData=data.RetrieveData(orig); 
    //data retrival
    try{
System.out.println("original: "+existingData);
        byte []decdata=existingData.trim().getBytes("ISO-8859-1");
        existingData=enc.decrypt(decdata);
    }catch(Exception ex){
        System.out.println("error..."+ex);
    }
System.out.println("decripted: "+ existingData);    

    if(existingData.substring(0, 1).equals("1") || existingData.equals("#NODATA#")){
        
        //setting configuration data
        Iterator it=settings.getData(4).iterator();
        if(it.hasNext()){
            v=(Vector)it.next();
            uploadConfig=v.get(0).toString()+":"+v.get(1).toString()+":"+v.get(2).toString()+"::"+sharedBy+"::";
            settings.setShare(v.get(0).toString());
            settings.setDownload(v.get(1).toString());
            settings.setSave(v.get(2).toString());

            for(int i=0;i<shareIDS.length;i++){
                shares=shareIDS[i];
                uploadConfig=uploadConfig+","+shareIDS[i];
            }uploadConfig=uploadConfig+":";   
        }
//***********************************        
        //data encription
//System.out.println("config: "+uploadConfig);        
//        byte[] codedtext = enc.encrypt(uploadConfig);
//        uploadConfig = new String(codedtext, "ISO-8859-1");
//System.out.println("config after enc: "+uploadConfig); 
//***********************************
//           BASE64Encoder encoder = new BASE64Encoder();
//         String imageString = encoder.encode(imageBytes);
//***********************************            
        //embedding data to image
        embed.embedMessage(orig,dest,uploadConfig,3);
    
        //database manipulation
        settings.setPath("image_shares/"+session.getAttribute("uid").toString()+date_time+".jpg");
        if(settings.putData(5)>0){
            String qry="";
            int status=0;
            String stat="NORM";
            if(v.get(0).toString().equals("0")){
                stat="SEQ";
            }
            for(int i=0;i<shareIDS.length;i++){
                qry="insert into share_id_record (shareID,userID,type) values(("+QueryGenerator.MAX_SHARE_ID+"),"+shareIDS[i]+",'"+stat+"')";
                System.out.println(qry);
                if(con.putData(qry)>0){
                    status=1;continue;
                }else{
                    status=0;break;
            }

                }
            if(status==1){
            orig.delete();
            %>
            <script>
                alert("Your share has been send..");
                window.location="../user/home.jsp";
            </script>
            <%
            }else{
                qry="delete from user_shares where shareID=("+QueryGenerator.MAX_SHARE_ID+")";
                con.putData(qry);
                %>
                <script>
                    alert("Sending failed..");
                    window.location="../user/home.jsp";
                </script>
                <%
            }
        }
    }else{
        //existingData=enc.decrypt(existingData.getBytes());
System.out.println(">>>>"+existingData+"<<<<");        
        String informTo=existingData.substring(7,8);
        String message="";
//        Iterator it=con.getData(QueryGenerator.GET_SHARE_DATE).iterator();
//        if(it.hasNext()){
            //getting ip address and mac address of the host
            InetAddress ip = InetAddress.getLocalHost();
            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
            byte[] mac = network.getHardwareAddress();    
            StringBuilder sb = new StringBuilder();
            
            for (int i = 0; i < mac.length; i++) {
                    sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));		
            } 
            
            //code to identify the user
            Vector usrname=null;
            Iterator usr=(con.getData(QueryGenerator.GET_USER+session.getAttribute("uid"))).iterator();
            if(usr.hasNext())
                usrname=(Vector)usr.next();
            message="Attempt to share the private message send to yor friend "+usrname.get(0)+" was blocked successfully..<br/><br/> "
                            + "Details:"
                            + "<h5 style=\"color=red\"> System IP:&nbsp&nbsp&nbsp&nbsp<i>"+ip.toString()+"</i></h5>"
                            + "<h5 style=\"color=red\"> MAC Address:&nbsp&nbsp&nbsp&nbsp<i>"+sb.toString()+"</i></h5>"
                            + "<h5 style=\"color=red\"> Date and time:&nbsp&nbsp&nbsp&nbsp<i>"+dt.toGMTString()+"</i></h5>";
//            out.println(message);
            String shareNotification="insert into notifications(date,userid,message,type) "
                                    + "values((SELECT NOW()),"+informTo+",'"+message+"','SEQ')";
System.out.println(shareNotification);                       
            con.putData(shareNotification);
            
            %>
            <script>
                alert("This image cannot be shared..");
                window.location="../user/home.jsp";
            </script>
            <%
//        }
    }
%>
