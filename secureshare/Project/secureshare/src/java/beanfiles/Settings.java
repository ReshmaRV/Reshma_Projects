/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beanfiles;

import dbconnection.QueryGenerator;
import java.util.Vector;

/**
 *
 * @author Administrator
 */
public class Settings {
    String share,download,save,uid,curpwd,newpwd,conpwd,ids,path,secQ,ans;
    dbconnection.DbConnection con=new dbconnection.DbConnection();

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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        System.out.println(">>>>>"+path);
        this.path = path;
    }

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getCurpwd() {
        return curpwd;
    }

    public void setCurpwd(String curpwd) {
        this.curpwd = curpwd;
    }

    public String getNewpwd() {
        return newpwd;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

    public String getConpwd() {
        return conpwd;
    }

    public void setConpwd(String conpwd) {
        this.conpwd = conpwd;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getShare() {
        return share;
    }

    public void setShare(String share) {
        this.share = share;
    }

    public String getDownload() {
        return download;
    }

    public void setDownload(String download) {
        this.download = download;
    }

    public String getSave() {
        return save;
    }

    public void setSave(String save) {
        this.save = save;
    }
    
    public int putData(int opt){
        return con.putData(generateQuery(opt));
    }
    
    public Vector getData(int opt){
        return con.getData(generateQuery(opt));
    }
    
    private String generateQuery(int opt){
        String qry="";
       if(opt==1)
           return "update account_property set share="+getShare()+",download="+getDownload()+",save="+getSave()+" "
                   + "where userID="+getUid()+"";
       if(opt==2)
            return "select secretkey from account_property where userID="+getUid()+"";
       if(opt==3)
            return "update account_property set secretkey="+getNewpwd()+" where userID="+getUid()+"";
       if(opt==4)
           return QueryGenerator.SEQ_PROPERTIES+getUid();
       if(opt==5)
            return "insert into user_shares(shareDate,sharedTo,path,download,share,save,shareby) "
                   + "values((SELECT NOW()),'"+getIds()+"','"+getPath()+"',"+getDownload()+","+getShare()+","+getSave()+","+getUid()+")";                   
       if(opt==6)
           return "insert into share_id_record values(";
       if(opt==7)
           return "select secQstn,secAns from user_details where userID="+getUid()+"";
       return "";
    }
    
}
