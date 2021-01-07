//
//  NetworkConnection.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import Foundation
import Alamofire

//MARK: - NetworkConnectionDelegate
protocol NetworkConnectionDelegate: class {
    func dataReceived<T: Codable>(object: T)
    func failedRequest(error: Errors)
}

public class NetworkConnection {
    
    //MARK: - Delegate
    weak var delegate: NetworkConnectionDelegate?
    
    //MARK: - Properties
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
    //MARK: - Methods
    public func makeRequest<T: Codable>(withMethod method: Method, data: T.Type) {
        let urlString: String = baseURL + method.rawValue
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30.0

        manager.request(urlString, method: .get).response { [weak self] response in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200, let data = response.data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        self?.delegate?.dataReceived(object: result)
                    } catch {
                        self?.delegate?.failedRequest(error: .dataError)
                    }
                } else {
                    self?.delegate?.failedRequest(error: .dataError)
                }
                
                break
            case .failure:
                self?.delegate?.failedRequest(error: .serverError)
                break
            }
        }
    }

}
