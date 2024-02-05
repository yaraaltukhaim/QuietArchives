//
//  gkjggj.swift
//  qa
//
//  Created by silva on 22/07/1445 AH.
//

import SwiftUI
import AVFoundation

class Sound {

    static var player:AVAudioPlayer?

    static func playaudio(soundfile: String) {

        if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
            print("<<<<<<<<<<<<<<<<<<<<<PATH >>>>>>>>>>>>>>>>>>>>>>>>>",path)
            do{

                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.prepareToPlay()
                player?.play()

            }catch {
                print("<<<<<<<<<<<<<<<<<<<<<Error >>>>>>>>>>>>>>>>>>>>>>>>")
            }
        }
    }
}
struct gkjggj: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    gkjggj()
}
