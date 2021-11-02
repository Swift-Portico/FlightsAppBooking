//
//  FlightListViewModel.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 12/08/21.
//

import SwiftUI

class FlightsListViewModel: ObservableObject {
    
    @Published var flightsResults = [FlightsListModel]()
    
   private func fetchFlighstListSignature(completion:@escaping (Result<[FlightsListModel], NetworkError>) -> Swift.Void) {
        NetworkService.sharedInstance.getData(url: EndPoint.FLIGHTS_LIST_URL, completionHandler: completion)
    }
    
    func fetchFlightsList() {
        self.fetchFlighstListSignature { result in
            switch result {
            case .success(let flightList):
                print("Flights List: \(flightList)")
                self.flightsResults = flightList
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
