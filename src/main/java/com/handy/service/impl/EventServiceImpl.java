package com.handy.service.impl;

import com.handy.dao.EventMapper;
import com.handy.dao.MatchesMapper;
import com.handy.domain.Event;
import com.handy.domain.Matches;
import com.handy.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EventServiceImpl implements EventService {


    @Autowired
    private EventMapper eventMapper;

    @Autowired
    private MatchesMapper matchesMapper;

    @Override
    public List<Event> findAll() {
        return eventMapper.findAll();
    }

    @Override
    public List<Event> findNewAll(String uId) {
        return eventMapper.findNewAll(uId);
    }

    @Override
    public Map<String, Object> findDetailsByeId(Integer eId) {
        Map<String, Object> map = new HashMap<>();

        Event event = eventMapper.selectByPK(eId);
        map.put("event", event);

        List<Matches> matchesList = matchesMapper.selectBymEid(eId);
        map.put("matchesList", matchesList);

        List<Matches> matchesList2 = matchesMapper.selectNotScores(eId);
        map.put("matchesList2", matchesList2);

        return map;
    }

    @Override
    public void participate(Integer eId, String No) {
        eventMapper.participate(eId, No);
    }

    @Override
    public void insert(Event event) {
        eventMapper.insert(event);
    }

    @Override
    public void update(Event event) {
        eventMapper.update(event);
    }

    @Override
    public Event findById(Integer id) {
        return eventMapper.findById(id);
    }

    @Override
    public void deleteById(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer eid : id) {
                eventMapper.deleteById(eid);
            }
        }
    }

    @Override
    public List<Event> findNoScore() {

        return eventMapper.findNoScore();
    }

    @Override
    public void rank(Integer id) {
        eventMapper.rank(id);
    }

    @Override
    public void random(Integer id) {

    }
}
