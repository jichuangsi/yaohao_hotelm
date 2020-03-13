package com.gx.util;

import com.google.gson.Gson;

import java.util.List;

public class LayuiReplay<T> {
    private int code;
    private String msg;
    private int count;
    private int pageSize;
    private List<T> data;

    public LayuiReplay(int code, String msg, int count,int pageSize, List<T> data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.pageSize=pageSize;
        this.data = data;
    }

    public String toJson() {
        Gson gson = new Gson();
        String json = gson.toJson(this);
        return json;
    }

    public static <T> String toJson(int count,int pageSize, List<T> data) {
        LayuiReplay<T> replay = new LayuiReplay<>(ReplyCode.OK.getCode(), ReplyCode.OK.getMessage(), count, pageSize,data);
        return replay.toJson();
    }
}
