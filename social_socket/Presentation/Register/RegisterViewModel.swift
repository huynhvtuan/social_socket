//
//  RegisterViewModel.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 13/07/2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var rePassword: String = ""
    let registerService = RegisterService()

    func createUser() async {
        await registerService.fetchAlbums { results in
            DispatchQueue.main.async {
                switch results {
                case let .success(success):
                    print("fetched albums \(success.statusCode)")
                case let .failure(error):
                    print("error loading albums: \(error)")
                }
            }
        }
    }

    func reset() {
    }
}
