package com.handy.service;

import com.handy.domain.Matches;

import java.util.List;
import java.util.Map;

public interface MatchesService {


    List<Matches> findAll();

    Map<String, Object> findDetailsBymId(Integer mId);

    List<Matches> selectMyParticipate(String uId);

    void deleteById(Integer[] id);

    void insert(Matches matches);

    void update(Matches matches);

    Matches findById(Integer id);

    void updateScore(Matches matches);

    void concle(Integer id);
}
