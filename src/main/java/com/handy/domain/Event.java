package com.handy.domain;

import com.alibaba.fastjson.annotation.JSONField;
import com.handy.utils.Date.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class Event {

    /**
     * 项目id
     */
    private Integer eId;
    /**
     * 项目名称
     */
    private String eName;
    /**
     * 项目举办地点
     */
    private String ePlace;
    /**
     * 项目性别限制
     */
    private Boolean eGender;
    /**
     * 项目举办日期
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date eDate;
    private String eDateStr;
    /**
     * 报名开始时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date eStarttime;
    private String eStarttimeStr;
    /**
     * 报名结束时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date eEndtime;
    private String eEndtimeStr;
    /**
     * 运动会id
     */
    private Integer eSportmeetingid;
    /**
     * 项目规则
     */
    private String eRules;
    /**
     * 项目裁判id
     */
    private String eJudgementid;
    /**
     * 项目成绩记录单位
     */
    private String eUnit;

    private Sportmeeting sportmeeting;
    private User user;

    public Event(String eName, String ePlace, Boolean eGender, Date eDate, Date eStarttime, Date eEndtime, Integer eSportmeetingid, String eRules, String eJudgementid) {
        this.eName = eName;
        this.ePlace = ePlace;
        this.eGender = eGender;
        this.eDate = eDate;
        this.eStarttime = eStarttime;
        this.eEndtime = eEndtime;
        this.eSportmeetingid = eSportmeetingid;
        this.eRules = eRules;
        this.eJudgementid = eJudgementid;
    }

    public String getEDateStr() {
        if (eDate != null)
            eDateStr = DateUtils.date2String(eDate, "yyyy-MM-dd HH:mm:ss");
        return eDateStr;
    }

    public String getEStarttimeStr() {
        if (eStarttime != null)
            eStarttimeStr = DateUtils.date2String(eStarttime, "yyyy-MM-dd HH:mm:ss");
        return eStarttimeStr;
    }

    public String getEEndtimeStr() {
        if (eEndtime != null)
            eEndtimeStr = DateUtils.date2String(eEndtime, "yyyy-MM-dd HH:mm:ss");
        return eEndtimeStr;
    }
}