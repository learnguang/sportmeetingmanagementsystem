package com.handy.service;

import com.handy.domain.Borrow;

import java.util.List;

public interface BorrowService {

    List<Borrow> selectByeId(Integer eId);

    List<Borrow> findAll();

    void deleteById(Integer[] id);

    void insert(Borrow borrow);

    List<Borrow> findAllOff();

    void update(Integer[] id);
}
