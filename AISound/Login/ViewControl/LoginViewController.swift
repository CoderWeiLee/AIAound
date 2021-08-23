//
//  LoginViewController.swift
//  LoginViewController
//
//  Created by 李伟 on 2021/8/8.
//
import UIKit
import KRProgressHUD
class LoginViewController: UIViewController {
    lazy var contentView: UIView = {
        let content = UIView()
        content.backgroundColor = UIColor(hexString: "#121212")
        content.layer.cornerRadius = 3
        content.layer.masksToBounds = true
        return content
    }()
    
    lazy var loginTitleLabel: UILabel = {
       let login = UILabel()
       login.text = "LOGIN"
       login.font = UIFont.systemFont(ofSize: 14)
       login.textColor = .white
       return login
    }()
    
    lazy var emailContentView: UIView = {
       let email = UIView()
       email.backgroundColor = UIColor(hexString: "#121212")
       email.layer.cornerRadius = 20
       email.layer.masksToBounds = true
       email.layer.borderWidth = 1
       email.layer.borderColor = UIColor(hexString: "#313131")?.cgColor
       return email
    }()
    
    lazy var emailTextField: UITextField = {
        let textF = UITextField()
        let attrStr = NSMutableAttributedString(string: "Email Address")
        attrStr.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.hexStringColor(hexString: "#bababa"), range: NSMakeRange(0, attrStr.length))
        textF.attributedPlaceholder(attrStr)
        textF.textColor = UIColor.hexStringColor(hexString: "#bababa")
        return textF
    }()
    
    lazy var pwdContentView: UIView = {
       let pwd = UIView()
       pwd.backgroundColor = UIColor(hexString: "#121212")
       pwd.layer.cornerRadius = 20
       pwd.layer.masksToBounds = true
       pwd.layer.borderWidth = 1
       pwd.layer.borderColor = UIColor(hexString: "#313131")?.cgColor
       return pwd
    }()
    
    lazy var passwordTextField: UITextField = {
        let textF = UITextField()
        let attrStr = NSMutableAttributedString(string: "Password")
        attrStr.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.hexStringColor(hexString: "#bababa"), range: NSMakeRange(0, attrStr.length))
        textF.attributedPlaceholder(attrStr)
        textF.textColor = UIColor.hexStringColor(hexString: "#bababa")
        return textF
    }()
    
    lazy var loginBtn: UIButton = {
        let login = UIButton(type: .custom)
        login.backgroundColor = .black
        login.setTitle("LOGIN ", for: .normal)
        login.setTitleColor(.white, for: .normal)
        login.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        login.layer.cornerRadius = 3
        login.layer.masksToBounds = true
        login.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return login
    }()
    
    lazy var forgetBtn: UIButton = {
        let forget = UIButton(type: .custom)
        forget.backgroundColor = .clear
        forget.setTitle("FORGOT PASSWORD ", for: .normal)
        forget.setTitleColor(.white, for: .normal)
        forget.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        forget.addTarget(self, action: #selector(forgetAction), for: .touchUpInside)
        return forget
    }()
    
    //MARK: - login
    @objc func loginAction() {
        if emailTextField.text == "" {
            KRProgressHUD.showMessage("Please enter your email")
            return
        }
        if passwordTextField.text == "" {
            KRProgressHUD.showMessage("Please enter your password")
            return
        }
        if AILoginManager.sharedLoginManager.currentUser?.email == emailTextField.text && AILoginManager.sharedLoginManager.currentUser?.password == passwordTextField.text {
            KRProgressHUD.showMessage("Login Success!")
            AILoginManager.sharedLoginManager.login = true
            defaults.setValue(true, forKey: loginKey)
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let nav = UINavigationController(rootViewController: AITabbarController())
            nav.navigationBar.isHidden = true
            window?.rootViewController = nav
        }else {
            KRProgressHUD.showMessage("Please check your email or password")
        }
    }
    
    @objc func forgetAction() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.0 / 255.0, green: 186.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.equalTo(290)
            make.height.equalTo(330)
        }
        
        contentView.addSubview(loginTitleLabel)
        loginTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(47)
            make.centerX.equalTo(contentView)
        }
        
        contentView.addSubview(emailContentView)
        emailContentView.snp.makeConstraints { make in
            make.top.equalTo(loginTitleLabel.snp_bottom).offset(17)
            make.centerX.equalTo(contentView)
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
        emailContentView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.left.equalTo(emailContentView).offset(15)
            make.top.right.bottom.equalTo(emailContentView)
        }
        
        contentView.addSubview(pwdContentView)
        pwdContentView.snp.makeConstraints { make in
            make.top.equalTo(emailContentView.snp_bottom).offset(25)
            make.centerX.equalTo(contentView)
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
        pwdContentView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalTo(pwdContentView).offset(15)
            make.top.right.bottom.equalTo(pwdContentView)
        }
        
        contentView.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(pwdContentView.snp_bottom).offset(33)
            make.centerX.equalTo(contentView)
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
        view.addSubview(forgetBtn)
        forgetBtn.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp_bottom).offset(30)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
    }


}
