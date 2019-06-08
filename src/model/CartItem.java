
package model;

public class CartItem {
    
    private Product pro;
    private int count;

	public void setProduct(Product product) {
        pro = product;
	}
    
	public void setCount(int iCount) {
        count = iCount;
	}
    
    public Product getProduct(){
        return pro;
    }
    
    public int getCount(){
        return count;
    }
    
	public int getSumPrice(){
        int price = pro.getPrice();
        return price*count;
    }

	public int getId() {
		return pro.getId();
	}
}
