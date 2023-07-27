//
//  SplashView.swift
//  social_socket
//
//  Created by Huynh Van Tuan on 12/07/2023.
//

import SwiftUI

struct SplashView: View {
    // Instead of creating separate states for each animation
    @Binding var userSession: Bool
    @State var animationValues: [Bool] = Array(repeating: false, count: 10)

    var body: some View {
        ZStack {
            // LoginView
            GeometryReader { proxy in
                let size = proxy.size
                LoginView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .offset(y: animationValues[7] ? 0 : size.height + 50)
            }
            // Splash VIew
            if !animationValues[8] {
                VStack {
                    ZStack {
                        if animationValues[1] {
                            Circle()
                                .fill(.black)
                                .frame(width: 30, height: 30)
                                // Eye animation
                                .overlay(
                                    Rectangle()
                                        .fill(.white)
                                        .frame(height: animationValues[5] ? nil : 0)
                                        .frame(maxHeight: .infinity, alignment: .top)
                                        .padding(.bottom, 5)
                                )
                                .offset(x: animationValues[2] ? 35 : 0)
                        }
                        // creating tripavisor logo with circle shape
                        Circle()
                            .fill(.black)
                            .frame(width: 30, height: 30)
                            // Eye animation
                            .overlay(
                                Rectangle()
                                    .fill(.white)
                                    .frame(height: animationValues[5] ? nil : 0)
                                    .frame(maxHeight: .infinity, alignment: .top)
                                    .padding(.bottom, 5)
                            )
                            // scale from bottom
                            .scaleEffect(animationValues[0] ? 1 : 0, anchor: .bottom)
                            .offset(x: animationValues[2] ? -35 : 0)
                        ZStack {
                            Circle()
                                .stroke(Color.black, lineWidth: 10)
                                .frame(width: 62, height: 62)
                                .offset(x: -35)
                            Circle()
                                .stroke(Color.black, lineWidth: 10)
                                .frame(width: 62, height: 62)
                                .offset(x: 35)
                            Circle()
                                .trim(from: 0.6, to: 1)
                                .stroke(Color.black, lineWidth: 10)
                                .frame(width: 130, height: 130)
                                .rotationEffect(.init(degrees: -20))
                                .offset(y: 12)
                                .scaleEffect(1.07)
                            // Nose
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .offset(y: 30)
                                // Streching
                                .scaleEffect(CGSize(width: 1.3, height: 1), anchor: .top)
                                // Filling the gap
                                .background(
                                    Circle()
                                        .fill(.black)
                                        .frame(width: 15, height: 15)
                                        .offset(y: 20)
                                    , alignment: .top
                                )
                        }
                        .opacity(animationValues[3] ? 1 : 0)
                    }
                    .scaleEffect(animationValues[3] ? 0.75 : 1)
                    .padding(.horizontal, 30)
                    .drawingGroup()
                    // Title
                    Text("Tripadvisor")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(y: animationValues[4] ? -35 : 0)
                        .opacity(animationValues[4] ? 1 : 0)
                }
                .opacity(animationValues[6] ? 0 : 1)
                // Alway light mode
                .environment(\.colorScheme, .light)
            }

        }.onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                animationValues[0] = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animationValues[1] = true
                withAnimation(.easeInOut(duration: 0.4).delay(0.1)) {
                    animationValues[2] = true
                }
//                show sub
                withAnimation(.easeInOut(duration: 0.3).delay(0.45)) {
                    animationValues[3] = true
                }
                withAnimation(.easeInOut(duration: 0.4).delay(0.3)) {
                    animationValues[4] = true
                }
                withAnimation(.easeInOut(duration: 0.4).delay(0.6)) {
                    animationValues[5] = true
                }
            }
            // Restoring back
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                    animationValues[5] = false
                }
                // Ending splash
                withAnimation(.easeInOut(duration: 0.3).delay(0.4)) {
                    animationValues[6] = true
                }
                // Ending splash
                withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
                    animationValues[7] = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    animationValues[8] = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(userSession: .constant(false))
    }
}
