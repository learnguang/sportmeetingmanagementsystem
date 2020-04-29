package com.handy.domain;

import com.alibaba.fastjson.annotation.JSONField;
import com.handy.utils.Date.DateUtils;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class Borrow {

    /**
     * 借出id
     */
    private Integer bId;
    /**
     * 借用人id
     */
    private String bNo;
    /**
     * 借出器材id
     */
    private Integer bEid;
    /**
     * 借出数量
     */
    private Integer bNum;
    /**
     * 借出时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date bStarttime;
    private String bStarttimeStr;
    /**
     * 归还时间
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date bEndtime;
    private String bEndtimeStr;
    /**
     * 归还状态
     */
    private Boolean bState;
    /**
     * 借用理由
     */
    private String bDescription;
    private Equipment equipment;
    private User user;

    public Borrow(String bNo, Integer bEid, Integer bNum, Date bStarttime, Date bEndtime, Boolean bState, String bDescription) {
        this.bNo = bNo;
        this.bEid = bEid;
        this.bNum = bNum;
        this.bStarttime = bStarttime;
        this.bEndtime = bEndtime;
        this.bState = bState;
        this.bDescription = bDescription;
    }

    public String getBStarttimeStr() {
        if (bStarttime != null)
            bStarttimeStr = DateUtils.date2String(bStarttime, "yyyy-MM-dd HH:mm:ss");
        return bStarttimeStr;
    }

    public String getBEndtimeStr() {
        if (bEndtime != null)
            bEndtimeStr = DateUtils.date2String(bEndtime, "yyyy-MM-dd HH:mm:ss");
        return bEndtimeStr;
    }

}