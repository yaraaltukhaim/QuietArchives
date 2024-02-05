//
//  SwiftUIView.swift
//  qa
//
//  Created by Jood Abdulsattar Dawood on 05/02/2024.
//

import SwiftUI

// Define your SwiftUI App
@main
struct gametesting: App {
    // Define the AppDelegate to use it with the SwiftUI app
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            OnboardingMainView()
        }
    }
}

// ContentView to manage the transition from PrologueView to Onboarding1View
struct OnboardingMainView: View {
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                Onboarding1View()
            } else {
                PrologueView(shouldNavigate: $isActive)
            }
        }
        .onAppear {
            // Set the navigation flag after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
