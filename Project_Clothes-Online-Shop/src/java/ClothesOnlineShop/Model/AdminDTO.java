/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClothesOnlineShop.Model;

/**
 *
 * @author buitr
 */
public class AdminDTO {
    int idAdmin;
    String adName;
    String adAccount;
    String adPass;

    public AdminDTO() {
    }

    public AdminDTO(int idAdmin, String adName, String adAccount, String adPass) {
        this.idAdmin = idAdmin;
        this.adName = adName;
        this.adAccount = adAccount;
        this.adPass = adPass;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName;
    }

    public String getAdAccount() {
        return adAccount;
    }

    public void setAdAccount(String adAccount) {
        this.adAccount = adAccount;
    }

    public String getAdPass() {
        return adPass;
    }

    public void setAdPass(String adPass) {
        this.adPass = adPass;
    }
    
    
}
