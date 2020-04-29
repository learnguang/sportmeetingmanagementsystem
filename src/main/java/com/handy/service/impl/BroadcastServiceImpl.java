package com.handy.service.impl;

import com.handy.dao.BroadcastMapper;
import com.handy.domain.Broadcast;
import com.handy.service.BroadcastService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BroadcastServiceImpl implements BroadcastService {

    @Autowired
    private BroadcastMapper broadcastMapper;

    @Override
    public List<Broadcast> selectBroadcastByS() {
        return broadcastMapper.selectBroadcastByS();
    }

    @Override
    public List<Broadcast> selectBybSportmeetingid(Integer id) {
        return broadcastMapper.selectBybSportmeetingid(id);
    }


    @Override
    public void deleteById(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer bid : id) {
                broadcastMapper.deleteById(bid);
            }
        }
    }

    @Override
    public List<Broadcast> findAll() {
        return broadcastMapper.findAll();
    }

    @Override
    public Broadcast findById(Integer id) {

        return broadcastMapper.findById(id);
    }

    @Override
    public void insert(Broadcast broadcast) {
        broadcastMapper.insert(broadcast);
    }

    @Override
    public void update(Broadcast broadcast) {
        broadcastMapper.update(broadcast);
    }
}
