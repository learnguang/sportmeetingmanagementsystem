package com.handy.service;

import com.handy.domain.Equipment;

import java.util.List;

public interface EquipmentService {

    List<Equipment> findAll();

    void insert(Equipment equipment);

    void update(Equipment equipment);

    Equipment findById(Integer id);

    void deleteById(Integer[] id);
}
