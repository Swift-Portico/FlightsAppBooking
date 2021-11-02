//
//  FlightsListModel.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 12/08/21.
//

import UIKit

struct FlightsListModel: Decodable, Identifiable {
    let flightNumber: String
    let company: String
    let sourceCode: String
    let duration: String
    let destinationCode: String
    let source: String
    let destination: String
    let id: Int
    let departure: String
    let fare: Int
    let arrival: String
    let stops: Int
}
