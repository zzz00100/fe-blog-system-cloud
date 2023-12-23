package com.bloducspauter.demo;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
@Slf4j
public class BsSendEmailFunction {

    @Autowired
    private SendEmailProperties sendEmailProperties;

    private String toSend(String request,String to){
        return "http://"+ sendEmailProperties.getHost()+":"+ sendEmailProperties.getPort()+"/"+request+"?email="+to;
    }

    public void sendEmail(String requst,String to) throws IOException {
        Map<String,Object>map=new HashMap<>();
        URL url=new URL(toSend(requst,to));
        log.info(url.toString());
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Content-Type", "application/json");
// 设置其他请求头...
        int responseCode = connection.getResponseCode();
        InputStream inputStream = (responseCode >= 200 && responseCode < 300) ? connection.getInputStream() : connection.getErrorStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        String line;
        StringBuilder response = new StringBuilder();
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();
        String responseBody = response.toString();
        System.out.println(responseBody);
    }
}
