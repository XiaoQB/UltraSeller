package cn.edu.fudan.gateway.filter;

import cn.edu.fudan.common.entities.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.cloud.gateway.route.Route;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;

import reactor.core.publisher.Mono;



/**
 * @author beethoven
 * @date 2021-11-09 19:54:12
 */
@Component
@Slf4j
@Configuration
public class GatewayFilter implements GlobalFilter, Ordered {

    private static final String TOKEN = "token";
    private static final String ROLE = "role";

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        Route route = exchange.getAttribute(ServerWebExchangeUtils.GATEWAY_ROUTE_ATTR);
        if ("user-service-route".equals(route.getId())) {
            return chain.filter(exchange);
        }
        HttpHeaders headers = exchange.getRequest().getHeaders();

        String token = headers.getFirst(TOKEN);
        String role = headers.getFirst(ROLE);
        if (StringUtils.isEmpty(token) || StringUtils.isEmpty(role) || !JwtUtil.authorization(token, role)) {
            exchange.getResponse().setStatusCode(HttpStatus.NOT_ACCEPTABLE);
            return exchange.getResponse().setComplete();
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }


}
