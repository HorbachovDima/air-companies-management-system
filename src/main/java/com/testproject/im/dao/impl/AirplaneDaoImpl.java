package com.testproject.im.dao.impl;

import com.testproject.im.dao.AirplaneDao;
import com.testproject.im.entity.AirCompany;
import com.testproject.im.entity.Airplane;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class AirplaneDaoImpl implements AirplaneDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Airplane findById(int id) {
        return entityManager.find(Airplane.class, id);
    }

    @Override
    public void save(Airplane airplane) {
        Airplane dbAirplane = entityManager.merge(airplane);
        airplane.setId(dbAirplane.getId());
    }

    @Override
    public void remove(int id) {
        Airplane airplane = entityManager.find(Airplane.class, id);
        Airplane mergedAirplane = entityManager.merge(airplane);
        entityManager.remove(mergedAirplane);
    }
}
