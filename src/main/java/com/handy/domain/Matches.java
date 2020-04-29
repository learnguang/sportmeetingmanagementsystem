package com.handy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Matches {
    /**
     * 赛事id
     */
    private Integer mId;

    /**
     * 参赛人id
     */
    private String mNo;

    /**
     * 参赛项目
     */
    private Integer mEid;

    /**
     * 将参赛人分组分道
     */
    private String mSort;

    /**
     * 赛事成绩
     */
    private String mScore;

    /**
     * 成绩排名
     */
    private Integer mRank;

    private Event event;

    private User user;


}