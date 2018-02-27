package cn.com.xiaoyaoji.controller;

import cn.com.xiaoyaoji.core.common.Pagination;
import cn.com.xiaoyaoji.core.common._HashMap;
import cn.com.xiaoyaoji.core.plugin.Event;
import cn.com.xiaoyaoji.core.plugin.PluginInfo;
import cn.com.xiaoyaoji.core.plugin.PluginManager;
import cn.com.xiaoyaoji.data.bean.Project;
import cn.com.xiaoyaoji.data.bean.User;
import cn.com.xiaoyaoji.service.ServiceFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author zhoujingjie
 * created on 2017/5/21
 */
@RestController
@RequestMapping("/dashboard")
public class DashboardController {

    @GetMapping()
    public Object dashboard(User user) {
        List<PluginInfo> importPlugins = PluginManager.getInstance().getPlugins(Event.DOC_IMPORT);
        ModelAndView modelAndView = new ModelAndView("content/dashboard/index")
                //        .addObject("projects",projects)
                .addObject("pageName", "default")
                .addObject("importPlugins", importPlugins);
        return modelAndView;
    }

    @GetMapping(value = "/recycle")
    public Object dashboardRecycle(User user) {
        Pagination p = Pagination.build(new _HashMap<String, String>().add("status", "DELETED").add("userId", user.getId()));
        List<Project> projects = ServiceFactory.instance().getProjects(p);
        return new ModelAndView("content/dashboard/recycle")
                .addObject("projects", projects)
                .addObject("pageName", "recycle")
                ;
    }

    @GetMapping(value = "/archive")
    public Object dashboardArchive(User user) {
        Pagination p = Pagination.build(new _HashMap<String, String>().add("status", Project.Status.ARCHIVE)
                .add("userId", user.getId()));
        List<Project> projects = ServiceFactory.instance().getProjects(p);
        return new ModelAndView("content/dashboard/archive")
                .addObject("projects", projects)
                .addObject("pageName", "archive")
                ;
    }


    @GetMapping(value = "/welcome")
    public Object dashboardWelcome() {
        return new ModelAndView("content/dashboard/welcome");
    }

    @GetMapping(value = "/add")
    public Object dashboardAdd() {
        return new ModelAndView("content/dashboard/add");
    }
}
