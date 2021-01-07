//
//  Errors.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import Foundation

public enum Errors: Error {
    case serverError
    case responseError
    case dataError
    
    public func getErrorMessage() -> String {
        switch self {
        case .serverError:
            return "Error En El Servidor"
        case .responseError:
            return "Error En La Respuesta Del Servidor"
        case .dataError:
            return "Error En El Objeto Recibido"
        }
    }
}
