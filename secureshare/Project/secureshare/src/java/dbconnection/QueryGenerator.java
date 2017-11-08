/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;
/**
 *
 * @author Administrator
 */

public class QueryGenerator {
    
    public static String SEQ_PROPERTIES="select share,download,save from account_property where userID=";
    public static String VIEW_FRIENDS="SELECT ud.userId,ud.name FROM user_details ud, friends_list fl WHERE  fl.req_status=1 AND ud.userID=fl.req_id AND fl.uid=";
    public static String MAX_SHARE_ID="select max(shareID) from user_shares";
    public static String SELECT_SHARES="select shareID,type from share_id_record where userId=";
    public static String GET_SHARE="select sharedate,path,download,share,save,shareby from user_shares where shareID=";
    public static String GET_USER="select name from user_details where userid=";
    public static String LOAD_NOTIFICATIONS="select date,message from notifications where type='NA' and userid=";
    public static String LOAD_SEQ_NOTIFICATIONS="select date,message,slno from notifications where type='SEQ' and userid=";
    public static String GET_NOTIFICATION_COUNT="SELECT COUNT(slno) FROM notifications where type='NA'";
    public static String VIEW_PROFILE="select * from user_details where userID=";
    public static String LIST_FRIEND_REQUEST="select * from friends_list where req_status=0 and req_id=";
    public static String LIST_REQUEST_DETAILS="SELECT * FROM user_details WHERE userID=";
    public static String REJECT_REQUEST="delete from friends_list where uid=";
    public static String ACCEPT_REQUEST="update friends_list set req_status=1 where uid=";
    public static String VIEW_ALL_MEMBERS="select userId,name from user_details";
    public static String VIEW_ALL_MEMBERS_RQST="select userId,name from user_details where ";
    public static String GET_ACCOUNT_SETTINGS="select * from account_property where ";
    public static String SET_ONLINE="update user_details set online=1 where ";
    public static String SET_OFFLINE="update user_details set online=0 where ";
    //public static String ONLINE_FRIENDS="SELECT ud.userID,ud.name FROM user_details ud,friends_list fl WHERE fl.req_status=1 AND fl.req_id=ud.userID AND fl.uid=";
    public static String REMOVE_NOTIFICATION="delete from notifications where slno=";
    public static String ONLINE_FRIENDS="SELECT ud.userID,ud.name FROM user_details ud,friends_list fl WHERE (fl.req_status=1 AND fl.req_id=ud.userID AND fl.uid=USER_ID) OR (fl.req_status=1 AND fl.uid=ud.userID AND fl.req_id=USER_ID)";
    public static String GET_SEQ_PASS="select secretkey from account_property where userid=";
}
