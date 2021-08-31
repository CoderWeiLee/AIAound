//
//  ModifyViewController.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/31.
//

import Foundation
import UIKit
import KRProgressHUD
class ModifyViewController: UIViewController {
    enum ModifyType: String {
    case Email
    case Password
    }
    var modifyType: ModifyType!
    var oldLabel: UILabel!
    var newLabel: UILabel!
    var confirmLabel: UILabel!
    var oldTextField: UITextField!
    var newTextField: UITextField!
    var confirmTextField: UITextField!
    var cancelBtn: UIButton!
    var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = false
        oldLabel = UILabel()
        oldLabel.textColor = UIColor(white: 1, alpha: 0.7)
        newLabel = UILabel()
        newLabel.textColor = UIColor(white: 1, alpha: 0.7)
        confirmLabel = UILabel()
        confirmLabel.textColor = UIColor(white: 1, alpha: 0.7)
        oldTextField = UITextField()
        oldTextField.textColor = UIColor(white: 1, alpha: 0.7)
        newTextField = UITextField()
        confirmTextField = UITextField()
        cancelBtn = UIButton(type: .custom)
        confirmBtn = UIButton(type: .custom)
        cancelBtn.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        confirmBtn.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        modifyType == .Email ? setEmail() : setPassword()
        view.addSubview(oldLabel)
        oldLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight + 30)
        }
        
        view.addSubview(oldTextField)
        oldTextField.snp.makeConstraints { make in
            make.centerY.equalTo(oldLabel)
            make.right.equalTo(view).offset(-15)
            make.left.equalTo(oldLabel.snp_right).offset(5)
        }
        
        view.addSubview(newLabel)
        newLabel.snp.makeConstraints { make in
            make.left.equalTo(oldLabel)
            make.top.equalTo(oldLabel.snp_bottom).offset(5)
        }
        
        view.addSubview(newTextField)
        newTextField.snp.makeConstraints { make in
            make.centerY.equalTo(newLabel)
            make.right.equalTo(view).offset(-15)
            make.left.equalTo(newLabel.snp_right).offset(5)
        }
        
        view.addSubview(confirmLabel)
        confirmLabel.snp.makeConstraints { make in
            make.left.equalTo(newLabel)
            make.top.equalTo(newLabel.snp_bottom).offset(5)
        }
        
        view.addSubview(confirmTextField)
        confirmTextField.snp.makeConstraints { make in
            make.centerY.equalTo(confirmLabel)
            make.right.equalTo(view).offset(-15)
            make.left.equalTo(confirmLabel.snp_right).offset(5)
        }
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelBtn)
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: confirmBtn)
    }
    
    func setEmail() {
        oldLabel.text = "旧的邮箱账号:"
        newLabel.text = "新的邮箱账号:"
        confirmLabel.text = "再次确认邮箱"
        oldTextField.text = AILoginManager.sharedLoginManager.currentUser?.password
        newTextField.placeholder = "请输入您的邮箱账号"
        confirmTextField.placeholder = "请再次输入您的邮箱账号"
    }
    
    func setPassword() {
        oldLabel.text = "旧的密码:"
        newLabel.text = "新的密码:"
        confirmLabel.text = "再次确认密码"
        oldTextField.text = AILoginManager.sharedLoginManager.currentUser?.password
        let newAttr = NSMutableAttributedString(string: "请输入您的新密码")
        newAttr.addAttribute(.foregroundColor, value: UIColor(white: 1, alpha: 0.7), range: NSMakeRange(0, newAttr.length))
        newTextField.attributedPlaceholder = newAttr
        confirmTextField.placeholder = "请再次输入您的新密码"
    }
    
    func saveEmail(with newValue: String) {
        AILoginManager.sharedLoginManager.currentUser?.email = newValue
        UserDefaults.standard.saveCustomObject(customObject: AILoginManager.sharedLoginManager.currentUser!, key: currentUserKey)
    }
    
    func savePassword(with newValue: String) {
        AILoginManager.sharedLoginManager.currentUser?.password = newValue
        UserDefaults.standard.saveCustomObject(customObject: AILoginManager.sharedLoginManager.currentUser!, key: currentUserKey)
    }
    
    //MARK: - Actions
    @objc func cancel() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func confirm() {
        guard let newContent = newTextField.text,let confirmContent = confirmTextField.text, newContent == confirmContent else  {KRProgressHUD.showMessage("请检查您的输入是否合法")
            return}
        modifyType == .Email ? saveEmail(with: newContent) : savePassword(with: newContent)
    }
    
}
