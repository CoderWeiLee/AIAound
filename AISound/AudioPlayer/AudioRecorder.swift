//
//  AudioRecorder.swift
//  Hello
//
//  Created by Junjie on 2021/3/30.
//

import Foundation
import Combine
import AVFoundation
import CoreMotion
import KRProgressHUD

class AudioRecorder: NSObject {
    static let sharedRecorder : AudioRecorder = {
       let recorder = AudioRecorder()
       recorder.fetchRecording()
       return recorder
    }()
 
    var audioRecorder: AVAudioRecorder!
    
    var recordings = [Recording]()
    
    var flagRecord = false
    let APP = CMHeadphoneMotionManager()
    
    let writer = CSVWriter()
    var write: Bool = false
    override init() {
        super.init()
        APP.delegate = self
    }
    
    deinit {
        write = false
        writer.close()
        APP.stopDeviceMotionUpdates()
    }
    
    func startRecord() {
        //0.record motion
        guard APP.isDeviceMotionAvailable else {
//            self.Alert("Sorry", "Your device is not supported.")
            KRProgressHUD.showMessage("Sorry, Your device is not supported.")
            return
        }
        APP.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {[weak self] motion, error  in
            guard let motion = motion, error == nil else { return }
                self?.writer.write(motion)
//            self?.printData(motion)
        })
        
        //1.record av
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
    }
    
    func printData(_ data: CMDeviceMotion) {
//        self.textView.text = """
//            Quaternion:
//                x: \(data.attitude.quaternion.x)
//                y: \(data.attitude.quaternion.y)
//                z: \(data.attitude.quaternion.z)
//                w: \(data.attitude.quaternion.w)
//            Attitude:
//                pitch: \(data.attitude.pitch)
//                roll: \(data.attitude.roll)
//                yaw: \(data.attitude.yaw)
//            Gravitational Acceleration:
//                x: \(data.gravity.x)
//                y: \(data.gravity.y)
//                z: \(data.gravity.z)
//            Rotation Rate:
//                x: \(data.rotationRate.x)
//                y: \(data.rotationRate.y)
//                z: \(data.rotationRate.z)
//            Acceleration:
//                x: \(data.userAcceleration.x)
//                y: \(data.userAcceleration.y)
//                z: \(data.userAcceleration.z)
//            """
    }
    
    
    func fetchRecording() {
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
        audioRecorder.stop()
        flagRecord = false
        
        fetchRecording()
    }
    
    
    func deleteRecording(deleteUrls: [URL]) {
        for url in deleteUrls {
            print(url)
            do {
                try FileManager.default.removeItem(at: url)
            } catch let err {
                print("Delete fail: \(err.localizedDescription)")
            }
        }
        
        fetchRecording()
    }

}

extension AudioRecorder: CMHeadphoneMotionManagerDelegate {
    
}

