//
//  FileTableViewCell.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
class FileTableViewCell: UITableViewCell {
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = UIColor(hexString: "#a59d8a")
        name.font = UIFont.systemFont(ofSize: 8)
        return name
    }()
    
    lazy var durationLabel: UILabel = {
        let duration = UILabel()
        duration.textColor = UIColor(hexString: "#a59d8a")
        duration.font = UIFont.systemFont(ofSize: 7)
        return duration
    }()
    
    lazy var playBtn: UIButton = {
        let play = UIButton(type: .custom)
        play.setImage(UIImage(systemName: "play"), for: .normal)
        play.setTitle("Play", for: .normal)
        play.setTitleColor(UIColor(hexString: "#ff691a"), for: .normal)
        play.titleLabel?.font = UIFont.systemFont(ofSize: 5)
        play.backgroundColor = UIColor(hexString: "#e5e5e5")
        play.layer.cornerRadius = 7
        play.layer.masksToBounds = true
        play.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        return play
    }()
    
    lazy var separatorLine: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(hexString: "#cec2a8")
        return sep
    }()
    
    var record: Recording? {
        didSet {
            nameLabel.text = record?.nameTime ?? "" + ".wav"
            durationLabel.text = "\(record?.detailTime ?? "")" + " " + "\(record?.fileSize ?? "0MB")"
        }
    }
    
    //MARK: - 播放
    @objc func playAudio() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(5)
            make.top.equalTo(contentView).offset(8)
        }
        
        contentView.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(5)
            make.bottom.equalTo(contentView.snp_bottom).offset(-3)
        }
        
        contentView.addSubview(playBtn)
        playBtn.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.right.equalTo(contentView).offset(-8)
            make.width.equalTo(34)
            make.height.equalTo(14)
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
