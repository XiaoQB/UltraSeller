package commodity.domain;

import org.springframework.data.annotation.Id;

public class commodity {
    @Id
    private long id;
    public String name;
    private String imgLink;
    private long price;
    private String description;
    private long inventory;

    private commodity(){

    }

    public commodity(long id, String name, String imgLink, long price, String description, long inventory){
        this.id = id;
        this.name = name;
        this.imgLink = imgLink;
        this.price = price;
        this.description = description;
        this.inventory = inventory;
    }

    public String getName() {
        return name;
    }

    public long getId() {
        return id;
    }

    public long getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public long getInventory() {
        return inventory;
    }

    public String getImgLink(){
        return imgLink;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public void setInventory(long inventory) {
        this.inventory = inventory;
    }
}
