//
//  RecordViewController.swift
//  RecordViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import JKSwiftExtension
class RecordViewController: UIViewController {
    lazy var topBgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#a6a6a6")
        return v
    }()
    
    lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#505050")
        label.text = "00:00"
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    lazy var noticeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#7948ea")
        label.font = UIFont.systemFont(ofSize: 9)
        return label
    }()
    
    lazy var startBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor(hexString: "#2a82e4")
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.setTitle("Start", for: .normal)
        btn.setTitle("Stop", for: .selected)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(start), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - 开始
    @objc func start() {
        startBtn.isSelected = !startBtn.isSelected
        startBtn.isSelected ? AudioRecorder.sharedRecorder.startRecord() : AudioRecorder.sharedRecorder.stopRecord()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(topBgView)
        topBgView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(17)
            make.right.equalTo(view).offset(-18)
            make.top.equalTo(view).offset(topSafeAreaHeight + 56)
            make.height.equalTo(170)
        }
        
        topBgView.addSubview(recordLabel)
        recordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(topBgView)
            make.top.equalTo(topBgView).offset(30)
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
            make.width.equalTo(58)
            make.height.equalTo(31)
            make.centerX.equalTo(view)
            make.top.equalTo(noticeLabel.snp_bottom).offset(42)
        }
    }


}
