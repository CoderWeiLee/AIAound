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
        oldTextField.font = UIFont.systemFont(ofSize: 13)
        oldTextField.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        oldTextField.layer.cornerRadius = 10
        oldTextField.layer.masksToBounds = true
        oldTextField.layer.borderWidth = 0.5
        oldTextField.textColor = UIColor(white: 1, alpha: 0.7)
        newTextField = UITextField()
        newTextField.font = UIFont.systemFont(ofSize: 13)
        newTextField.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        newTextField.layer.cornerRadius = 10
        newTextField.layer.masksToBounds = true
        newTextField.layer.borderWidth = 0.5
        confirmTextField = UITextField()
        confirmTextField.font = UIFont.systemFont(ofSize: 13)
        confirmTextField.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        confirmTextField.layer.cornerRadius = 10
        confirmTextField.layer.masksToBounds = true
        confirmTextField.layer.borderWidth = 0.5
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
            make.height.equalTo(30)
        }
        
        view.addSubview(newLabel)
        newLabel.snp.makeConstraints { make in
            make.left.equalTo(oldLabel)
            make.top.equalTo(oldLabel.snp_bottom).offset(40)
            make.width.equalTo(oldLabel)
        }
        
        view.addSubview(newTextField)
        newTextField.snp.makeConstraints { make in
            make.centerY.equalTo(newLabel)
            make.right.equalTo(view).offset(-15)
            make.left.equalTo(newLabel.snp_right).offset(5)
            make.height.equalTo(30)
        }
        
        view.addSubview(confirmLabel)
        confirmLabel.snp.makeConstraints { make in
            make.left.equalTo(newLabel)
            make.top.equalTo(newLabel.snp_bottom).offset(40)
            make.width.equalTo(oldLabel)
        }
        
        view.addSubview(confirmTextField)
        confirmTextField.snp.makeConstraints { make in
            make.centerY.equalTo(confirmLabel)
            make.right.equalTo(view).offset(-15)
            make.left.equalTo(confirmLabel.snp_right).offset(5)
            make.height.equalTo(30)
        }
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelBtn)
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: confirmBtn)
    }
    
    func setEmail() {
        oldLabel.text = "旧的邮箱账号:"
        newLabel.text = "新的邮箱账号:"
        confirmLabel.text = "再次确认邮箱:"
        oldTextField.text = AILoginManager.sharedLoginManager.currentUser?.email
        let newAttr = NSMutableAttributedString(string: "请输入您的邮箱账号")
        newAttr.addAttribute(.foregroundColor, value: UIColor(white: 1, alpha: 0.7), range: NSMakeRange(0, newAttr.length))
        newAttr.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, newAttr.length))
        newTextField.attributedPlaceholder = newAttr
        let confirmAttr = NSMutableAttributedString(string: "请再次输入您的邮箱账号")
        confirmAttr.addAttribute(.foregroundColor, value: UIColor(white: 1, alpha: 0.7), range: NSMakeRange(0, confirmAttr.length))
        confirmAttr.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, newAttr.length))
        confirmTextField.attributedPlaceholder = confirmAttr
    }
    
    func setPassword() {
        oldLabel.text = "旧的密码:"
        newLabel.text = "新的密码:"
        confirmLabel.text = "再次确认:"
        oldTextField.text = AILoginManager.sharedLoginManager.currentUser?.password
        let newAttr = NSMutableAttributedString(string: "请输入您的新密码")
        newAttr.addAttribute(.foregroundColor, value: UIColor(white: 1, alpha: 0.7), range: NSMakeRange(0, newAttr.length))
        newAttr.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, newAttr.length))
        newTextField.attributedPlaceholder = newAttr
        let confirmAttr = NSMutableAttributedString(string: "请再次输入您的新密码")
        confirmAttr.addAttribute(.foregroundColor, value: UIColor(white: 1, alpha: 0.7), range: NSMakeRange(0, confirmAttr.length))
        confirmAttr.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, newAttr.length))
        confirmTextField.attributedPlaceholder = confirmAttr
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
