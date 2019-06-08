
package action.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.AuthLogic;
import model.ShoppingCart;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class CartShowAction extends Action {
    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception{
        
        //認証情報が格納されていない場合は認証処理をおこなう
        if(request.getSession().getAttribute("login") == null){
            AuthLogic aLogic = new AuthLogic();
            aLogic.login(request);
        }
        
        //ショッピングカートの初期化
        ShoppingCart cart = (ShoppingCart)request.getSession().getAttribute("cart");
        if(cart == null){
            cart = new ShoppingCart();
            request.getSession().setAttribute("cart",cart);
        }
        
        //複数回購入防止するためにsaveToken()をする   
        saveToken(request);
        return mapping.findForward("cart");
    }
}
