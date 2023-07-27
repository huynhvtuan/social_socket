//
//  ErrorHandle.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 13/07/2023.
//

import Foundation

enum ErrorHandle: Error, CustomStringConvertible {
    case disConnection
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown

    var description: String {
        switch self {
        case .disConnection:
            return "dis Connection"
        case .badURL:
            return "badURL"
        case let .urlSession(error):
            return "urlSession error: \(error.debugDescription)"
        case let .badResponse(statusCode):
            return "bad response with status code: \(statusCode)"
        case let .decoding(decodingError):
            return "decoding error: \(String(describing: decodingError))"
        case .unknown:
            return "unknown error"
        }
    }

    var localizedDescription: String {
        switch self {
        case .badURL, .unknown, .disConnection:
            return "something went wrong"
        case let .urlSession(urlError):
            return urlError?.localizedDescription ?? "something went wrong"
        case .badResponse:
            return "something went wrong"
        case let .decoding(decodingError):
            return decodingError?.localizedDescription ?? "something went wrong"
        }
    }
}
