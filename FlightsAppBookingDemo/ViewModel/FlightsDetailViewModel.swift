//
//  FlightsDetailViewModel.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 14/08/21.
//

import SwiftUI

class FlightsDetailViewModel: ObservableObject {
    
    @Published var flightsDetails = [FlightsDetailModel]()
    
    private func fetchFlighstDetailsignature(id: Int,completion:@escaping (Result<[FlightsDetailModel], NetworkError>) -> Swift.Void) {
        print("\(EndPoint.FLIGHTS_DETAILS_URL + "\(id)")")
        NetworkService.sharedInstance.getData(url: EndPoint.FLIGHTS_DETAILS_URL + "\(id)", completionHandler: completion)
    }
    
    func fetchFlightsDetails(id: Int) {
        self.fetchFlighstDetailsignature(id: id) { result in
            switch result {
            case .success(let flightDetails):
                print("Flights Details: \(flightDetails)")
                self.flightsDetails = flightDetails
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
