package wallet.utils;

import com.alibaba.fastjson.JSONObject;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.Date;

/**
 * The type Jwt util.
 */
public class JwtUtil {
    /**
     * The constant JWT_TTL.
     * 有效期为60 * 60 *1000  一个小时
     */
    public static final Long JWT_TTL = 3600000L;

    /**
     * The constant JWT_KEY.
     * Jwt令牌信息
     */
    public static final String JWT_KEY = "itcast";

    /**
     * Create jwt string.
     *
     * @param id        the id
     * @param subject   the subject
     * @param ttlMillis the ttl millis
     * @return the string
     */
    public static String createJWT(String id, String subject, Long ttlMillis) {
        //指定算法
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        //当前系统时间
        long nowMillis = System.currentTimeMillis();
        //令牌签发时间
        Date now = new Date(nowMillis);

        //如果令牌有效期为null，则默认设置有效期1小时
        if (ttlMillis == null) {
            ttlMillis = JwtUtil.JWT_TTL;
        }

        //令牌过期时间设置
        long expMillis = nowMillis + ttlMillis;
        Date expDate = new Date(expMillis);

        //生成秘钥
        SecretKey secretKey = generalKey();

        //封装Jwt令牌信息
        JwtBuilder builder = Jwts.builder()
                .setId(id)                    //唯一的ID
                .setSubject(subject)          // 主题  可以是JSON数据
                .setIssuer("admin")          // 签发者
                .setIssuedAt(now)             // 签发时间
                .signWith(signatureAlgorithm, secretKey) // 签名算法以及密匙
                .setExpiration(expDate);      // 设置过期时间
        return builder.compact();
    }

    /**
     * 生成加密 secretKey
     * <p>
     * <<<<<<< HEAD:us-gateway-service/src/main/java/gateway/utils/JwtUtil.java
     *
     * @return =======
     * @return secret key
     * >>>>>>> master:us-common/src/main/java/common/JwtUtil.java
     */
    public static SecretKey generalKey() {
        byte[] encodedKey = Base64.getEncoder().encode(JwtUtil.JWT_KEY.getBytes());
        SecretKey key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
        return key;
    }


    /**
     * 解析令牌数据
     *
     * @param jwt the jwt
     * @return claims
     * @throws Exception the exception
     */
    public static Claims parseJWT(String jwt) throws Exception {
        SecretKey secretKey = generalKey();
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(jwt)
                .getBody();
    }

    /**
     * Get role string.
     *
     * @param token the token
     * @return the string
     */
    public static String getRole(String token) {
        try {
            Claims claims = JwtUtil.parseJWT(token);
            System.out.println(JSONObject.parseObject(claims.getSubject()).getString("role"));
            return JSONObject.parseObject(claims.getSubject()).getString("role");
        } catch (Exception e) {
            // token格式不对
            return null;
        }
    }

    /**
     * Get user name string.
     *
     * @param token the token
     * @return the string
     */
    public static String getUserName(String token) {
        try {
            Claims claims = JwtUtil.parseJWT(token);
            return JSONObject.parseObject(claims.getSubject()).getString("username");
        } catch (Exception e) {
            // token格式不对
            return null;
        }
    }

}
