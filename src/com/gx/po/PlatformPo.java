package com.gx.po;

public class PlatformPo {

    private Integer id;
    private String name;
    private Integer isYong;//1启用 2禁用

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIsYong() {
        return isYong;
    }

    public void setIsYong(Integer isYong) {
        this.isYong = isYong;
    }
}
