//
//  ProlougeView.swift
//  testqa
//
//  Created by Jood Abdulsattar Dawood on 03/02/2024.
//

import SwiftUI

struct PrologueView: View {
    @Binding var shouldNavigate: Bool
    @State private var opacity = 0.5
    @State private var scale = 1.0
  //  @State private var shouldNavigate = false // State to control navigation

    var body: some View {
        // Check if navigation should occur
        if shouldNavigate {
            Onboarding1View()
        } else {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Text("Prologue")
                    .font(Font.custom("KindlyRewind", size: 53))
                    .multilineTextAlignment(.center)
                    .scaleEffect(scale)
                    .foregroundColor(.white)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            self.opacity = 1.0
                            self.scale = 1.0
                        }
                    }
            }
            .onAppear {
                // Delay the navigation transition
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        self.shouldNavigate = true
                    }
                }
            }
        }
    }
}

struct PrologueView_Previews: PreviewProvider {
    static var previews: some View {
        // Use a constant binding for previews
        PrologueView(shouldNavigate: .constant(false))
    }
}


