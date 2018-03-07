package cn.com.xiaoyaoji.listener;

import cn.com.xiaoyaoji.Application;
import cn.com.xiaoyaoji.task.ScheduleManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * @author zhoujingjie
 * @date 2016-07-26
 */
@WebListener
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {

        Application.started(sce.getServletContext());
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ScheduleManager.shutdown();
    }
}
