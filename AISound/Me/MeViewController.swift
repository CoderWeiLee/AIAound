//
//  MeViewController.swift
//  MeViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
class MeViewController: UIViewController {
    lazy var topContainerView: UIView = {
        let top = UIView()
        top.backgroundColor = UIColor(red: 233.0 / 255.0, green: 228.0 / 255.0, blue: 217.0 / 255.0, alpha: 0.1)
        return top
    }()
    
    lazy var iconImageView: UIImageView = {
       let icon = UIImageView(image: UIImage(named: "gtl"))
       icon.layer.cornerRadius = 40
       icon.layer.masksToBounds = true
       icon.contentMode = .scaleAspectFit
       return icon
    }()
    
    lazy var nameLabel: UILabel = {
       let name = UILabel()
       name.textColor = UIColor(white: 1, alpha: 0.85)
       name.font = UIFont.systemFont(ofSize: 15)
       return name
    }()
    
    lazy var idLabel: UILabel = {
       let idL = UILabel()
        idL.textColor = UIColor(white: 1, alpha: 0.7)
       idL.font = UIFont.systemFont(ofSize: 13)
       idL.text = "ID:000000001"
       return idL
    }()
    
    lazy var arrowBtn: UIButton = {
        let arrow = UIButton(type: .custom)
        arrow.setImage(UIImage(named: "向右切换"), for: .normal)
        arrow.addTarget(self, action: #selector(arrowAction), for: .touchUpInside)
        return arrow
    }()
    
    lazy var daysContainerView: UIView = {
        let days = UIView()
        return days
    }()
    
    lazy var daysTopLabel: UILabel = {
        let top = UILabel()
        top.textColor = UIColor(hexString: "#2a82e4")
        top.font = UIFont.systemFont(ofSize: 20)
        top.text = "1"
        return top
    }()
    
    lazy var daysBottomLabel: UILabel = {
        let bottom = UILabel()
        bottom.textColor = UIColor(hexString: "#2a82e4")
        bottom.font = UIFont.systemFont(ofSize: 14)
        bottom.text = "Days"
        return bottom
    }()
    
    lazy var timesContainerView: UIView = {
        let times = UIView()
        return times
    }()
    
    lazy var timesTopLabel: UILabel = {
        let top = UILabel()
        top.textColor = UIColor(hexString: "#2a82e4")
        top.font = UIFont.systemFont(ofSize: 20)
        top.text = "\(Int(arc4random_uniform(100)))"
        return top
    }()
    
    lazy var timesBottomLabel: UILabel = {
        let bottom = UILabel()
        bottom.textColor = UIColor(hexString: "#2a82e4")
        bottom.font = UIFont.systemFont(ofSize: 14)
        bottom.text = "Times"
        return bottom
    }()
    
    lazy var emailContainerView: UIView = {
       let email = UIView()
       return email
    }()
    
    lazy var emailImgV: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "envelope")
        return img
    }()
    
    lazy var emailLabel: UILabel = {
       let email = UILabel()
       email.text = "Email"
       email.textColor = UIColor(hexString: "#848484")
       email.font = UIFont.systemFont(ofSize: 14)
       return email
    }()
    
    lazy var emailArrow: UIImageView = {
       let arrow = UIImageView(image: UIImage(named: "向右切换"))
       return arrow
    }()
    
    lazy var emailBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(emailAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var emailLine: UIView = {
       let line = UIView()
       line.backgroundColor = UIColor(hexString: "#dddddd")
       return line
    }()
    
    lazy var pwdContainerView: UIView = {
       let pwd = UIView()
       return pwd
    }()
    
    lazy var pwdImgV: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "lock")
        return img
    }()
    
    lazy var pwdLabel: UILabel = {
       let pwd = UILabel()
        pwd.text = "Password"
        pwd.textColor = UIColor(hexString: "#848484")
        pwd.font = UIFont.systemFont(ofSize: 14)
       return pwd
    }()
    
    lazy var pwdArrow: UIImageView = {
       let arrow = UIImageView(image: UIImage(named: "向右切换"))
       return arrow
    }()
    
    lazy var pwdBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(pwdAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var pwdLine: UIView = {
       let line = UIView()
       line.backgroundColor = UIColor(hexString: "#dddddd")
       return line
    }()
    
    lazy var logoutContainerView: UIView = {
       let logout = UIView()
       return logout
    }()
    
    lazy var logoutImgV: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "lock.slash")
        return img
    }()
    
    lazy var logoutLabel: UILabel = {
       let pwd = UILabel()
        pwd.text = "Logout"
        pwd.textColor = UIColor(hexString: "#848484")
        pwd.font = UIFont.systemFont(ofSize: 14)
       return pwd
    }()
    
    lazy var logoutArrow: UIImageView = {
       let arrow = UIImageView(image: UIImage(named: "向右切换"))
       return arrow
    }()
    
    lazy var logoutBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var logoutLine: UIView = {
       let line = UIView()
       line.backgroundColor = UIColor(hexString: "#dddddd")
       return line
    }()
    
    lazy var verticalLine: UIView = {
       let line = UIView()
       line.backgroundColor = UIColor(white: 1, alpha: 0.2)
       return line
    }()
    
    
    
    //MARK: - Actions
    @objc func arrowAction() {
        
    }
    
    @objc func emailAction() {
        let vc = ModifyViewController()
        vc.modifyType = .Email
        navigationController?.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func pwdAction() {
        let vc = ModifyViewController()
        vc.modifyType = .Password
        navigationController?.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logoutAction() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "\(AILoginManager.sharedLoginManager.currentUser?.firstName ?? "")\(AILoginManager.sharedLoginManager.currentUser?.lastName ?? "")"
        view.backgroundColor = .black
        view.addSubview(topContainerView)
        topContainerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight)
            make.height.equalTo(179)
        }
        
        topContainerView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(topContainerView).offset(5)
            make.top.equalTo(topContainerView).offset(20)
            make.width.height.equalTo(80)
        }
        
        topContainerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp_right).offset(5)
            make.top.equalTo(iconImageView).offset(15)
            make.right.equalTo(topContainerView)
            make.height.equalTo(14)
        }
        
        topContainerView.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp_bottom).offset(5)
        }
        
        topContainerView.addSubview(arrowBtn)
        arrowBtn.snp.makeConstraints { make in
            make.right.equalTo(topContainerView).offset(-20)
            make.centerY.equalTo(topContainerView)
        }
        
        topContainerView.addSubview(daysContainerView)
        daysContainerView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(15)
            make.left.bottom.equalTo(topContainerView)
            make.width.equalTo(topContainerView).multipliedBy(0.5)
        }
        
        topContainerView.addSubview(timesContainerView)
        timesContainerView.snp.makeConstraints { make in
            make.right.bottom.equalTo(topContainerView)
            make.top.width.equalTo(daysContainerView)
        }
        
        daysContainerView.addSubview(daysTopLabel)
        daysTopLabel.snp.makeConstraints { make in
            make.centerX.equalTo(daysContainerView)
            make.top.equalTo(daysContainerView).offset(5)
        }
        
        daysContainerView.addSubview(daysBottomLabel)
        daysBottomLabel.snp.makeConstraints { make in
            make.centerX.equalTo(daysContainerView)
            make.top.equalTo(daysTopLabel.snp_bottom).offset(5)
        }
        
        daysContainerView.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.right.equalTo(daysContainerView)
            make.centerY.equalTo(daysContainerView)
            make.height.equalTo(40)
            make.width.equalTo(0.5)
        }
        
        timesContainerView.addSubview(timesTopLabel)
        timesTopLabel.snp.makeConstraints { make in
            make.centerX.equalTo(timesContainerView)
            make.top.equalTo(timesContainerView).offset(5)
        }
        
        timesContainerView.addSubview(timesBottomLabel)
        timesBottomLabel.snp.makeConstraints { make in
            make.centerX.equalTo(timesContainerView)
            make.top.equalTo(timesTopLabel.snp_bottom).offset(5)
        }
        
        view.addSubview(emailContainerView)
        emailContainerView.snp.makeConstraints { make in
            make.top.equalTo(topContainerView.snp_bottom).offset(30)
            make.left.right.equalTo(view)
            make.height.equalTo(44)
        }
        
        emailContainerView.addSubview(emailImgV)
        emailImgV.snp.makeConstraints { make in
            make.left.equalTo(emailContainerView).offset(15)
            make.centerY.equalTo(emailContainerView)
        }
        
        emailContainerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(emailImgV.snp_right).offset(10)
            make.centerY.equalTo(emailContainerView)
        }
        
        emailContainerView.addSubview(emailArrow)
        emailArrow.snp.makeConstraints { make in
            make.right.equalTo(emailContainerView).offset(-20)
            make.centerY.equalTo(emailContainerView)
        }
        
        emailContainerView.addSubview(emailBtn)
        emailBtn.snp.makeConstraints { make in
            make.edges.equalTo(emailContainerView)
        }
        
        emailContainerView.addSubview(emailLine)
        emailLine.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(emailContainerView)
            make.height.equalTo(0.5)
        }
        
        view.addSubview(pwdContainerView)
        pwdContainerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(emailContainerView.snp_bottom)
            make.height.equalTo(emailContainerView)
        }
        
        pwdContainerView.addSubview(pwdImgV)
        pwdImgV.snp.makeConstraints { make in
            make.left.equalTo(pwdContainerView).offset(15)
            make.centerY.equalTo(pwdContainerView)
        }
        
        pwdContainerView.addSubview(pwdLabel)
        pwdLabel.snp.makeConstraints { make in
            make.left.equalTo(pwdImgV.snp_right).offset(10)
            make.centerY.equalTo(pwdContainerView)
        }
        
        pwdContainerView.addSubview(pwdArrow)
        pwdArrow.snp.makeConstraints { make in
            make.right.equalTo(pwdContainerView).offset(-20)
            make.centerY.equalTo(pwdContainerView)
        }
        
        pwdContainerView.addSubview(pwdBtn)
        pwdBtn.snp.makeConstraints { make in
            make.edges.equalTo(pwdContainerView)
        }
        
        pwdContainerView.addSubview(pwdLine)
        pwdLine.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(pwdContainerView)
            make.height.equalTo(0.5)
        }
        
        view.addSubview(logoutContainerView)
        logoutContainerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(pwdContainerView.snp_bottom)
            make.height.equalTo(emailContainerView)
        }
        
        logoutContainerView.addSubview(logoutImgV)
        logoutImgV.snp.makeConstraints { make in
            make.left.equalTo(logoutContainerView).offset(15)
            make.centerY.equalTo(logoutContainerView)
        }
        
        logoutContainerView.addSubview(logoutLabel)
        logoutLabel.snp.makeConstraints { make in
            make.left.equalTo(logoutImgV.snp_right).offset(10)
            make.centerY.equalTo(logoutContainerView)
        }
        
        logoutContainerView.addSubview(logoutArrow)
        logoutArrow.snp.makeConstraints { make in
            make.right.equalTo(logoutContainerView).offset(-20)
            make.centerY.equalTo(logoutContainerView)
        }
        
        logoutContainerView.addSubview(logoutBtn)
        logoutBtn.snp.makeConstraints { make in
            make.edges.equalTo(logoutContainerView)
        }
        
        logoutContainerView.addSubview(logoutLine)
        logoutLine.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(logoutContainerView)
            make.height.equalTo(0.5)
        }
    }


}
