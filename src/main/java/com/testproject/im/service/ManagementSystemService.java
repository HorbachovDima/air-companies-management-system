package com.testproject.im.service;

import com.testproject.im.dao.AirCompanyDao;
import com.testproject.im.dao.AirplaneDao;
import com.testproject.im.dao.FlightDao;
import com.testproject.im.entity.AirCompany;
import com.testproject.im.entity.Airplane;
import com.testproject.im.entity.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@Transactional
public class ManagementSystemService {

    private AirCompanyDao airCompanyDao;
    private AirplaneDao airplaneDao;
    private FlightDao flightDao;

    @Autowired
    public ManagementSystemService(AirCompanyDao airCompanyDao, AirplaneDao airplaneDao, FlightDao flightDao) {
        this.airCompanyDao = airCompanyDao;
        this.airplaneDao = airplaneDao;
        this.flightDao = flightDao;
    }

    public void saveAirCompany(AirCompany airCompany) {
        airCompanyDao.save(airCompany);
    }

    public AirCompany findAirCompanyById(int id) {
        return airCompanyDao.findById(id);
    }

    public List<AirCompany> findAllAirCompanies() {
        return airCompanyDao.findAll();
    }

    public void removeAirCompany(int id) {
        airCompanyDao.remove(id);
    }

    public void changeAirplaneCompany(int newAirCompanyId, int airplaneId) {
        Airplane airplane = airplaneDao.findById(airplaneId);
        if (airplane.getAirCompany() != null) {
            AirCompany airCompany = airCompanyDao.findById(airplane.getAirCompany().getId());
            airCompany.removeAirplane(airplane);
        }
        AirCompany newAirCompany = airCompanyDao.findById(newAirCompanyId);
        newAirCompany.addAirplane(airplane);
    }

    public List<Flight> findAllAirCompanyFlightsByStatus(String companyName, String status) {
        AirCompany airCompany = airCompanyDao.findByName(companyName);
        List<Flight> flights = airCompany.getFlights();
        return flights.stream()
                .filter(flight -> flight.getFlightStatus().equals(status))
                .collect(toList());
    }

    public List<Flight> findAllFlightInActiveStatusAndStartedMoreThan24HoursAgo() {
        return flightDao.findAllFlightInActiveStatusAndStartedMoreThan24HoursAgo();
    }

    public void saveAirplane(int airCompanyId, Airplane airplane) {
        if (airCompanyId != 0) {
            AirCompany airCompany = airCompanyDao.findById(airCompanyId);
            airCompany.addAirplane(airplane);
        } else {
            airplaneDao.save(airplane);
        }
    }

    public void saveFlight(Flight flight) {
        flightDao.saveWithPendingStatus(flight);
    }

    public void changeFlightStatus(int flightId, String newStatus) {
        Flight flight = flightDao.findById(flightId);
        if (newStatus.equals("ACTIVE")) {
            flight.setCreatedAt(LocalDateTime.now());
        } else if (newStatus.equals("DELAYED")) {
            flight.setDelayStartedAt(LocalTime.now());
        } else if (newStatus.equals("COMPLETED")) {
            flight.setEndedAt(LocalTime.now());
        }
        flight.setFlightStatus(newStatus);
        flightDao.save(flight);
    }

//
//    public void removeAirplane(int airCompanyId, int airplaneId) {
//        Airplane airplane = airplaneDao.findById(airplaneId);
//        if (airplane.getAirCompany() != null) {
//            AirCompany airCompany = airCompanyDao.findById(airCompanyId);
//            airCompany.removeAirplane(airplane);
//        }
//        airplaneDao.remove(airplaneId);
//    }
}
