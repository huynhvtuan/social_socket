//
//  NetworkInfo.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 14/07/2023.
//

import Foundation
import Network

class NetworkInfo: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false
    
    func checkConnection() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.connected = true
            } else {
                self.connected = false
            }
        }
        monitor.start(queue: queue)
    }
}
