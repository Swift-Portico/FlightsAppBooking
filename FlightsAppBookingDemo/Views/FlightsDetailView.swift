//
//  FlightsDetailView.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 13/08/21.
//

import SwiftUI

struct FlightsDetailView: View {
    
    var flightsListData: FlightsListModel
    
    @StateObject var flightsDetailsVM = FlightsDetailViewModel()
    
    var body: some View {
        let flightsDetailData: FlightsDetailModel = flightsDetailsVM.flightsDetails.count > 0 ? flightsDetailsVM.flightsDetails[0] : FlightsDetailModel.init(source: "", destination:  "", baggage:  "", sourceAirport:  "", company:  "", departure:  "", destinationCode:  "", fare: 0, fareType:  "", destinationAirport:  "", cabin:  "", cancellation:  "", checkin:  "", flightNumber:  "", id: 0, stops: 0, duration:  "", sourceCode:  "", arrival:  "")
        VStack {
            Text("Flight Details")
                .font(.title)
                .fontWeight(.semibold)
            
            Spacer()
            
            VStack {
                
                HStack {
                    Text("\(flightsDetailData.company) - \(flightsDetailData.flightNumber)")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.top, 16)
                .padding()
                HStack{
                    VStack {
                        Text(flightsDetailData.sourceCode)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text(flightsDetailData.source)
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
                        Text(flightsDetailData.destinationCode)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text(flightsDetailData.destination)
                    }
                }
                .padding()
                
                HStack(spacing:2) {
                    Text(flightsDetailData.sourceAirport)
                    Spacer(minLength: 0)
                    Text(flightsDetailData.destinationAirport)
                }
                .padding()
                
                HStack {
                    VStack(spacing: 16) {
                        Image(systemName: "airplane.departure")
                            .font(.title)
                        Text(flightsDetailData.departure)
                            .font(.headline)
                    }
                    VStack {
                        HStack(alignment: .top) {
                            Spacer()
                            VStack {
                                Text(flightsDetailData.duration)
                                    .font(.title)
                                DottedLine()
                                    .stroke(style: .init(lineWidth: 2, dash: [5]))
                                    .frame(width: 100, height: 1)
                            }
                            Spacer()
                        }
                    }
                    VStack(spacing: 16) {
                        Image(systemName: "airplane.arrival")
                            .font(.title)
                        Text(flightsDetailData.arrival)
                            .font(.headline)
                    }
                }
                .padding()
                
                HStack {
                    Text("Baggage")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading,spacing: 8) {
                        HStack(spacing: 4) {
                            Text("CheckIn")
                                .font(.title)
                            Image(systemName: "suitcase.cart.fill")
                        }
                        Text(flightsDetailData.checkin)
                            .font(.title2)
                    }
                    Spacer()
                    
                    VStack(alignment: .trailing,spacing: 8) {
                        HStack(spacing: 4) {
                            Text("Cabin")
                                .font(.title)
                            Image(systemName: "suitcase.fill")
                        }
                        Text(flightsDetailData.cabin)
                            .font(.title2)
                    }
                }
                .padding()
                
                HStack(alignment: .center) {
                    Text("\(flightsDetailData.fare)")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(flightsDetailData.cancellation)
                        .font(.title2)
                        .lineLimit(nil)
                }
                .padding()
                
                VStack {
                    Spacer()
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "airplane.circle.fill")
                                .font(.title)
                            Text("BookNow")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    .frame(height: 56)
                    .padding(.horizontal, 16)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    Spacer()
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.themeColor)
            .cornerRadius(24)
            .padding()
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            flightsDetailsVM.fetchFlightsDetails(id: flightsListData.id)
        }
    }
}

struct FlightsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightsDetailView(flightsListData: FlightsListModel.init(flightNumber: "", company: "", sourceCode: "", duration: "", destinationCode: "", source: "", destination: "", id: 0, departure: "", fare: 0, arrival: "", stops: 0))
    }
}
