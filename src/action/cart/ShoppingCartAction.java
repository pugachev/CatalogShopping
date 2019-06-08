
package action.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartItem;
import model.Product;
import model.ShoppingCart;
import logic.AuthLogic;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.ProductDAOUtil;

public class ShoppingCartAction extends Action{
    
    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception{
        

	//1）認証情報が格納されていない場合は認証処理を行う
        if(request.getSession().getAttribute("login") == null){
            AuthLogic aLogic = new AuthLogic();
            aLogic.login(request);
        }
        
        //セッションから取り出せない場合はデータベースから取得
        ProductDAOUtil util = new ProductDAOUtil();
        Product pro = util.getProductById(form, request.getSession());
        if(pro == null){
            pro = util.getProductById(form);
        }

        //ショッピングカートを取得        
        ShoppingCart cart = (ShoppingCart)request.getSession().getAttribute("cart");
        
        if(cart == null){
            cart = new ShoppingCart();
            request.getSession().setAttribute("cart",cart);
        }
        
        //指定された商品がすでにあるかどうかを判定        
        CartItem item = cart.getItem(pro.getId());
        if(item == null){
            cart.addItem(pro,1); 
        }else{
            //指定された商品があった場合は購入数量を一つ増やす        
            int count = item.getCount();
            count++;
            item.setCount(count);
        }
        
       //複数回購入防止するためにsaveToken()をする   
         saveToken(request);
        
       return mapping.findForward("cart");
    }
}
