//
//  ApiService.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 13/07/2023.
//

import Foundation
import SwiftUI

class ApiService {
    @StateObject var netWorkInfo = NetworkInfo()
    func fetch<T: Decodable>(httpMethod: String, type: T.Type, url: URL?, completion: @escaping (Result<T, ErrorHandle>) -> Void) {
        if(!netWorkInfo.connected){
            let error = ErrorHandle.disConnection
            completion(Result.failure(error))
            return
        }
        guard let url = url else {
            let error = ErrorHandle.badURL
            completion(Result.failure(error))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as? URLError {
                completion(Result.failure(ErrorHandle.urlSession(error)))
            } else if let response = response as? HTTPURLResponse,!(200 ... 299).contains(response.statusCode) {
                completion(Result.failure(ErrorHandle.badResponse(response.statusCode)))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }

    func creatUrl(queryItems: [URLQueryItem]? = nil) -> URL? {
        let baseURL = ""
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}

struct BaseResponse: Codable {
    let statusCode: Int
    let success: Bool
}
