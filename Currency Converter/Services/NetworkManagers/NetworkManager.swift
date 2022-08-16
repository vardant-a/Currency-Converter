//
//  NetworkManager.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation
import Alamofire

let LinkCurrency = "https://open.er-api.com/v6/latest/RUB"

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: String?, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let type = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
//    func fetchAlamofire() {
//        AF.request(LinkCurrency.usd.rawValue)
//            .validate()
//            .responseJSON { dataResponse in
//                switch dataResponse.result {
//                case.success(let value):
//                    guard let testDatum = value as? [[String: Any?]] else { return }
//                    for testData in testDatum {
//                        let dataTest = Currency(
//                            name: <#T##String#>,
//                            info: <#T##String#>,
//                            designation: <#T##String#>,
//                            image: <#T##String#>
//                        )
//                    }
//                case .failure(let error):
//                    print(error)
//                
//                }
//                
//            }
//    }
}
