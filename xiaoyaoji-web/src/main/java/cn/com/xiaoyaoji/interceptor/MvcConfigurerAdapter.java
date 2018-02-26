package cn.com.xiaoyaoji.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Author : zhanglianwei
 * Create : 2018/2/26 15:35
 * Update : 2018/2/26 15:35
 * Descriptions :
 * @author zhanglw
 */
@Component
public class MvcConfigurerAdapter extends WebMvcConfigurerAdapter {

    @Autowired
    private AuthorityInterceptor authorityInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authorityInterceptor);
    }
}
