//
//  FlightCardView.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 13/08/21.
//

import SwiftUI

struct FlightCardView: View {
    
    var flightListData: FlightsListModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    HStack {
                        Image(systemName: "airplane")
                        Text(flightListData.flightNumber)
                    }
                    Spacer()
                    Text(flightListData.company)
                }
                
                HStack {
                    VStack {
                        Text(flightListData.sourceCode)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text(flightListData.source)
                    }
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "airplane")
                                .font(.title)
                            Spacer()
                        }
                    }
                    VStack {
                        Text(flightListData.destinationCode)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text(flightListData.destination)
                    }
                }
                
                HStack {
                    HStack {
                        Image(systemName: "airplane.departure")
                        Text(flightListData.departure)
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "airplane.arrival")
                        Text(flightListData.arrival)
                    }
                }
                
                DottedLine()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                
                HStack {
                    Text("$ \(flightListData.fare)")
                        .font(.headline)
                    Spacer()
                    Text("Book")
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.green)
        .cornerRadius(16)
    }
}

struct FlightCardView_Previews: PreviewProvider {
    static var previews: some View {
        FlightCardView(flightListData: FlightsListModel.init(flightNumber: "", company: "", sourceCode: "", duration: "", destinationCode: "", source: "", destination: "", id: 0, departure: "", fare: 0, arrival: "", stops: 0))
    }
}
