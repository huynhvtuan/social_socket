//
//  RegisterService.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 13/07/2023.
//

import Foundation

class RegisterService: ApiService {
    func fetchAlbums(completion: @escaping (Result<BaseResponse, ErrorHandle>) -> Void) {
        let url = creatUrl()
        fetch(httpMethod: "GET", type: BaseResponse.self, url: url, completion: completion)
    }
}
