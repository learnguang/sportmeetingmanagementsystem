package com.handy.service;

import com.handy.domain.Sportmeeting;

import java.util.List;
import java.util.Map;

public interface SportmeetingService {


    List<Sportmeeting> findAll();

    void deleteByPK(Integer[] sId);

    Map<String, Object> findDetailsBysId(Integer sId);

    void insert(Sportmeeting sportmeeting);

    List<Sportmeeting> exportExcel();

    void updateStatus(Integer id, Boolean status);

    Sportmeeting findBysId(Integer id);

    Integer update(Sportmeeting sportmeeting);

    List<Sportmeeting> findAllSportmeetings();

}
