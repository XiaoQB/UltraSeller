package wallet;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author tristonk
 */
@SpringBootApplication
@MapperScan(basePackages = {"wallet.mapper"})
@EnableDiscoveryClient
@EnableFeignClients
public class WalletApplication {
    public static void main(String[] args) {
        SpringApplication.run(WalletApplication.class, args);
    }
}
