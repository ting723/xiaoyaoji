package cn.com.xiaoyaoji.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Author : zhanglianwei
 * Create : 2018/2/26 15:35
 * Update : 2018/2/26 15:35
 * Descriptions :
 * @author zhanglw
 */
@Configuration
public class MvcConfigurerAdapter extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthorityInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
