//
//  UploadProgressView.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/31.
//

import Foundation
import UIKit
import KRProgressHUD
class UploadProgressView: UIView {
    lazy var progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .green
        progress.trackTintColor = UIColor(hexString: "#272727")
        progress.progress = 0.0
        return progress
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "minus.circle.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(close), for: .touchUpInside)
        return btn
    }()
    
    lazy var noticeLabel: UILabel = {
       let label = UILabel()
       label.textColor = .white
       label.textAlignment = .center
       label.font = UIFont.systemFont(ofSize: 12)
       label.text = "准备上传中..."
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(progressView)
        self.backgroundColor = UIColor(hexString: "#1fbad2", alpha: 0.8)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        progressView.snp.makeConstraints { make in
            make.left.equalTo(self).offset(19)
            make.bottom.equalTo(self).offset(-15)
            make.right.equalTo(self).offset(-100)
        }
        
        addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-17)
            make.bottom.equalTo(self).offset(-5)
            make.width.height.equalTo(26)
        }
        
        addSubview(noticeLabel)
        noticeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(5)
            make.left.right.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func close() {
        KRProgressHUD.showMessage("上传已取消")
        self.removeFromSuperview()
    }
}
