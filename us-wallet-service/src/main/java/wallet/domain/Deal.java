package wallet.domain;

public class Deal {
    private String sellerName;

    private String buyerName;

    private long dealId;

    private double price;

    private String id;

    private String dealStatus;

    public double getPrice() {
        return price;
    }

    public String getSellerName() {
        return sellerName;
    }

    public String getBuyerName(){
        return buyerName;
    }

    public String getId() {
        return id;
    }

    public String getDealStatus() {
        return dealStatus;
    }
}
