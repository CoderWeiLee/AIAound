//
//  AudioRecorder.swift
//  Hello
//
//  Created by Junjie on 2021/3/30.
//

import Foundation
import Combine
import AVFoundation



class AudioRecorder: NSObject {
    static let sharedRecorder : AudioRecorder = {
       let recorder = AudioRecorder()
       recorder.fetchRecording()
       return recorder
    }()
 
    var audioRecorder: AVAudioRecorder!
    
    var recordings = [Recording]()
    
    var flagRecord = false
    
    func startRecord() {
        /*
         Function: start recording
         Parameter:
         Return:
         */
        // set AVAudioSession, this is for hardware
        let avSession:AVAudioSession = AVAudioSession.sharedInstance()
        
        do{
            try avSession.setCategory(.playAndRecord, mode: .default, options: [.allowBluetooth, .allowBluetoothA2DP])
            try avSession.setActive(true)
        }catch let error {
            debugPrint("Couldn't set AVAudioSession: \(error)")
        }
        
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy_HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        let fileURL = filePath.appendingPathComponent("\(dateString).wav")
        
        // print all port
        var num = 0
        print(avSession.currentRoute)
        for input in avSession.availableInputs! {
            print("Hello, Junjie -- \(num)")
            num += 1
            print(input)
        }
        
        // record setting
        let settings = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 12000,
            AVLinearPCMBitDepthKey: 16,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        // record process
        do {
            audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            
            flagRecord = true
        } catch let err{
            print("Record Fail: \(err.localizedDescription)")
        }
    } // End: func-startRecord
    
    
    func fetchRecording() {
        /*
         Function: fetech and list all recordings
         Parameter:
         Return:
         */
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getFileDate(for: audio), fileSize: covertToFileString(with: sizeForLocalFilePath(filePath: audio.path)))
            recordings.append(recording)
        }
        
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
    }

    
    func stopRecord() {
        /*
         Function: stop recording
         Parameter:
         Return:
         */
        audioRecorder.stop()
        flagRecord = false
        
        fetchRecording()
    }
    
    
    func deleteRecording(deleteUrls: [URL]) {
        /*
         Function: delete recording files
         Parameter:
         Return:
         */
        for url in deleteUrls {
            print(url)
            do {
                try FileManager.default.removeItem(at: url)
            } catch let err {
                print("Delete fail: \(err.localizedDescription)")
            }
        }
        
        fetchRecording()
    } //End: func-deleteRecording

}

