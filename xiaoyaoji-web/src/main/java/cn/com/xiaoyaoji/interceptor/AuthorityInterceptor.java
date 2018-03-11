package cn.com.xiaoyaoji.interceptor;

import cn.com.xiaoyaoji.core.annotations.Ignore;
import cn.com.xiaoyaoji.core.common.Constants;
import cn.com.xiaoyaoji.core.common._HashMap;
import cn.com.xiaoyaoji.core.exception.NotLoginException;
import cn.com.xiaoyaoji.core.util.ConfigUtils;
import cn.com.xiaoyaoji.data.bean.User;
import cn.com.xiaoyaoji.util.CacheUtils;
import cn.com.xiaoyaoji.utils.JspFn;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author zhoujingjie
 * @date 2016-07-22
 */
public class AuthorityInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod method = (HandlerMethod) handler;
        if (method.getMethod().getAnnotation(Ignore.class) != null) {
            return true;
        }
        if (method.getMethod().getDeclaringClass().getAnnotation(Ignore.class) != null) {
            return true;
        }
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            return true;
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (Constants.TOKEN_COOKIE_NAME.equals(cookie.getName())) {
                    user = CacheUtils.getUser(cookie.getValue());
                    if (user != null) {
                        request.getSession().setAttribute("user", user);
                        return true;
                    }
                }
            }
        }
        throw new NotLoginException();
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null && modelAndView.getViewName() != null) {
            if (modelAndView.getModel().get("fileAccess") == null) {
                if (!modelAndView.getViewName().startsWith("redirect:")) {
                    modelAndView.getModel().put("fileAccess", ConfigUtils.getFileAccessURL());
                }
            }

            modelAndView.getModel().put("ctx", request.getContextPath());
            modelAndView.getModel().put("v", ConfigUtils.getProperty("xyj.version"));
//            暂时加成随机数,避免缓存
//            modelAndView.getModel().put("v",System.currentTimeMillis());

            modelAndView.getModel().put("site", new _HashMap<String, String>().add("name", "小幺鸡")
                    .add("keywords", "小幺鸡,接口文档管理,接口平台,api,api管理,api测试,接口文档工具,接口演示,rest,restful,rest api,接口测试,postman,文档管理,websocket在线测试")
            );
            //扩展功能
            if (request.getAttribute("fn") == null) {
                modelAndView.getModel().put("fn", new JspFn(request));
            }

            User user = (User) request.getSession().getAttribute("user");
            if (user != null) {
                modelAndView.addObject("user", user);
            }
        }
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
