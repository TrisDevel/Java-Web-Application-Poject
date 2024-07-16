package ClothesOnlineShop.Model;

public class PaymentDTO {
    private int paymentId;
    private String paymentMethod;

    public PaymentDTO() {
    }

    public PaymentDTO(int paymentId, String paymentMethod) {
        this.paymentId = paymentId;
        this.paymentMethod = paymentMethod;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}

