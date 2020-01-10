package com.frog.bean;

import java.util.HashMap;
import java.util.Map;

public class ResultInfo {

    private String msg;
    private Integer code;
    private Map<String,Object> extend = new HashMap<String,Object>();

    public static ResultInfo success(){
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(100);
        resultInfo.setMsg("处理成功");
        return resultInfo;
    }

    public static ResultInfo fail(){
        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(200);
        resultInfo.setMsg("处理失败");
        return resultInfo;
    }

    public ResultInfo add(String key,Object value){
        this.extend.put(key,value);
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
