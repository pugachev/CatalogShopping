
package action.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartItem;
import model.ShoppingCart;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import action.form.CartCountForm;

public class ChangeCountAction extends Action {
    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception{
    
        CartCountForm dForm = (CartCountForm)form;
        int[] counts = dForm.getCounts();       
        
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        List<CartItem> items = cart.getItems();
        
        //数量をCartItemのインデックスで管理、削除に工夫が必要
        List<CartItem> eraseList = new ArrayList<CartItem>();
        for(int i=0;i<items.size();i++){
            CartItem item = items.get(i);
            item.setCount(counts[i]);
            if(counts[i] <= 0){
                eraseList.add(item);
            }
        }
        
        //削除対象リストに入っているCartItemを削除
        for(int i=0;i<eraseList.size();i++){
            CartItem item = eraseList.get(i);            
                cart.removeItem(item);
        }
        
        //1)複数回購入防止するためにsaveToken()をする  
        saveToken(request);
        
        return mapping.findForward("cart");
    }
}
