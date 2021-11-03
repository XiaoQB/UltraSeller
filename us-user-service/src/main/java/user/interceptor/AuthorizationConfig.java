package user.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import user.filter.AuthorizationHandler;

@Configuration
public class AuthorizationConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

         CorsInterceptor corsInterceptor = new CorsInterceptor();
        //注册TestInterceptor拦截器
        registry.addInterceptor(corsInterceptor);
        InterceptorRegistration registration = registry.addInterceptor(apiInterceptor());
        registration.addPathPatterns("/**");                      //所有路径都被拦截
        registration.excludePathPatterns(                         //添加不拦截路径
                "/user/login",            //登录
                "/user/register",            //登录
                "/**/*.js",              //js静态资源
                "/**/*.css",             //css静态资源
                "/**/*.woff",
                "/**/*.ttf",
                "/**/*.ttf",
                "/error"
        );
    }

    @Bean
    public AuthorizationHandler apiInterceptor() {
        return new AuthorizationHandler();
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
                .maxAge(3600)
                .allowCredentials(true);
  }
}
