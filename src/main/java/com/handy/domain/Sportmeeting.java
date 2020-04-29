package com.handy.domain;

import com.alibaba.fastjson.annotation.JSONField;
import com.handy.utils.Date.DateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sportmeeting {
    /**
     * 运动会id
     */
    private Integer sId;
    /**
     * 运动会名称
     */
    private String sName;
    /**
     * 运动会主题
     */
    private String sTheme;
    /**
     * 举办地点
     */
    private String sPlace;
    /**
     * 举办时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sDate;
    private String sDateStr;
    /**
     * 开始时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sStarttime;
    private String sStarttimeStr;
    /**
     * 结束时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date sEndtime;
    private String sEndtimeStr;
    /**
     * 描述
     */
    private String sDescription;
    /**
     * 运动会开启关闭状态
     */
    private Boolean sStatus;


    private List<Broadcast> broadcast;

    public String getSDateStr() {
        if (sDate != null)
            sDateStr = DateUtils.date2String(sDate, "yyyy-MM-dd HH:mm:ss");
        return sDateStr;
    }

    public String getSStarttimeStr() {
        if (sStarttime != null)
            sStarttimeStr = DateUtils.date2String(sStarttime, "yyyy-MM-dd HH:mm:ss");
        return sStarttimeStr;
    }

    public String getSEndtimeStr() {
        if (sEndtime != null)
            sEndtimeStr = DateUtils.date2String(sEndtime, "yyyy-MM-dd HH:mm:ss");
        return sEndtimeStr;
    }

}