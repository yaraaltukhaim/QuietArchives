//
//  ContentView.swift
//  testqa
//
//  Created by Jood Abdulsattar Dawood on 03/02/2024.
//

import SwiftUI
import WebKit

enum OnboardingDestination {
    case onboarding2
}

struct Onboarding1View: View {
    @State private var displayedText: String = "overboarding1"
    private let fullText: String = "In seek of wealth, Arlo stole the forbidden jewel. Cursed, his voice was taken, a punishment fit for fools."

    @State private var gifOffset = CGSize(width: 600, height: 0)
    @State private var contentOpacity = 0.0
    @State private var navigateTo: OnboardingDestination? // Updated for new navigation model
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                GifView(name: "onboarding1")
                    .frame(width: 450, height: 300)
                    .offset(gifOffset)
                    .opacity(contentOpacity)
                
                Text(displayedText)
                    .font(Font.custom("KindlyRewind", fixedSize: 15))
                    .foregroundColor(.white)
                    .frame(width: 450)
                    .multilineTextAlignment(.center)
                    .padding(.top, 300)
                    .opacity(contentOpacity)
                    .onReceive(timer) { _ in
                        if displayedText.count < fullText.count {
                            let index = fullText.index(fullText.startIndex, offsetBy: displayedText.count)
                            displayedText.append(fullText[index])
                        }
                    }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: Onboarding2View()) {
                        Image("whitearrow") // Ensure "arrowbo" image is in your assets
                            .resizable()
                            .frame(width: 40, height: 40)
                            .position(x: 710, y: 350) // Adjust position as needed
                    }
                }

            }
            
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    gifOffset = CGSize(width: 0, height: 0)
                    contentOpacity = 1.0
                }
            }
        }
    }
}

// GifView code remains unchanged
struct GifView: UIViewRepresentable {
    let name: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.isUserInteractionEnabled = false // Disable interaction if needed
        webView.isOpaque = false
        webView.backgroundColor = .clear
        loadGIF(name: name, webView: webView)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Reload the GIF if needed, or handle updates to the view
    }


    private func loadGIF(name: String, webView: WKWebView) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "gif"),
              let data = try? Data(contentsOf: url) else {
            return
        }


        webView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
    }

}

struct Onboarding1View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1View()
    }
}


