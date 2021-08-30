//
//  AudioPlayer.swift
//  JRecor
//
//  Created by Junjie on 2021/4/6.
//

import Foundation
import Combine
import AVFoundation
import UIKit



class AudioPlayer: NSObject, AVAudioPlayerDelegate {
    static let sharedPlayer : AudioPlayer = {
       let player = AudioPlayer()
       return player
    }()
    var audioPlayer: AVAudioPlayer!
    
    var flagPlay = false
    
    
    func startPlay(audio: URL) {
        let playSession = AVAudioSession.sharedInstance()
        
        do {
            try playSession.setCategory(.playback, mode: .default, options: [.allowBluetooth, .allowBluetoothA2DP])
            try playSession.setActive(true)
            try playSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Play override failed")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
            flagPlay = true
        } catch {
            print("Play failed")
        }
    }
    
    
    func stopPlay() {
        audioPlayer.stop()
        flagPlay = false
    }

}
