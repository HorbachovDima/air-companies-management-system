package com.testproject.im.dao.impl;

import com.testproject.im.dao.FlightDao;
import com.testproject.im.entity.Flight;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class FlightDaoImpl implements FlightDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Flight findById(int id) {
        return entityManager.find(Flight.class, id);
    }

    @Override
    public List<Flight> findAllFlightInActiveStatus() {
        String status = "ACTIVE";
        List<Flight> flights = entityManager.createQuery("select f from Flight f where f.flightStatus = :status", Flight.class)
                .setParameter("status", status)
                .getResultList();
        return flights;
    }

    @Override
    public void saveWithPendingStatus(Flight flight) {
        String status = "PENDING";
        flight.setFlightStatus(status);
        Flight dbFlight = entityManager.merge(flight);
        flight.setId(dbFlight.getId());
    }

    @Override
    public void save(Flight flight) {
        Flight dbFlight = entityManager.merge(flight);
        flight.setId(dbFlight.getId());
    }
}
