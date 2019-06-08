
package action.catalog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.ProductDAOUtil;

public class CatalogDetailShowAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ProductDAOUtil util = new ProductDAOUtil();

        //1)セッション情報からidで指定されたProductを取り出す
        Product pro = util.getProductById(form, request.getSession());

        if (pro == null) {
            //2)CatalogDAOを利用してProductを取り出す
            pro = util.getProductById(form);
        }
        request.setAttribute("product", pro);

        return mapping.findForward("show");
    }
}