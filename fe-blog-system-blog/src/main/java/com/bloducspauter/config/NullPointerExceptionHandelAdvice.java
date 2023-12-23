package com.bloducspauter.config;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@Order(-1000)
public class NullPointerExceptionHandelAdvice {
    @ExceptionHandler(NullPointerException.class)
    @ResponseBody
    public Map<String,Object> handelRuntimeException(){
        Map<String,Object>map=new HashMap<>();
        map.put("code",-1);
        map.put("msg","Did you miss something? Go back and check it. :)");
        return map;
    }
}
