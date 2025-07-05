//
//  NetworkError.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

public struct NetworkError: Error {
    
    public let message: String
    public let errorType: NetworkErrorType
}

public extension NetworkError {
    init(errorType: NetworkErrorType) {
        message = ""
        self.errorType = errorType
    }
    
    init(errorType: NetworkErrorType, message: String?) {
        self.message = message ?? ""

        self.errorType = errorType
    }
}

public enum NetworkErrorType: String {
    case serverError
    case badConnection
    case notFound
    case generic
    case badRequest

}
