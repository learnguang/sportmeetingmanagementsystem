package com.handy.service.impl;

import com.handy.dao.MatchesMapper;
import com.handy.domain.Matches;
import com.handy.service.MatchesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MatchesServiceImpl implements MatchesService {

    @Autowired
    private MatchesMapper matchesMapper;

    @Override
    public List<Matches> findAll() {
        return matchesMapper.findAll();
    }


    @Override
    public Map<String, Object> findDetailsBymId(Integer mId) {
        Map<String, Object> map = new HashMap<>();
        Matches matches = matchesMapper.selectByPK(mId);
        map.put("matches", matches);
        return map;
    }

    @Override
    public List<Matches> selectMyParticipate(String uId) {
        return matchesMapper.selectMyParticipate(uId);
    }

    @Override
    public void deleteById(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer mid : id) {
                matchesMapper.deleteById(mid);
            }
        }
    }

    @Override
    public void insert(Matches matches) {
        matchesMapper.insert(matches);
    }

    @Override
    public void update(Matches matches) {
        matchesMapper.update(matches);
    }

    @Override
    public Matches findById(Integer id) {
        return matchesMapper.findById(id);
    }

    @Override
    public void updateScore(Matches matches) {
        matchesMapper.updateScore(matches);

    }

    @Override
    public void concle(Integer id) {
        matchesMapper.concle(id);
    }
}
