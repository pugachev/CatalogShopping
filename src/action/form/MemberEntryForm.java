
package action.form;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

import org.apache.struts.action.ActionForm;

public class MemberEntryForm extends ActionForm {
    private String name;
    private String password;
    private String address;
    private String mail;
    private String tel;
    private Date date;

    public String getAddress() {
        return address;
    }
    public void setAddress(String addtess) {
        this.address = addtess;
    }
    
    //初期状態では空文字列を表示するために設定している
    public String getBirth(){
        return "";
    }
    
    public void setBirth(String birth) {
        //1) 文字列をDateクラスに変換する。
            SimpleDateFormat sdf = new SimpleDateFormat();
            sdf.applyPattern( "yyyy-MM-dd" );
            try {
                date = sdf.parse(birth);
            } catch (ParseException e) {
                //フォーマットが誤っている場合は今日を設定
                Calendar cal = Calendar.getInstance();
                date = cal.getTime();
            }
    }

    public Date getDate(){
	return date;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }
}
