//
//  LoginView.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 11/07/2023.
//

import Lottie
import SwiftUI

struct LoginView: View {
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
                            .frame(width: 100, height: UIScreen.main.bounds.height / 3)
                            .scaleEffect(0.3)
                        //    Login screen
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Login")
                                        .font(.title)
                                        .fontWeight(.bold)
                                }
                                Spacer(minLength: 15)
                            }

                            VStack(spacing: 15) {
                                CustomTextField(icon: "envelope", title: "Email", hint: "justine@gmail.com", value: $email, showPassword: .constant(false))
                                CustomTextField(icon: "lock", title: "Password", hint: "123456", value: $password, showPassword: $showPassword)
                            }.padding(.vertical, 5)
                            Button {
                            } label: {
                                Text("Login")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .frame(width: UIScreen.main.bounds.width - 60)
                                    .background(Color(.systemCyan))
                                    .clipShape(Capsule())
                            }
                            HStack {
                                Button {
                                } label: {
                                    Text("Forgot password?")
                                        .font(.footnote)
                                }
                                Spacer()
                                NavigationLink(destination: RegisterView(), label: {
                                    Text("Create an account?")
                                        .font(.footnote)
                                })
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct AnimatedView: UIViewRepresentable {
    @Binding var show: Bool
    func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: "splash.json", bundle: Bundle.main)
        view.animationSpeed = 2.5
        view.play(toFrame: 96) { status in
            if status {
                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                    show.toggle()
                }
            }
        }
        return view
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
    }
}
