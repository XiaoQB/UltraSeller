package commodity;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
//@MapperScan(basePackages = {"commodity.mapper"})
public class CommodityServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(CommodityServiceApplication.class, args);
    }
}
