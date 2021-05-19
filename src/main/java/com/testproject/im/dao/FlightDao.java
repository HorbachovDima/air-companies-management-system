package com.testproject.im.dao;

import com.testproject.im.entity.Flight;

import java.util.List;

public interface FlightDao {
    Flight findById(int id);

    List<Flight> findAllFlightInActiveStatus();

    void saveWithPendingStatus(Flight flight);

    void save(Flight flight);
}
