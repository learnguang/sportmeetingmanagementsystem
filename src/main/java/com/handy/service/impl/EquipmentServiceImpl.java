package com.handy.service.impl;

import com.handy.dao.EquipmentMapper;
import com.handy.domain.Equipment;
import com.handy.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    private EquipmentMapper equipmentMapper;

    @Override
    public List<Equipment> findAll() {
        return equipmentMapper.findAll();
    }

    @Override
    public void insert(Equipment equipment) {
        equipmentMapper.insert(equipment);

    }

    @Override
    public void update(Equipment equipment) {
        equipmentMapper.update(equipment);
    }

    @Override
    public Equipment findById(Integer id) {
        return equipmentMapper.findById(id);
    }

    @Override
    public void deleteById(Integer[] id) {
        if (id != null && id.length != 0) {
            for (Integer eid : id) {
                equipmentMapper.deleteById(eid);
            }
        }
    }
}
