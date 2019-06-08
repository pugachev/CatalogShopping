
package action.form;

import java.util.ArrayList;
import java.util.List;

import model.Product;

import org.apache.struts.action.ActionForm;


public class MasterMainForm extends ActionForm {
    private List<Product> data = new ArrayList<Product>();

    public void setData(List<Product> values) {
        data = values;
    }
    
    public List<Product> getAllData(){
        return data;
    }

    public Product getProduct(int idx) {
        //1)情報を格納する場合もこのメソッドが利用される
       while (this.data.size() <= idx) 
       { 
        this.data.add(new Product()); 
       } 
       return data.get(idx);
    }
    
}
