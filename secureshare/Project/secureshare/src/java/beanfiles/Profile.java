/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beanfiles;

import dbconnection.DbConnection;
import java.util.Vector;

/**
 *
 * @author Administrator
 */
public class Profile {
    
    String name,dob,email,contact,address,place,username,upassword,secQ,ans,uid;
    dbconnection.DbConnection con=new DbConnection();

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUid() {
        return uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String password) {
        this.upassword = password;
    }

    public String getSecQ() {
        return secQ;
    }

    public void setSecQ(String secQ) {
        this.secQ = secQ;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }
    
    public int putData(int opt){
        return con.putData(generateQuery(opt));
    }
    
    public Vector getData(int opt){
        return con.getData(generateQuery(opt));
    }
        
    private String generateQuery(int opt){
        String str="";
        if(opt==1)                
                return "UPDATE user_details set name='"+getName()+"',address='"+getAddress()+"',place='"
                        +getPlace()+"',contact='"+getContact()+"',mail='"+getEmail()+"',dob='"
                        +getDob()+"',password='"+getUpassword()+"' where userid='"+getUid()+"'";
        if(opt==2)
                return "INSERT INTO user_details (name,address,place,contact,email,dob,username,password,secQstn,secAns) "
                        + "VALUES('"+getName()+"','"+getAddress()+"','"+getPlace()+"','"
                        +getContact()+"','"+getEmail()+"','"+getDob()+"','"+getUsername()+"','"
                        +getUpassword()+"','"+getSecQ()+"','"+getAns()+"')";
        if(opt==3)
                return "select userID,name,username,password,place from user_details where username='"+getUsername()+"'";
        if(opt==4)
                return "insert into account_property values((select max(userID) from user_details),0,0,0,'"+getContact()+"')";
        if(opt==5){
                str="update user_details set name='"+getName()+"',dob='"+getDob()+"',contact='"+getContact()+"',email='"
                        +getEmail()+"',address='"+getAddress()+"',place='"+getPlace()+"' where userID="+getUid()+"";
        System.out.println(str);
                return str;}
        
        return "";
    }
}
