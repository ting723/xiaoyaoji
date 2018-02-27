package cn.com.xiaoyaoji.converter;

import cn.com.xiaoyaoji.core.common.Result;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * @author: zhoujingjie
 * @Date: 17/3/30
 */
@Component
public class JsonMessageConverter extends FastJsonHttpMessageConverter {


    @Override
    protected void writeInternal(Object o, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        Result result;
        if(o instanceof Result){
            result = (Result) o;
        }else{
            result = new Result(true,o);
        }
        outputMessage.getHeaders().add("Content-Type","application/json;charset=utf-8");
        super.writeInternal(result,outputMessage);
    }
}
