
package action.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ShoppingCart;
import model.Member;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.ShoppingDAO;

public class CommitCartAction extends Action {
    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception{
        
        //1)不正なリクエストがおこっているか判定する
        if(!isTokenValid(request,true)){
           return mapping.findForward("twice"); 
        }
        
        //ユーザIDの取り出し
        Member mem = (Member)request.getSession().getAttribute("login");
        
        //ショッピングカートの取り出し
        ShoppingCart cart = (ShoppingCart)request.getSession().getAttribute("cart");
        
        //買い物情報の登録
        ShoppingDAO dao = new ShoppingDAO();
        dao.purchaseCart(mem.getMail(),cart);
        
        cart.clear();
        return mapping.findForward("success");
    }
}
