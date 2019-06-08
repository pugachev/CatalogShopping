
package action.member;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.MemberEntryLogic;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import action.form.MemberEntryForm;

public class MemberEntryAction extends Action {

    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        
        MemberEntryForm dForm = (MemberEntryForm)form;
        
        //(1)パスワードのダイジェスト化（認証データベースに格納するため）
        String encryptionPassword = encryptionPassword(dForm.getPassword());
        
        //(2)ビジネスロジック（登録ロジック）
        MemberEntryLogic logic = new MemberEntryLogic();
        logic.entryMember(dForm.getName(),encryptionPassword,dForm.getAddress(),dForm.getTel(),dForm.getMail(),dForm.getDate());
        
        return mapping.findForward("success");
    }

    private String encryptionPassword(String password) throws NoSuchAlgorithmException {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] enc = md.digest(password.getBytes());
        return byteArraytoHexString(enc);
    }
    
    private static String byteArraytoHexString(byte[] md5) {
            StringBuffer md5String = new StringBuffer();
        
            for (int i = 0; i < md5.length; i++) {    
                //byteを一つ取り、絶対値に変換する
                int n = md5[i] & 0xff;
            
                //3)16以下の数の場合は頭に0をつける必要がある
                if (n < 16){
                    md5String.append("0");
                }
            
                //一つのbyteを16進数に変換
                md5String.append(Integer.toHexString(n).toUpperCase());
            }
        
            return md5String.toString();
        }
}
