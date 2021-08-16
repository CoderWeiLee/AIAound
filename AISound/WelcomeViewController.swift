//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by 李伟 on 2021/8/2.
//

import UIKit
import SnapKit
class WelcomeViewController: UIViewController {
    var titleLabel: UILabel!
    var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.0 / 255.0, green: 186.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
        titleLabel = UILabel()
        titleLabel.text = "S-Eating"
        view.addSubview(titleLabel!)
        titleLabel.snp.makeConstraints({ make in
            make.top.equalTo(view).offset(117)
            make.centerX.equalTo(view)
        })
        registerBtn = UIButton(type: .custom)
        registerBtn.setTitle("Register/Login", for: .normal)
        registerBtn.setTitleColor(UIColor(red: 80.0 / 255.0, green: 80.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0), for: .normal)
        registerBtn.backgroundColor = UIColor(red: 217.0 / 255.0, green: 217.0 / 255.0, blue: 217.0 / 255.0, alpha: 1.0)
        registerBtn.layer.cornerRadius = 9
        registerBtn.layer.masksToBounds = true
        registerBtn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        view.addSubview(registerBtn!)
        registerBtn.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp_bottom).offset(45)
            make.centerX.equalTo(view)
        })
    }


    @objc func registerAction() {
        
    }
}
