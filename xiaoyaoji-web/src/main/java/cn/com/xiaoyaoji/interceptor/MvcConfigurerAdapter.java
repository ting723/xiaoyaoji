package cn.com.xiaoyaoji.interceptor;

import org.springframework.context.annotation.Bean;
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

    @Bean
    public AuthorityInterceptor authorityInterceptor(){
        return new AuthorityInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authorityInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
