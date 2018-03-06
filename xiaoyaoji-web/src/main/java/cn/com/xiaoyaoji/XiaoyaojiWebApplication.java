package cn.com.xiaoyaoji;

import cn.com.xiaoyaoji.converter.JsonMessageConverter;
import cn.com.xiaoyaoji.handler.MultiModelAndViewReturnValueHandler;
import cn.com.xiaoyaoji.resolver.ExceptionResolver;
import cn.com.xiaoyaoji.resolver.UserArgumentsResolver;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.util.List;
import java.util.Properties;

/**
 * Author : zhanglianwei
 * Create : 2018/2/8 16:59
 * Update : 2018/2/8 16:59
 * Descriptions :
 */
@Configuration
@EnableTransactionManagement
@EnableAutoConfiguration
@SpringBootApplication
public class XiaoyaojiWebApplication extends WebMvcConfigurerAdapter {

    public static void main(String[] args) {
        SpringApplication.run(XiaoyaojiWebApplication.class, args);
    }



    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        super.addArgumentResolvers(argumentResolvers);
        argumentResolvers.add(new UserArgumentsResolver());
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        super.configureMessageConverters(converters);
        JsonMessageConverter jsonMessageConverter = new JsonMessageConverter();
        jsonMessageConverter.getFastJsonConfig().setSerializerFeatures(
                SerializerFeature.WriteDateUseDateFormat,
                SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteNullStringAsEmpty
        );
    }

    @Override
    public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
        super.addReturnValueHandlers(returnValueHandlers);
        MultiModelAndViewReturnValueHandler mv = new MultiModelAndViewReturnValueHandler();
        mv.setJsonMessageConverter(new JsonMessageConverter());
        mv.init();
        returnValueHandlers.add(mv);
    }

    @Override
    public void extendHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
        super.extendHandlerExceptionResolvers(exceptionResolvers);
        ExceptionResolver exceptionResolver = new ExceptionResolver();
        exceptionResolver.setOrder(1);
        exceptionResolver.setDefaultErrorView("/error");
        exceptionResolver.setExceptionAttribute("exception");
        Properties properties = new Properties();
        properties.setProperty("/error/503", "503");
        exceptionResolver.setStatusCodes(properties);
        exceptionResolvers.add(exceptionResolver);

        Properties mappings = new Properties();
        mappings.setProperty("java.lang.Exception", "/error/503");
        exceptionResolver.setExceptionMappings(mappings);
    }
}
