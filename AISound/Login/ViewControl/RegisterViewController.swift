//
//  RegisterViewController.swift
//  RegisterViewController
//
//  Created by 李伟 on 2021/8/8.
//
import UIKit
import JKSwiftExtension
class RegisterViewController: UIViewController {
    lazy var firstNameContainerView: UIView = {
        let firstView = UIView()
        firstView.backgroundColor = .white
        return firstView
    }()
    
    lazy var secondNameContainerView: UIView = {
        let secondView = UIView()
        secondView.backgroundColor = .white
        return secondView
    }()
    
    lazy var thirdNameContainerView: UIView = {
        let thirdView = UIView()
        thirdView.backgroundColor = .white
        return thirdView
    }()
    
    lazy var fourthNameContainerView: UIView = {
        let fourthView = UIView()
        fourthView.backgroundColor = .white
        return fourthView
    }()
    
    lazy var firstNameImgV: UIImageView = {
       let imgV = UIImageView(image: UIImage(systemName: "person"))
       return imgV
    }()
    
    lazy var firstNameTextField: UITextField = {
       let textF = UITextField()
       textF.placeholder = "First Name"
       return textF
    }()
    
    lazy var secondNameImgV: UIImageView = {
       let imgV = UIImageView(image: UIImage(systemName: "person"))
       return imgV
    }()
    
    lazy var secondNameTextField: UITextField = {
       let textF = UITextField()
       textF.placeholder = "Last Name"
       return textF
    }()
    
    lazy var thirdNameImgV: UIImageView = {
       let imgV = UIImageView(image: UIImage(systemName: "envelope"))
       return imgV
    }()
    
    lazy var thirdNameTextField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Email"
        return textF
    }()
    
    lazy var fourthNameImgV: UIImageView = {
       let imgV = UIImageView(image: UIImage(systemName: "lock"))
       return imgV
    }()
    
    lazy var fourthNameTextField: UITextField = {
        let textF = UITextField()
        textF.placeholder = "Password"
        return textF
    }()
    
    lazy var registerBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .black
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(UIColor(hexString: "#ffffff"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(register), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - 注册
    @objc func register() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.0 / 255.0, green: 186.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
        
        view.addSubview(firstNameContainerView)
        firstNameContainerView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(27)
            make.right.equalTo(view).offset(-28)
            make.height.equalTo(60)
            make.top.equalTo(view).offset(topSafeAreaHeight + 167)
        }
        firstNameContainerView.addSubview(firstNameImgV)
        firstNameImgV.snp.makeConstraints { make in
            make.left.equalTo(firstNameContainerView).offset(18)
            make.centerY.equalTo(firstNameContainerView)
            make.width.height.equalTo(18)
        }
        firstNameContainerView.addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
            make.left.equalTo(firstNameImgV.snp_right).offset(14)
            make.top.bottom.right.equalTo(firstNameContainerView)
        }
        
        view.addSubview(secondNameContainerView)
        secondNameContainerView.snp.makeConstraints { make in
            make.left.right.height.equalTo(firstNameContainerView)
            make.top.equalTo(firstNameContainerView.snp_bottom).offset(15)
        }
        secondNameContainerView.addSubview(secondNameImgV)
        secondNameImgV.snp.makeConstraints { make in
            make.left.equalTo(secondNameContainerView).offset(18)
            make.centerY.equalTo(secondNameContainerView)
            make.width.height.equalTo(18)
        }
        secondNameContainerView.addSubview(secondNameTextField)
        secondNameTextField.snp.makeConstraints { make in
            make.left.equalTo(secondNameImgV.snp_right).offset(14)
            make.top.bottom.right.equalTo(secondNameContainerView)
        }
        
        view.addSubview(thirdNameContainerView)
        thirdNameContainerView.snp.makeConstraints { make in
            make.left.right.height.equalTo(secondNameContainerView)
            make.top.equalTo(secondNameContainerView.snp_bottom).offset(15)
        }
        thirdNameContainerView.addSubview(thirdNameImgV)
        thirdNameImgV.snp.makeConstraints { make in
            make.left.equalTo(thirdNameContainerView).offset(18)
            make.centerY.equalTo(thirdNameContainerView)
            make.width.height.equalTo(18)
        }
        thirdNameContainerView.addSubview(thirdNameTextField)
        thirdNameTextField.snp.makeConstraints { make in
            make.left.equalTo(thirdNameImgV.snp_right).offset(14)
            make.top.bottom.right.equalTo(thirdNameContainerView)
        }
        
        view.addSubview(fourthNameContainerView)
        fourthNameContainerView.snp.makeConstraints { make in
            make.left.right.height.equalTo(thirdNameContainerView)
            make.top.equalTo(thirdNameContainerView.snp_bottom).offset(15)
        }
        fourthNameContainerView.addSubview(fourthNameImgV)
        fourthNameImgV.snp.makeConstraints { make in
            make.left.equalTo(fourthNameContainerView).offset(18)
            make.centerY.equalTo(fourthNameContainerView)
            make.width.height.equalTo(18)
        }
        fourthNameContainerView.addSubview(fourthNameTextField)
        fourthNameTextField.snp.makeConstraints { make in
            make.left.equalTo(fourthNameImgV.snp_right).offset(14)
            make.top.bottom.right.equalTo(fourthNameContainerView)
        }
        
        view.addTo(registerBtn)
        registerBtn.snp.makeConstraints { make in
            make.left.right.height.equalTo(fourthNameContainerView)
            make.top.equalTo(fourthNameContainerView.snp_bottom).offset(15)
        }
         
    }


}