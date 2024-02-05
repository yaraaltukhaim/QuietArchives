//
//  LoadingView.swift
//  testqa
//
//  Created by Jood Abdulsattar Dawood on 03/02/2024.
//
import SwiftUI

struct LoadingView: View {
    let catImages = ["catwalking1", "catwalking2", "catwalking3"] // Ensure these are the names of your cat images in the asset catalog
    @State private var currentCatIndex = 0
    @State private var isActive = false // This will be used to trigger the navigation
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("QABkg") // Background image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarBackButtonHidden(true)
                VStack {
                    Spacer()
                    Image(catImages[currentCatIndex]) // Animated cat image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200) // Adjust the size as necessary
                        .onAppear {
                            let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                                currentCatIndex = (currentCatIndex + 1) % catImages.count
                            }
                            
                            // Stop the timer when this view disappears
                            onDisappear {
                                timer.invalidate()
                            }
                        }
                    
                    Text("Loading...") // Loading text
                        .font(Font.custom("KindlyRewind", size: 33))
                        .foregroundColor(Color(hex: "DFC3A8"))
                        .padding(.bottom, 50)
                    
                    Spacer()
                }
                
                // Trigger the navigation after a delay
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // Adjust the delay as necessary
                        isActive = true
                    }
                }
            }
            
            // Navigation destination
            .navigationDestination(isPresented: $isActive) {
                GameScene1View()
            }
        }
    }
}

// Extension to create a Color from a hex string
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // Optional: handle hex strings with a leading `#`
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
