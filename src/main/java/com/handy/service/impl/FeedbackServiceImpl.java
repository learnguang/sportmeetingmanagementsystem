package com.handy.service.impl;

import com.handy.dao.FeedbackMapper;
import com.handy.domain.Feedback;
import com.handy.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    private FeedbackMapper feedbackMapper;

    @Override
    public void insert(Feedback feedback) {
        feedbackMapper.insert(feedback.getName(), feedback.getEmail(), feedback.getFeedback());
    }

    @Override
    public List<Feedback> findAll() {
        return feedbackMapper.findAll();
    }

    @Override
    public void deleteById(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer fid : id) {
                feedbackMapper.deleteById(fid);
            }
        }
    }
}
