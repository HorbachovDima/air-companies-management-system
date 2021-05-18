package com.testproject.im.dao;

import com.testproject.im.entity.Flight;

import java.util.List;

public interface FlightDao {
    Flight findById(int id);

    List<Flight> findAllFlightInActiveStatusAndStartedMoreThan24HoursAgo();

    void saveWithPendingStatus(Flight flight);

    void save(Flight flight);
}
