package commodity.domain;


import org.springframework.data.annotation.Id;

import javax.persistence.Embedded;
import javax.persistence.GeneratedValue;

public class vendor {
    @Id
    @GeneratedValue
    private long id;
    private String name;

    @Embedded
    private commodityLists lists;

    private vendor(){
    }

    public vendor(String name, commodityLists lists){
        this.name = name;
        this.lists = lists;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
