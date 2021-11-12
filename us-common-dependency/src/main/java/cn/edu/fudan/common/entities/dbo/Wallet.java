package cn.edu.fudan.common.entities.dbo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Wallet {

    private Long walletId;

    private String userName;

    private Double balance;

    private String role;

}
