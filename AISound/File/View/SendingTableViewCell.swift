//
//  SendingTableViewCell.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
class SendingTableViewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 8)
        return name
    }()
    
    lazy var selectBtn: UIButton = {
        let select = UIButton(type: .custom)
        select.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        select.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        select.addTarget(self, action: #selector(selectAction), for: .touchUpInside)
        return select
    }()
    
    lazy var separatorLine: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(hexString: "#e2e2e2")
        return sep
    }()
    
    //MARK: - 选中
    @objc func selectAction() {
        selectBtn.isSelected = !selectBtn.isSelected
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-11)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(contentView)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}