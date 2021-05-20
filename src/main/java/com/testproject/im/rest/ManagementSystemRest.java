package com.testproject.im.rest;

import com.testproject.im.entity.AirCompany;
import com.testproject.im.entity.Airplane;
import com.testproject.im.entity.Flight;
import com.testproject.im.service.ManagementSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system")
public class ManagementSystemRest {

    private ManagementSystemService managementSystemService;

    @Autowired
    public ManagementSystemRest(ManagementSystemService managementSystemService) {
        this.managementSystemService = managementSystemService;
    }

    @PostMapping("/companies")
    public void saveAirCompany(@RequestBody AirCompany airCompany) {
        managementSystemService.saveAirCompany(airCompany);
    }

    @GetMapping("/companies/{id}")
    public AirCompany findAirCompanyById(@PathVariable int id) {
        return managementSystemService.findAirCompanyById(id);
    }

    @GetMapping("/companies")
    public List<AirCompany> findAllAirCompanies() {
        return managementSystemService.findAllAirCompanies();
    }

    @PutMapping("/companies")
    public AirCompany updateAirCompany(@RequestBody AirCompany airCompany) {
        managementSystemService.saveAirCompany(airCompany);
        return airCompany;
    }

    @DeleteMapping("/companies/{id}")
    public void removeAirCompany(@PathVariable int id) { // It is work
        managementSystemService.removeAirCompany(id);
    }

    @PutMapping("/airplanes/{newAirplaneCompanyId}/{airplaneId}")
    public void changeAirplaneCompany(@PathVariable int newAirplaneCompanyId, @PathVariable int airplaneId) {
        managementSystemService.changeAirplaneCompany(newAirplaneCompanyId, airplaneId);
    }

    @GetMapping("/flights/{companyName}/{flightStatus}")
    public List<Flight> findAllAirCompanyFlightsByStatus(@PathVariable String companyName, @PathVariable String flightStatus) {
        return managementSystemService.findAllAirCompanyFlightsByStatus(companyName, flightStatus);
    }

    @GetMapping("/flights")
    public List<Flight> findAllFlightInActiveStatusAndStartedMoreThan24HoursAgo() {
        return  managementSystemService.findAllFlightInActiveStatusAndStartedMoreThan24HoursAgo();
    }

    @PostMapping("/airplanes/{airCompanyId}")
    public void saveAirplane(@PathVariable(required = false) int airCompanyId, @RequestBody Airplane airplane) {
        managementSystemService.saveAirplane(airCompanyId, airplane);
    }

    @PostMapping("/flights")
    public void saveFlight(@RequestBody Flight flight) {
        managementSystemService.saveFlight(flight);
    }

    @PutMapping("/flights/{flightId}/{flightStatus}")
    public void changeFlightStatus(@PathVariable int flightId, @PathVariable String flightStatus) {
        managementSystemService.changeFlightStatus(flightId, flightStatus);
    }
}
