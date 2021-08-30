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
        name.textColor = UIColor(white: 1, alpha: 0.9)
        name.font = UIFont.systemFont(ofSize: 14)
        return name
    }()
    
    lazy var durationLabel: UILabel = {
        let duration = UILabel()
        duration.textColor = UIColor(white: 1, alpha: 0.9)
        duration.font = UIFont.systemFont(ofSize: 12)
        return duration
    }()
    
    lazy var playBtn: UIButton = {
        let play = UIButton(type: .custom)
        play.setImage(UIImage(named: "片段-播放"), for: .normal)
        play.setImage(UIImage(named: "片段-暂停"), for: .selected)
        play.setTitle("Play", for: .normal)
        play.setTitle("Stop", for: .selected)
        play.setTitleColor(UIColor(white: 0.9, alpha: 1), for: .normal)
        play.setTitleColor(UIColor(white: 0.9, alpha: 1), for: .selected)
        play.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        play.backgroundColor = UIColor(hexString: "#2e2e2e")
        play.layer.cornerRadius = 14
        play.layer.masksToBounds = true
        play.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        play.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return play
    }()
    
    lazy var separatorLine: UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(white: 1, alpha: 0.9)
        return sep
    }()
    
    var record: Recording? {
        didSet {
            nameLabel.text = "\(record?.nameTime ?? "") .wav"
            durationLabel.text = "\(record?.detailTime ?? "")" + " " + "\(record?.fileSize ?? "0MB")"
        }
    }
    
    //MARK: - 播放
    @objc func playAudio() {
        playBtn.isSelected = !playBtn.isSelected
        playBtn.isSelected ? play() : stop()
    }
    
    private func play() {
        AudioPlayer.sharedPlayer.startPlay(audio: record!.fileURL)
    }
    
    private func stop() {
        AudioPlayer.sharedPlayer.stopPlay()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(5)
            make.top.equalTo(contentView).offset(15)
        }
        
        contentView.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(5)
            make.bottom.equalTo(contentView.snp_bottom).offset(-10)
        }
        
        contentView.addSubview(playBtn)
        playBtn.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-17)
            make.width.equalTo(68)
            make.height.equalTo(28)
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
