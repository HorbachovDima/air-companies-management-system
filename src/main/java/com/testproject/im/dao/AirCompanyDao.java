package com.testproject.im.dao;

import com.testproject.im.entity.AirCompany;

import java.util.List;

public interface AirCompanyDao {

    void save(AirCompany airCompany);

    AirCompany findById(int id);

    AirCompany findByName(String name);

    List<AirCompany> findAll();

    void remove(int id);
}
