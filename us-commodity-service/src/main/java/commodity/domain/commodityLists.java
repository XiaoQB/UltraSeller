package commodity.domain;

import org.apache.commons.lang.builder.EqualsBuilder;

import javax.persistence.Embeddable;
import java.util.List;

@Embeddable
public class commodityLists {

    private List<commodity> commodities;

    private commodityLists() {
    }

    public List<commodity> getCommodities(){
        return commodities;
    }

    public void setCommodities(List<commodity> newCommodities){
        this.commodities = newCommodities;
    }

    public commodityLists(List<commodity> newCommodities){
        this.commodities = newCommodities;
    }

}
