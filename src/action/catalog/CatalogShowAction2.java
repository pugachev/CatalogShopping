package action.catalog;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.CatalogDAO;
import model.Product;

public class CatalogShowAction2 extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {


    	System.out.println("CatalogShowAction2 " + request.getParameter("parameter1"));

    	String selectChoice = request.getParameter("parameter1");
        //struts-config.xmlに設定したデータソースの取得
        CatalogDAO dao = new CatalogDAO();

        if(selectChoice!=null && !selectChoice.contentEquals(""))
        {
            //1) データベースの検索をDAOに委譲している
            List<Product> list = dao.getProductListByName(selectChoice);

            //2) セッションにProductオブジェクトのリストを格納している
            request.getSession().setAttribute("products2", list);

            //3)表示領域の設定
            request.setAttribute("offset","0");
        }
        else
        {
            try {
                //1) データベースの検索をDAOに委譲している
                List<Product> list = dao.getProductList();

                //2) セッションにProductオブジェクトのリストを格納している
                request.getSession().setAttribute("products2", list);

                //3)表示領域の設定
                request.setAttribute("offset","0");

                //4)例外処理の仕方
            } catch (SQLException e) {
                e.printStackTrace();
                throw e;
            }
        }

        return mapping.findForward("show2");
    }

}