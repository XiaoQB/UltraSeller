package user.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import user.filter.AuthorizationHandler;
import user.interceptor.CorsInterceptor;

import javax.annotation.Resource;

@Configuration
public class AuthorizationConfig implements WebMvcConfigurer {

<<<<<<< HEAD:us-user-service/src/main/java/user/config/AuthorizationConfig.java
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        //注册TestInterceptor拦截器
//        InterceptorRegistration registration = registry.addInterceptor(apiInterceptor());
//        registration.addPathPatterns("/**");                      //所有路径都被拦截
//        registration.excludePathPatterns(                         //添加不拦截路径
//                "/user/login",            //登录
//                "/user/register",            //登录
//                "/**/*.js",              //js静态资源
//                "/**/*.css",             //css静态资源
//                "/**/*.woff",
//                "/**/*.ttf",
//                "/**/*.ttf",
//                "/error"
//        );
//    }
=======
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
>>>>>>> master:us-user-service/src/main/java/user/interceptor/AuthorizationConfig.java

    @Bean
    public AuthorizationHandler apiInterceptor() {
        return new AuthorizationHandler();
    }

<<<<<<< HEAD:us-user-service/src/main/java/user/config/AuthorizationConfig.java
//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//        System.out.println(registry.toString());
//        registry.addMapping("/**")
//                .allowedOrigins("*")
//                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
//                .maxAge(3600)
//                .allowCredentials(true)
//                .allowedHeaders("*");
//    }
=======
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("POST", "GET", "PUT", "OPTIONS", "DELETE")
                .maxAge(3600)
                .allowCredentials(true);
  }
>>>>>>> master:us-user-service/src/main/java/user/interceptor/AuthorizationConfig.java
}