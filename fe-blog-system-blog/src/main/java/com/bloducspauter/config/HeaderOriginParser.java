package com.bloducspauter.config;

import com.alibaba.csp.sentinel.adapter.spring.webmvc.callback.RequestOriginParser;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Component
@Slf4j
public class HeaderOriginParser implements RequestOriginParser {

    @Override
    public String parseOrigin(HttpServletRequest httpServletRequest) {
        Enumeration<String> enumeration=httpServletRequest.getHeaderNames();
        while (enumeration.hasMoreElements()){
            String head= enumeration.nextElement();
            log.info("接收到的header:"+head+",对应的值为"+httpServletRequest.getHeader(head));
        }
//        获取请求头
        String origin=httpServletRequest.getHeader("origin");
//        非空判断
        if("".equals(origin)){
            origin="back";
        }
        log.info("收到的“origin："+origin);
        return origin;
    }
}
