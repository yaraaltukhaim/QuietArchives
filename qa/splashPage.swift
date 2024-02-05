//
//  splashPage.swift
//  qa
//
//  Created by silva on 19/07/1445 AH.
//

import SwiftUI
import AVKit 
struct splashPage: View {
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            Image("splash")
            //make it animated
        }
    }
}

#Preview {
    splashPage()
}
