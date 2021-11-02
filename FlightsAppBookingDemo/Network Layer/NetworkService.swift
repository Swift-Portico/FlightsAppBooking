//
//  NetworkService.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 12/08/21.
//

import UIKit


protocol NetworkServiceProtocol {
    func getData<T: Decodable>(url: String,completionHandler:@escaping (Result<T, NetworkError>) -> Swift.Void)
}

enum NetworkError: Error {
    case badURL
    case decodingError
    case badRequest
    case error(_ message: String)
}

struct NetworkService: NetworkServiceProtocol {
    
    static let sharedInstance = NetworkService()
    
    func getData<T: Decodable>(url: String,completionHandler:@escaping (Result<T, NetworkError>) -> Swift.Void) {
        
        guard let url = URL(string: url) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(.failure(.error(error.localizedDescription)))
                    return
                }
                
                guard let unWrappedData = data else { return }
                
                do {
                    
                    let jsonObject = try JSONDecoder().decode(T.self, from: unWrappedData)
                    completionHandler(.success(jsonObject))
                } catch {
                    completionHandler(.failure(.decodingError))
                }
            }
        }
        .resume()
    }
}
