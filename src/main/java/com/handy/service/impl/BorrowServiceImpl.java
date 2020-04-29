package com.handy.service.impl;

import com.handy.dao.BorrowMapper;
import com.handy.domain.Borrow;
import com.handy.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    private BorrowMapper borrowMapper;

    @Override
    public List<Borrow> selectByeId(Integer eId) {
        return borrowMapper.selectByeId(eId);
    }

    @Override
    public List<Borrow> findAll() {
        return borrowMapper.findAll();
    }

    @Override
    public void deleteById(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer bid : id) {
                borrowMapper.deleteById(bid);
            }
        }
    }

    @Override
    public void insert(Borrow borrow) {
        borrowMapper.insert(borrow);
    }

    @Override
    public List<Borrow> findAllOff() {

        return borrowMapper.findAllOff();
    }

    @Override
    public void update(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer bid : id) {
                borrowMapper.update(bid);
            }
        }
    }


}
