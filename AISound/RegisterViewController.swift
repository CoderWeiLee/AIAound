//
//  RegisterViewController.swift
//  RegisterViewController
//
//  Created by 李伟 on 2021/8/8.
//
import UIKit
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.0 / 255.0, green: 186.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
        
        view.addSubview(firstNameContainerView)
        firstNameContainerView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(27)
            make.right.equalTo(view).offset(-28)
            make.height.equalTo(60)
        }
        view.addSubview(secondNameContainerView)
        secondNameContainerView.snp.makeConstraints { make in
            
        }
        view.addSubview(thirdNameContainerView)
        thirdNameContainerView.snp.makeConstraints { make in
            
        }
        view.addSubview(fourthNameContainerView)
        fourthNameContainerView.snp.makeConstraints { make in
            
        }
        
         
    }


}
