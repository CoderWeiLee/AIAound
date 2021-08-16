//
//  RecordViewController.swift
//  RecordViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import JKSwiftExtension
class RecordViewController: UIViewController {
    lazy var topBgView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "#a6a6a6")
        return v
    }()
    
    lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#505050")
        label.text = "00:00"
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topBgView)
        topBgView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(17)
            make.right.equalTo(view).offset(-18)
            make.top.equalTo(view).offset(topSafeAreaHeight + 56)
            make.height.equalTo(170)
        }
        
        topBgView.addSubview(recordLabel)
        recordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(topBgView)
            make.top.equalTo(topBgView).offset(30)
        }
    }


}
