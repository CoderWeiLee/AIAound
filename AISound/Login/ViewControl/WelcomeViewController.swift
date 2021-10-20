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
        titleLabel.font = UIFont.italicSystemFont(ofSize: 29)
        titleLabel.textColor = .white
        view.addSubview(titleLabel!)
        titleLabel.snp.makeConstraints({ make in
            make.top.equalTo(view).offset(250 * UIScreen.main.bounds.size.height / 734 + topSafeAreaHeight + statusBarHeight)
            make.centerX.equalTo(view)
        })
        registerBtn = UIButton(type: .custom)
        registerBtn.setTitle("Register/Login", for: .normal)
        registerBtn.setTitleColor(UIColor(hexString: "#505050"), for: .normal)
        registerBtn.backgroundColor = UIColor(hexString: "#DAD9D9")
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        registerBtn.layer.cornerRadius = 19
        registerBtn.layer.masksToBounds = true
        registerBtn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        view.addSubview(registerBtn!)
        registerBtn.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp_bottom).offset(45)
            make.width.equalTo(224)
            make.height.equalTo(42)
            make.centerX.equalTo(view)
        })
    }


    @objc func registerAction() {
        let registerVc = RegisterViewController()
        navigationController?.pushViewController(registerVc, animated: true)
    }
}
