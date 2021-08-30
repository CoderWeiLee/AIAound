//
//  SendingTableViewCell.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
protocol SendingTableViewCellDelegate : NSObject {
    func didSelect(at index: IndexPath)
    func didDeselect(at index: IndexPath)
}
class SendingTableViewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .white
        name.font = UIFont.systemFont(ofSize: 14)
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
    
    var record: Recording? {
        didSet {
            nameLabel.text = "\(record?.nameTime ?? "") .wav/csv"
        }
    }
    
    weak var delegate: SendingTableViewCellDelegate?
    
    //MARK: - 选中
    @objc func selectAction() {
        selectBtn.isSelected = !selectBtn.isSelected
        selectBtn.isSelected ? self.delegate?.didSelect(at: (self.record?.indexPath)!) : self.delegate?.didDeselect(at: (self.record?.indexPath)!)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(15)
            make.centerY.equalTo(contentView)
        }
        
        contentView.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-22)
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
