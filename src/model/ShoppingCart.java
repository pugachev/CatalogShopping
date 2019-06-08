
package model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

    List<CartItem> itemList;
    
    public ShoppingCart(){
        itemList = new ArrayList<CartItem>();
    }
    
    public void addItem(Product pro, int count) {
        CartItem item = new CartItem();
        item.setProduct(pro);
        item.setCount(count);
        
        itemList.add(item);
    }
    
    public List<CartItem> getItems(){
        return itemList;
    }
    
    public int getItemSize(){
        return itemList.size();
    }

    public int getSumPrice(){
        //1)getSumPrice()メソッドの集計方法
        int sum = 0;
        for(int i=0;i<itemList.size();i++){
            CartItem item = itemList.get(i);
            sum += item.getSumPrice();
        }
        return sum;
    }
    
    public CartItem getItem(int id){
        //カートに含まれている購入商品のIDが引数のIDと一致するCartItemクラスを検索する
        for(int i=0;i<itemList.size();i++){
            CartItem item = itemList.get(i);
            if(item.getId() == id){
                return item;            
            }
        }
        return null;        
    }

    public void removeItem(CartItem item) {
        itemList.remove(item);
    }


    public void clear() {
        itemList.clear();
    }

}
