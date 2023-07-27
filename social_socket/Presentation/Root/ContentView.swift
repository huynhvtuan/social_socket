//
//  ContentView.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 11/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashView(userSession: .constant(true))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
