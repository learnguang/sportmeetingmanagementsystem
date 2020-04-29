package com.handy.service;

import com.handy.domain.Broadcast;

import java.util.List;

public interface BroadcastService {


    List<Broadcast> selectBroadcastByS();

    List<Broadcast> selectBybSportmeetingid(Integer id);

    void deleteById(Integer[] id);

    List<Broadcast> findAll();

    Broadcast findById(Integer id);

    void insert(Broadcast broadcast);

    void update(Broadcast broadcast);
}
