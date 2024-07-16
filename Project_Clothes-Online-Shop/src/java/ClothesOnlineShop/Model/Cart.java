/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Model;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author haclo
 */
public class Cart {
    private List<Item> item;

    public Cart(List<Item> item) {
        this.item = item;
    }

    public Cart() {
       item = new ArrayList<>();
    }

    public Item getItemById(int id) {
        for(Item i : item)
            if(i.getProduct().getIdProduct() == id)
                return i;
        return null;        
    }
    public int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    //thêm vào cart
    public void addItem(Item t){
        //đã tồn tại
        if(getItemById(t.getProduct().getIdProduct()) != null){
            Item i = getItemById(t.getProduct().getIdProduct());
            i.setQuantity(i.getQuantity() + t.getQuantity()); 
        }else{ //chưa tồn tại
            item.add(t);
        }
    }
    public void removeItem(int id){
        if(getItemById(id) != null){
            item.remove(getItemById(id));
        }
    }
    public double getTotalMoney(){
        double t =0;
        for(Item i : item)
            t += i.getQuantity()*i.getPrice();
        return t;
    }

    public List<Item> getItem() {
        return item;
    }

    public void setItem(List<Item> item) {
        this.item = item;
    }
    
    
}
