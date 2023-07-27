//
//  RegisterView.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 13/07/2023.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var _viewModel = RegisterViewModel()

    @State var show: Bool = false
    @State var showPassword: Bool = false
    @State var phNo: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        AnimatedView(show: $show)
                            .frame(width: 100, height: UIScreen.main.bounds.height / 3 - 100)
                            .scaleEffect(0.2)
                        //                Login screen
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Register")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                Spacer(minLength: 15)
                            }

                            VStack(spacing: 15) {
                                CustomTextField(icon: "envelope", title: "Email", hint: "justine@gmail.com", value: $_viewModel.email, showPassword: .constant(false))
                                CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $_viewModel.password, showPassword: $showPassword)
                                CustomTextField(icon: "lock", title: "Re-Password", hint: "123456", value: $_viewModel.rePassword, showPassword: $showPassword)
                            }.padding(.vertical, 5)
                            Button {
                                Task {
                                    try await _viewModel.createUser()
                                }
                            } label: {
                                Text("Register")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .frame(width: UIScreen.main.bounds.width - 60)
                                    .background(Color(.systemCyan))
                                    .clipShape(Capsule())
                            }
                            HStack {
                                Spacer()
                                Button {
                                    dismiss()
                                } label: {
                                    Text("Already an account, SignIn!")
                                        .font(.footnote)
                                }
                            }.padding(.top, 5)
                            HStack {
                                Rectangle()
                                    .fill(Color.black.opacity(0.3))
                                    .frame(height: 1)
                                Text("OR")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black.opacity(0.3))
                                Rectangle()
                                    .fill(Color.black.opacity(0.3))
                                    .frame(height: 1)
                            }.padding(.vertical, 5)
                            HStack {
                                Button {
                                } label: {
                                    HStack {
                                        Text("Facebook")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.vertical, 10)
                                    .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                    .background(Color(.systemBlue))
                                    .clipShape(Capsule())
                                }
                                Button {
                                } label: {
                                    HStack {
                                        Text("Google")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.vertical, 10)
                                    .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                    .background(Color(.systemRed))
                                    .clipShape(Capsule())
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.vertical, 30)
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
