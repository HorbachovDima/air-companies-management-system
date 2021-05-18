package com.testproject.im.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "air_company")
public class AirCompany {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "company_type", nullable = false)
    private String companyType;

    @Column(name = "founded_at", nullable = false)
    private int foundedAt;

    @Setter(AccessLevel.PRIVATE)
    @OneToMany(mappedBy = "airCompany", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Airplane> airplanes = new ArrayList<>();

    @Setter(AccessLevel.PRIVATE)
    @OneToMany(mappedBy = "airCompany", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Flight> flights = new ArrayList<>();

    public void addAirplane(Airplane airplane) {
        airplanes.add(airplane);
        airplane.setAirCompany(this);
    }

    public void removeAirplane(Airplane airplane) {
        airplanes.remove(airplane);
        airplane.setAirCompany(null);
    }

    public void addFlight(Flight flight) {
        flights.add(flight);
        flight.setAirCompany(this);
    }

    public void removeFlight(Flight flight) {
        flights.remove(flight);
        flight.setAirCompany(null);
    }

    @Override
    public String toString() {
        return "AirCompany{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", companyType='" + companyType + '\'' +
                ", foundedAt=" + foundedAt +
                '}';
    }
}
