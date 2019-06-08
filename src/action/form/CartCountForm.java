
package action.form;

import org.apache.struts.action.ActionForm;

public class CartCountForm extends ActionForm {
    
    int[] counts;
    
    public void setCounts(int[] cs){
        counts = cs;
    }
    
    public int[] getCounts(){
        return counts;
    }
}
