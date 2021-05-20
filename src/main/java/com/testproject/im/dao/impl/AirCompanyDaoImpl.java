package com.testproject.im.dao.impl;

import com.testproject.im.dao.AirCompanyDao;
import com.testproject.im.entity.AirCompany;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class AirCompanyDaoImpl implements AirCompanyDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void save(AirCompany airCompany) {
        AirCompany dbAirCompany = entityManager.merge(airCompany);
        airCompany.setId(dbAirCompany.getId());
    }

    @Override
    public AirCompany findById(int id) {
        return entityManager.find(AirCompany.class, id);
    }

    @Override
    public AirCompany findByName(String name) {
        TypedQuery<AirCompany> query = entityManager.createQuery("select a from AirCompany a where a.name = :name", AirCompany.class);
        query.setParameter("name", name);
        return query.getSingleResult();
    }

    @Override
    public List<AirCompany> findAll() {
        return entityManager.createQuery("select a from AirCompany a", AirCompany.class)
                .getResultList();
    }

    @Override
    public void remove(int id) {
        AirCompany airCompany = entityManager.find(AirCompany.class, id);
        AirCompany mergedAirCompany = entityManager.merge(airCompany);
        entityManager.remove(mergedAirCompany);
    }
}
