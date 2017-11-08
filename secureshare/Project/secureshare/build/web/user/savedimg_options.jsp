<%-- 
    Document   : savedimg_options
    Created on : 12 Jul, 2015, 4:22:10 PM
    Author     : Administrator
--%>

<%@page import="common.Constants"%>
<%@page import="java.io.File"%>
<%
    String opt=request.getParameter("opt");
    String img=request.getParameter("img");
    System.out.println(img+">>"+opt);
    if(opt.equals("1")){
        try{
            File path=new File(Constants.PROJECT_PATH+"savedImages/"+img);
            System.out.println("path:"+path);
            if(path.delete()){
                %>
                    <h2>Image removed from list</h2>
                    <input type="button" onclick="redirect()" value="Home"/>
                <%
            } %>
                <script>  
                    function redirect(){
                        window.location="home.jsp";
                    }
                </script>
                <%            
       }catch(Exception ex){
           System.out.println(ex);
       }
    }
   
%>