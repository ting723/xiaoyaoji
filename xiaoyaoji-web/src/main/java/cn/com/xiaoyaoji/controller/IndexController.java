package cn.com.xiaoyaoji.controller;

import cn.com.xiaoyaoji.core.annotations.Ignore;
import cn.com.xiaoyaoji.core.common.Constants;
import cn.com.xiaoyaoji.core.plugin.PluginManager;
import cn.com.xiaoyaoji.util.CacheUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author zhoujingjie
 * @date 2016-07-21
 */
@Controller
@RequestMapping("/")
@Ignore
public class IndexController {
    @GetMapping(value = {"/login"})
    public Object login() {
        ModelAndView modelAndView = new ModelAndView("content/cn.com.xiaoyaoji.plugin.login");
        modelAndView.getModel().put("loginPlugins", PluginManager.getInstance().getLoginPlugins());
        return modelAndView;
    }

    @GetMapping(value = {"/register"})
    public Object register() {
        return new ModelAndView("content/register");
    }


    @GetMapping({"/logout"})
    public Object logout(HttpSession session, @CookieValue(name = Constants.TOKEN_COOKIE_NAME, required = false) String token) {
        session.invalidate();
        if (StringUtils.isNoneBlank(token)) {
            CacheUtils.remove(token);
        }
        return new ModelAndView("redirect:/");
    }

    @GetMapping(value = {"/about"})
    public Object about() {
        return new ModelAndView("content/about");
    }


    @GetMapping(value = {"/", "/index"})
    public Object index() {
        return new ModelAndView("content/index");
    }

    @GetMapping(value = {"/help" })
    public Object help() {
        return new ModelAndView("content/help");
    }

    @GetMapping(value = "/forget")
    public Object forget() {
        return new ModelAndView("content/forget");
    }

    @GetMapping(value = "/findpassword")
    public Object findpassword() {
        return new ModelAndView("content/findpassword");
    }

    @GetMapping(value = "/unsupport")
    public Object unsupport() {
        return new ModelAndView("content/unsupport");
    }


    @GetMapping(value = "/donate")
    public Object donate() {
        return new ModelAndView("content/donate");
    }


}
