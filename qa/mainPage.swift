//
//  mainPage.swift
//  qa
//
//  Created by silva on 19/07/1445 AH.
//

import SwiftUI
import AVFAudio

struct mainPage: View {
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        
        
        ZStack{
            
            
            
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
           
            
            HStack{
                Button(){} label: {
                    Image("gear")
                        
                }}.offset(x: -320, y: -129)
                
                //
                VStack{
                    
                    
                    Image("logo")
                    
                    VStack{
                        Button() {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        } label: {
                            Image("newgame")
                        }
                        
                        Button() {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        } label: {
                            Image("continue")
                        }
                        
                    }
                    
                }
       }
    }
}

#Preview {
    mainPage()
}
