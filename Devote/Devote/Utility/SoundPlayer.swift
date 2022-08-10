//
//  SoundPlayer.swift
//  Devote
//
//  Created by Jasur Salimov on 8/10/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else{return}
    do{
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    }catch{
        print("Could not find and play the sound file.")
    }
}
