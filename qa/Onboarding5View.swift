//
//  Onboarding5View.swift
//  testqa
//
//  Created by Jood Abdulsattar Dawood on 03/02/2024.
//

import SwiftUI
import WebKit

struct Onboarding5View: View {
    @State private var displayedText: String = ""
    private let fullText: String = "Snatching Arlo's necklace while he lies asleep."
    
    @State private var gifOffset = CGSize(width: 600, height: 0) // Start offscreen to the right
    @State private var contentOpacity = 0.0
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
  
            
            Gif5View(name: "onboarding5")
                .frame(width: 450, height: 300)
                .offset(gifOffset)
                .opacity(contentOpacity)
            
            Text(displayedText)
                .font(Font.custom("KindlyRewind", fixedSize: 15))
                .foregroundColor(.white)
                .frame(width: 450)
                .multilineTextAlignment(.center)
                .padding(.top, 300)
                .offset(gifOffset)
                .opacity(contentOpacity)
                .onReceive(timer) { _ in
                    if displayedText.count < fullText.count {
                        let index = fullText.index(fullText.startIndex, offsetBy: displayedText.count)
                        displayedText.append(fullText[index])
                    }
                }
            
            VStack {
                Spacer()
                NavigationLink(destination: Onboarding6View()) {
                    Image("whitearrow") // Ensure "arrowbo" image is in your assets
                        .resizable()
                        .frame(width: 40, height: 40)
                        .position(x: 710, y: 350) // Adjust position as needed
                }
            }
            
            // Trigger the animation when the view appears
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
struct Gif5View: UIViewRepresentable {
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

struct Onboarding5View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding5View()
    }
}
