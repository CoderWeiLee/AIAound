//
//  RecordViewController.swift
//  RecordViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import JKSwiftExtension
import CoreMotion
import AVFAudio
class RecordViewController: UIViewController {
    private lazy var motionManager = CMHeadphoneMotionManager()
    
    lazy var topBgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#a6a6a6")
        return v
    }()
    
    lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#bbbbbb")
        label.text = "00:00"
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    lazy var noticeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#7948ea")
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    lazy var startBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor(hexString: "#2a82e4")
        btn.layer.cornerRadius = 16
        btn.layer.masksToBounds = true
        btn.setTitle("Start", for: .normal)
        btn.setTitle("Stop", for: .selected)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(start), for: .touchUpInside)
        return btn
    }()
    
    lazy var recordView: AudioRecordView = {
        let record = AudioRecordView()
        record.isHidden = true
        return record
    }()
    
    var seconds = 0
    
    lazy var timer: DispatchSourceTimer = {
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: .seconds(1))
                // 设定时间源的触发事件
                timer.setEventHandler(handler: {
                    DispatchQueue.main.async {
                        self.seconds += 1
                        self.recordLabel.text = String(format: "%02d:%02d", arguments: [self.seconds / 60, self.seconds % 60])
                    }
                })
        return timer
    }()
    
    //MARK: - 开始
    @objc func start() {
        startBtn.isSelected = !startBtn.isSelected
        startBtn.isSelected ? startRecords() : stopRecords()
    }
    
    private func startRecords() {
        AudioRecorder.sharedRecorder.startRecord()
        recordView.isHidden = false
        self.timer.resume()
        noticeLabel.text = "Recording..."
    }
    
    private func stopRecords() {
        AudioRecorder.sharedRecorder.stopRecord()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNewAudioNotificationName), object: nil)
        recordView.isHidden = true
        timer.suspend()
        recordLabel.text = "00:00"
        noticeLabel.text = "Saved"
        seconds = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noticeLabel.text = "Motion Available: \(motionManager.isDeviceMotionAvailable)"
        motionManager.delegate = self
        view.backgroundColor = .black
        view.addSubview(topBgView)
        topBgView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(17)
            make.right.equalTo(view).offset(-18)
            make.top.equalTo(view).offset(topSafeAreaHeight + 56)
            make.height.equalTo(170)
        }
        
        topBgView.addSubview(recordView)
        recordView.snp.makeConstraints { make in
            make.bottom.equalTo(topBgView).offset(-13)
            make.centerX.equalTo(topBgView)
            make.width.equalTo(100)
            make.height.equalTo(80)
        }
        
        topBgView.addSubview(recordLabel)
        recordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(topBgView)
            make.top.equalTo(topBgView).offset(15)
        }
        
        view.addSubview(noticeLabel)
        noticeLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(9)
            make.right.equalTo(view).offset(-9)
            make.top.equalTo(topBgView.snp_bottom).offset(30)
            make.height.equalTo(65)
        }
        
        view.addSubview(startBtn)
        startBtn.snp.makeConstraints { make in
            make.width.equalTo(115)
            make.height.equalTo(62)
            make.centerX.equalTo(view)
            make.top.equalTo(noticeLabel.snp_bottom).offset(42)
        }
        
        noticeLabel.text = "Searching Airpods..."
    }


}

extension RecordViewController: CMHeadphoneMotionManagerDelegate {
    func headphoneMotionManagerDidConnect(_ manager: CMHeadphoneMotionManager) {
        var outputName = ""
        let outputs = AVAudioSession.sharedInstance().currentRoute.outputs
        for desc in outputs {
            if desc.portName.contains("AirPods") {
                outputName = desc.portName
            }
        }
        //耳机连接时调用
        noticeLabel.text = "Warning: Please wear \(outputName).\n / \(outputName) is ready."
    }
    
    func headphoneMotionManagerDidDisconnect(_ manager: CMHeadphoneMotionManager) {
        //耳机断开连接时调用
        noticeLabel.text = "Motion Manager Did Disconnect"
    }
}
