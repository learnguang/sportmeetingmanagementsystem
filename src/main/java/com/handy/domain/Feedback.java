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
public class Feedback {
    private Integer id;
    private String name;

    private String email;

    private String feedback;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date time;

    private String timeStr;

    public String getTimeStr() {
        if (time != null)
            timeStr = DateUtils.date2String(time, "yyyy-MM-dd HH:mm:ss");
        return timeStr;
    }
}