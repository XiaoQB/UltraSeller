package wallet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import wallet.domain.WalletRecord;
import wallet.domain.WalletRecordExample;

public interface WalletRecordMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    int countByExample(WalletRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    int deleteByExample(WalletRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    int insert(WalletRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    int insertSelective(WalletRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    List<WalletRecord> selectByExample(WalletRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    int updateByExampleSelective(@Param("record") WalletRecord record, @Param("example") WalletRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table us_wallet_record
     *
     * @mbggenerated Mon Nov 08 19:05:30 CST 2021
     */
    int updateByExample(@Param("record") WalletRecord record, @Param("example") WalletRecordExample example);
}
