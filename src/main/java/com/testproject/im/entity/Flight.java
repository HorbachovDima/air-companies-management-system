package com.testproject.im.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDateTime;
import java.time.LocalTime;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "flight")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "flight_status", nullable = false)
    private String flightStatus;

    @Column(name = "departure_country", nullable = false)
    private String departureCountry;

    @Column(name = "destination_country", nullable = false)
    private String destinationCountry;

    @Column(name = "distance", nullable = false)
    private double distance;

    @Column(name = "estimated_flight_time", nullable = false)
    private LocalTime estimatedFlightTime;

    @Column(name = "ended_at")
    private LocalTime endedAt;

    @Column(name = "delay_started_at")
    private LocalTime delayStartedAt;

    @Column(name = "created_at")
    private LocalTime createdAt;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "air_company_id")
    @JsonBackReference
    private AirCompany airCompany;
//
//    @MapsId
//    @OneToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "airplane_id")
//    private Airplane airplane;
//
//    public enum Status {
//        ACTIVE,
//        COMPLETED,
//        DELAYED,
//        PENDING
//    }

    @Override
    public String toString() {
        return "Flight{" +
                "id=" + id +
                ", flightStatus=" + flightStatus +
                ", departureCountry='" + departureCountry + '\'' +
                ", destinationCountry='" + destinationCountry + '\'' +
                ", distance=" + distance +
                ", estimatedFlightTime=" + estimatedFlightTime +
                ", endedAt=" + endedAt +
                ", delayStartedAt=" + delayStartedAt +
                ", createdAt=" + createdAt +
                '}';
    }
}
