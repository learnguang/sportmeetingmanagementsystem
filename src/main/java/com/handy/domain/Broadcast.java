package com.handy.domain;

import com.alibaba.fastjson.annotation.JSONField;
import com.handy.utils.Date.DateUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Broadcast {
    /**
     * 广播id
     */
    private Integer bId;
    /**
     * 广播主题
     */
    private String bTitle;
    /**
     * 广播内容
     */
    private String bContent;
    /**
     * 播出时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date bTime;
    private String bTimeStr;
    /**
     * 运动会id
     */
    private Integer bSportmeetingid;

    private Sportmeeting sportmeeting;

    private Integer sId;
    private String sName;
    private Integer total;

    public String getBTimeStr() {
        if (bTime != null)
            bTimeStr = DateUtils.date2String(bTime, "yyyy-MM-dd HH:mm:ss");
        return bTimeStr;
    }


}