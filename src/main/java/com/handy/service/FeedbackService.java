package com.handy.service;

import com.handy.domain.Feedback;

import java.util.List;

public interface FeedbackService {


    void insert(Feedback feedback);

    List<Feedback> findAll();

    void deleteById(Integer[] id);
}
