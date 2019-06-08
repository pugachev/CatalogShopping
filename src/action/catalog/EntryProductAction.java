
package action.catalog;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.upload.FormFile;

import action.form.MasterMainForm;

import dao.CatalogDAO;


public class EntryProductAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
            
        DynaActionForm dForm = (DynaActionForm)form;
        
        String picUrl = (String)dForm.get("pictureUrl");
        
        //1)商品写真が指定されていない場合はアップロード写真を利用する
        if(picUrl == null || "".equals(picUrl)){
            FormFile fForm = (FormFile) dForm.get("upload");
            picUrl = writeUploadFile(fForm);
        }
        
          //登録するためにProductクラスのインスタンスを生成
        Product pro = new Product();
        pro.setName((String)dForm.get("name"));
        pro.setPrice(((Integer)dForm.get("price")).intValue());
        pro.setDetail((String)dForm.get("detail"));
        pro.setPictureUrl(picUrl);
        
        CatalogDAO dao = new CatalogDAO();
        dao.entry(pro);
        
          //登録した商品を含むリストに置き換え
        List<Product> list = dao.getProductList();
        request.getSession().setAttribute("product",list);
      
          //
        request.getSession().setAttribute("oldlist",list);

        //2)マスタ情報をフォームに表示するための初期化
        MasterMainForm mForm = new MasterMainForm();
        mForm.setData(list);
        request.setAttribute("CatalogMainForm",mForm);
        
        return mapping.findForward("list");
    }

    private String writeUploadFile(FormFile fForm) throws FileNotFoundException, IOException {
        
          //ファイル名を決めるために今の時間を取得する
        Date date = new Date();
        long fTime = date.getTime();
        
        StringBuffer fileName = new StringBuffer("/img/");
        fileName.append(fTime);
        fileName.append(".gif");
        
        String filePath = fileName.toString();
          
          //物理パスの取得
        String realPath = getServlet().getServletContext().getRealPath(filePath);
        OutputStream out = new FileOutputStream(realPath);
        out.write(fForm.getFileData(), 0, fForm.getFileSize());
        out.close();
        
        return filePath;
    }
}
