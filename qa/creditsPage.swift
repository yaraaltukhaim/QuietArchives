//
//  creditsPage.swift
//  qa
//
//  Created by silva on 19/07/1445 AH.
//

import SwiftUI
import Foundation
struct creditsPage: View {
    private let startAnimationDuration = 2.0
    @State private var animationStart = false
    // comes out from down to up
    
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea() // Ignore just for the color
            
            
            VStack{
//                Text("CREDITS")
//                
//                    .font(Font.custom("KindlyRewind", size: 30)).offset(x: 110, y: 20)
//                    .fontWeight(.bold)
//                    .foregroundColor(.yellow)
//                    .multilineTextAlignment(.center)
//                    .lineSpacing(10)
//                    .padding()//i think i need it on the main titles?
//                    .offset(CGSize(width:-100, height: 10.0))
//                
                VStack{
                    Text("CODE\n"+"ALJAWHARAH AgLMASOUD\n YARA ALTUKHAIM\n MANAL ALJUHANI\n JOOD DAWOOD\n JOOD AREABI\n")
                        .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(10)
                        .offset(CGSize(width:-100, height: 10.0))
                        .frame(width: 750, height: animationStart ? 300 : 0)
                        .animation(Animation.linear(duration: startAnimationDuration))
                    
                        .onAppear() {
                            self.animationStart.toggle()
                        }
                    
                }
                
               
             //
                
                
                
                
            }
            
            
            
            
           
            
                    //.frame(width:750, height: 300)
//                Text("CODE")  .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                    .foregroundColor(.white)
//                
//                Text("""
//ALJAWHARAH ALMASOUD
//YARA ALTUKHAIM
//MANAL ALJUHANI
//JOOD DAWOOD
//JOOD AREABI
//
//""")  .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                    .foregroundColor(.white)
//                
//                
//                    .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
//                    .padding()
//                    .rotation3DEffect(
//                        .degrees(60),
//                        axis: (x: 1, y: 0, z: 0))
//                    .shadow(color: .white, radius: 2, x:0, y:15)
//                    .frame(width: 300, height: animationStart ? 750 : 0)
//                    .animation(Animation.linear(duration: startAnimationDuration))
//                    .onAppear(){
//                        self.animationStart.toggle()
//                    }
//                Text("DESIGN")
//                    .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                Text("""
//ALJAWHARAH ALMASOUD
//YARA ALTUKHAIM
//MANAL ALJUHANI
//JOOD DAWOOD
//JOOD AREABI
//
//""")
//                .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                .foregroundColor(.white)
//                Text("ASSETS")
//                    .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                Text("""
//seliel-the-shaper.itch.io
//littlesmith.itch.io
//penusbmic.itch.io
//ansimuz.itch.io
//""")
//                .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
//                .foregroundColor(.white)
//                
           
        }
    }}

#Preview {
    creditsPage()
}
