//
//  settingPage.swift
//  qa
//
//  Created by silva on 19/07/1445 AH.
//

import SwiftUI

struct settingPage: View {
    var body: some View {
      
    
        ZStack{
            
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .shadow(radius:8)
            Image("settings")

            
            Button{} label:{
              Image("close")
            }.offset(x:150, y: -130)
            VStack{
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    
                }.offset(x: -250 , y: -50)
                    .tint(.black)
                
                Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                    
                }
                .offset(x: -250, y: -30 )
                .tint(.black)
               
                
                Text("ENG")
                    .font(Font.custom("KindlyRewind", size: 25)).offset(x: 110, y: 20)
                
                
                
            }.padding()
            
        }
        
        
    }
    
    
    
    //a loop to check if the font in our system
    
    /*
    init()
    {
        for familyName in UIFont.familyNames{
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName){
                print("--\(fontName)")
            }
        }
    }
    */
    
    
}

#Preview {
    settingPage()
}
