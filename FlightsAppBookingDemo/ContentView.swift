//
//  ContentView.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 12/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var flighstListVM = FlightsListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(flighstListVM.flightsResults) { data in
                    NavigationLink(destination: FlightsDetailView(flightsListData: data)) {
                        FlightCardView(flightListData: data)
                    }
                }
            }
            .padding()
            .navigationBarTitle(Text("BOM - LHR"), displayMode: .large)
        }
        .onAppear {
            flighstListVM.fetchFlightsList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DottedLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: 0, y: 0))
        path.addLine(to: .init(x: rect.width, y: 0))
        return path
    }
    
}
