//
//  FlightsDetailModel.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 12/08/21.
//

import Foundation

struct FlightsDetailModel: Decodable {
    
    let source: String
    let destination: String
    let baggage: String
    let sourceAirport: String
    let company: String
    let departure: String
    let destinationCode: String
    let fare: Int
    let fareType: String
    let destinationAirport: String
    let cabin: String
    let cancellation: String
    let checkin: String
    let flightNumber: String
    let id: Int
    let stops: Int
    let duration: String
    let sourceCode: String
    let arrival: String
}


