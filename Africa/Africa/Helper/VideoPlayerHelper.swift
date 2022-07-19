//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Jasur Salimov on 7/19/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?


func playVideo(fileName: String, fileFormat: String) -> AVPlayer{
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat){
        videoPlayer = AVPlayer(url: url)
        videoPlayer!.play()
    }
    return videoPlayer!
}
