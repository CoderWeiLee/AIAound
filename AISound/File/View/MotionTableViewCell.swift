//
//  MotionTableViewCell.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
class MotionTableViewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 14)
        return name
    }()
    
    lazy var separatorLine: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(hexString: "#e2e2e2")
        return sep
    }()
    
    var record: Recording? {
        didSet {
            nameLabel.text = "\(record?.nameTime ?? "") .csv"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(9)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
