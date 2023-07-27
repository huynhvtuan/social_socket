//
//  View+Extensions.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 11/07/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }

    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(.footnote)

            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            if title.lowercased().contains("password") && !showPassword.wrappedValue {
                SecureField(hint, text: value)
                    .autocapitalization(.none)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .autocapitalization(.none)
            }
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            Group {
                if title.lowercased().contains("password") {
                    Button {
                        showPassword.wrappedValue.toggle()
                    } label: {
                        Image(systemName: showPassword.wrappedValue ? "eye" : "eye.slash")
                    }.offset(y: 8)
                }
            }, alignment: .trailing
        )
    }
}
