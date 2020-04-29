package com.handy.service.impl;

import com.handy.dao.BroadcastMapper;
import com.handy.dao.EventMapper;
import com.handy.dao.MatchesMapper;
import com.handy.dao.SportmeetingMapper;
import com.handy.domain.Broadcast;
import com.handy.domain.Event;
import com.handy.domain.Matches;
import com.handy.domain.Sportmeeting;
import com.handy.service.SportmeetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SportmeetingServiceImpl implements SportmeetingService {

    @Autowired
    private SportmeetingMapper sportmeetingMapper;

    @Autowired
    private BroadcastMapper broadcastMapper;

    @Autowired
    private EventMapper eventMapper;

    @Autowired
    private MatchesMapper matchesMapper;

    @Override
    public List<Sportmeeting> findAll() {
        return sportmeetingMapper.findAll();
    }

    @Override
    public void deleteByPK(Integer[] sId) {
        if (sId != null && sId.length != 0) {
            for (Integer id : sId) {
                sportmeetingMapper.deleteByPK(id);
            }
        }
    }

    @Override
    public Map<String, Object> findDetailsBysId(Integer sId) {
        Map<String, Object> map = new HashMap<>();
        Sportmeeting sportmeeting = sportmeetingMapper.selectByPK(sId);
        map.put("sportmeeting", sportmeeting);
        List<Broadcast> broadcastList = broadcastMapper.selectBybSportmeetingid(sId);
        map.put("broadcastList", broadcastList);
        List<Event> eventList = eventMapper.findBysId(sId);
        map.put("eventList", eventList);
        List<Matches> matchesList = matchesMapper.findBysId(sId);
        map.put("matchesList", matchesList);
        return map;
    }


    @Override
    public void insert(Sportmeeting sportmeeting) {
        sportmeetingMapper.insert(sportmeeting);
    }

    @Override
    public List<Sportmeeting> exportExcel() {
        return sportmeetingMapper.exportExcel();
    }

    @Override
    public void updateStatus(Integer id, Boolean status) {
        sportmeetingMapper.updateStatus(id, status);
    }

    @Override
    public Sportmeeting findBysId(Integer id) {

        return sportmeetingMapper.findBysId(id);
    }

    @Override
    public Integer update(Sportmeeting sportmeeting) {
        return sportmeetingMapper.updateByPKSelective(sportmeeting);
    }

    @Override
    public List<Sportmeeting> findAllSportmeetings() {

        return sportmeetingMapper.findAllSportmeetings();
    }
}
