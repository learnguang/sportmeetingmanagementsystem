package com.handy.domain;

import com.alibaba.fastjson.annotation.JSONField;
import com.handy.utils.Date.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class Equipment {
    /**
     * 器材id
     */
    private Integer eId;
    /**
     * 器材名称
     */
    private String eName;
    /**
     * 器材型号
     */
    private String eModel;
    /**
     * 器材放置地点
     */
    private String ePlace;
    /**
     * 器材总数
     */
    private Integer eSum;

    private Integer eSurplus;

    private Integer borrow;

    /**
     * 器材采购时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date eBuytime;
    private String eBuytimeStr;

    public Equipment(String eName, String eModel, String ePlace, Integer eSum, Date eBuytime) {
        this.eName = eName;
        this.eModel = eModel;
        this.ePlace = ePlace;
        this.eSum = eSum;
        this.eBuytime = eBuytime;
    }

    public String getEBuytimeStr() {
        if (eBuytime != null)
            eBuytimeStr = DateUtils.date2String(eBuytime, "yyyy-MM-dd HH:mm:ss");
        return eBuytimeStr;
    }
}