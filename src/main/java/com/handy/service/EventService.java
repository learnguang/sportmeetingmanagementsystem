package com.handy.service;

import com.handy.domain.Event;

import java.util.List;
import java.util.Map;

public interface EventService {

    List<Event> findAll();

    List<Event> findNewAll(String uId);

    Map<String, Object> findDetailsByeId(Integer eId);

    void participate(Integer eId, String No);

    void insert(Event event);

    void update(Event event);

    Event findById(Integer id);

    void deleteById(Integer[] id);

    List<Event> findNoScore();

    void rank(Integer id);

    void random(Integer id);
}
