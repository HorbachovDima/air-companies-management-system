package com.testproject.im.dao;

import com.testproject.im.entity.Airplane;

public interface AirplaneDao {

    void save(Airplane airplane);

    Airplane findById(int id);

    void remove(int id);
}
