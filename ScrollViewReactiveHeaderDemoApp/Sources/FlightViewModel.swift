//
//  FlightViewModel.swift
//  FlightViewModel
//
//  Created by Trent Guillory on 9/3/21.
//

import Foundation

struct Airport {
    
    let abbreviatedName: String
    let fullName: String
    let city: String
    let state: String
    
    var cityDisplayString: String {
        
        return "\(city), \(state)"
    }
    
    static let newOrleans: Airport = .init(abbreviatedName: "MSY", fullName: "Louis Armstrong International", city: "New Orleans", state: "LA")
    static let houston: Airport = .init(abbreviatedName: "IAH", fullName: "George Bush Intercontinental", city: "Houston", state: "TX")
    static let losAngeles: Airport = .init(abbreviatedName: "LAX", fullName: "Los Angeles International", city: "Los Angeles", state: "CA")
}

struct Flight {
    
    let departingAirport: Airport
    let arrivingAirport: Airport
    
    // IRL, these would be dates. But this demo is mostly a UI
    // example. There are plenty of date-to-string tutorials out there.
    // Plus, if you plan to support iOS 15+, now there are built in
    // date conversions!
    let departure: String
    let arrival: String
    
    var flightTime: String
}

struct FlightViewModel {
    
    let flights: [Flight]
    
    var backgroundImage: String {
        
        flights.last!.arrivingAirport.abbreviatedName
    }
    
    static let example: FlightViewModel = .init(flights: [
        .init(departingAirport: Airport.newOrleans, arrivingAirport: Airport.houston, departure: "Oct 1, 11:15 am", arrival: "1:30 pm", flightTime: "2h 15m"),
        .init(departingAirport: Airport.houston, arrivingAirport: Airport.losAngeles, departure: "2:30 pm", arrival: "6:00 pm", flightTime: "4h")
    ])
}
