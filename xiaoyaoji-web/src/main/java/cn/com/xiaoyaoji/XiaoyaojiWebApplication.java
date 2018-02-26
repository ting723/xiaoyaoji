package cn.com.xiaoyaoji;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

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
public class XiaoyaojiWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(XiaoyaojiWebApplication.class, args);
    }
}
