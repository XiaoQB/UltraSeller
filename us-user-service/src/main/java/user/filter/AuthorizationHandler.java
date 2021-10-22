package user.filter;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class AuthorizationHandler implements HandlerInterceptor {
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println(request.getRequestURL()+"===========preHandle===========");
//        String token = request.getParameter("token");
//        if(StringUtils.isNotEmpty(token)){
//            if(){
//                return true;
//            } else{
//                //返回校验token结果
//                returnJson(response);
//                // return false; //我做的时候返回数据后忘记return false了，所以导致异常
//            }
//        }
//
//        return true;
//    }
//
//
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
