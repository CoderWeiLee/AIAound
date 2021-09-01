//
//  FeedbackViewController.swift
//  FeedbackViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import RSKPlaceholderTextView
import KRProgressHUD
class FeedbackViewController: UIViewController {
    lazy var noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "请在下方描述您的问题:"
        label.textColor = UIColor(white: 1, alpha: 0.7)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var textView: RSKPlaceholderTextView = {
        let tV = RSKPlaceholderTextView()
        let attr = NSMutableAttributedString(string: "请输入您的问题:")
        attr.addAttribute(.foregroundColor, value: UIColor(white: 1, alpha: 0.8), range: NSMakeRange(0, attr.length))
        attr.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, attr.length))
        tV.attributedPlaceholder = attr
        tV.backgroundColor = .black
        tV.textColor = UIColor(white: 1, alpha: 0.8)
        tV.font = UIFont.systemFont(ofSize: 14)
        tV.layer.borderColor = UIColor(white: 1, alpha: 0.8).cgColor
        tV.layer.borderWidth = 0.5
        tV.layer.cornerRadius = 10
        tV.layer.masksToBounds = true
        return tV
    }()
    
    lazy var submitBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("提交", for: .normal)
        btn.setTitleColor(UIColor(white: 1, alpha: 0.7), for: .normal)
        btn.backgroundColor = UIColor(hexString: "#2a82e4")
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(noticeLabel)
        noticeLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(16)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 30)
        }
        
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(noticeLabel.snp_bottom).offset(15)
            make.bottom.equalTo(view).offset(-200)
        }
        
        view.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(44)
            make.top.equalTo(textView.snp_bottom).offset(30)
            make.centerX.equalTo(view)
        }
        
    }
    
    @objc func submit() {
        textView.text = ""
        KRProgressHUD.showMessage("您的问题已经提交成功！")
    }


}
