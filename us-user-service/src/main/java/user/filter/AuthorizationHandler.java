package user.filter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Authorization;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import user.result.R;
import user.result.ResultCode;
import user.service.impl.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;


@Configuration
@Slf4j
@Component
public class AuthorizationHandler implements HandlerInterceptor {

    @Autowired
    private UserServiceImpl userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getRequestURL() + "===========preHandle===========");
        String role = request.getParameter("role");
        String token = request.getHeader("Authorization");
        if (role == null) {
            role = JSONObject.parseObject(((MyRequestWrapper) request).getBodyStr()).getString("role");
        }
        if (StringUtils.isNotEmpty(token) && StringUtils.isNotEmpty(role)) {
            boolean auth = userService.authorization(token, role);
            if (auth) {
                return true;
            }
        }
        PrintWriter writer = null;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");
        try {
            writer = response.getWriter();
            HashMap<String, String> map = new HashMap<>();
            map.put("code", "400");
            map.put("message", "无权限");
            writer.print(map);
        } catch (Exception e) {
            log.info("拦截器报错");
            e.printStackTrace();
        } finally {
            if (writer != null) {
                writer.close();
            }
        }
        return false;
    }
//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
//        System.out.println(request.getContextPath()+"============postHandle==========");
//    }
//    /**
//     * @Description 在DispatcherServlet完全处理完请求后被调用，也就是说视图渲染已经完毕或者调用者已经拿到结果
//     * @Date 2019/5/14 16:05
//     * @Version  1.0
//     */
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
//        System.out.println(request.getContextPath()+"============afterCompletion==========");
//    }
//
//    private void returnJson(HttpServletResponse response){
//        PrintWriter writer = null;
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json; charset=utf-8");
//        try {
//            writer = response.getWriter();
//            Map<String, Object> result = PackageReturnResult.returnJson(400, "用户令牌token无效");
//            result.put("data", null);
//            writer.print(result);
//        } catch (IOException e){
//            LoggerUtil.logError(ECInterceptor.class, "拦截器输出流异常"+e);
//        } finally {
//            if(writer != null){
//                writer.close();
//            }
//        }
//    }
}
