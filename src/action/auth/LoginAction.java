package action.auth;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.AuthLogic;
import model.ShoppingCart;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.CatalogDAO;
import model.Product;

public class LoginAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        //1)認証情報が格納されていない場合は認証処理をおこなう
        if(request.getSession().getAttribute("login") == null){
            AuthLogic aLogic = new AuthLogic();
            aLogic.login(request);
        }

        CatalogDAO dao = new CatalogDAO();
        List<Product> list = dao.getProductList();

        //2)セッションに商品一覧を入れている
        request.getSession().setAttribute("products", list);

        //ショッピングカートの確認
        ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCart();
            request.getSession().setAttribute("cart", cart);
        }

        //3)表示領域の設定
        request.setAttribute("offset", "0");

        return mapping.findForward("catalog");
    }

}