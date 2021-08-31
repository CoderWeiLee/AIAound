//
//  SendingViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
import JXSegmentedView
import KRProgressHUD
class SendingViewController: UIViewController {
    var tableView: UITableView!
    lazy var uploadBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "upload"), for: .normal)
        btn.tintColor = UIColor(hexString: "#4350AF")
        btn.addTarget(self, action: #selector(upload), for: .touchUpInside)
        return btn
    }()
    
    lazy var uploadProgress: UploadProgressView = {
        let progress = UploadProgressView()
        return progress
    }()
    
    var selected = [Recording]()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SendingTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(SendingTableViewCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
        
        view.addSubview(uploadBtn)
        uploadBtn.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.left.equalTo(view).offset(13)
            make.bottom.equalTo(view).offset(-146)
        }
        
        view.addSubview(uploadProgress)
        uploadProgress.isHidden = true
        uploadProgress.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.bottom.equalTo(view).offset(-80)
            make.height.equalTo(60)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(newAudio), name: NSNotification.Name(kNewAudioNotificationName), object: nil)
        DataSender.sharedSender.update =  { [weak self] (fileName, prog) in
            self?.uploadProgress.noticeLabel.text = "正在上传\(fileName)"
            self?.uploadProgress.progressView.progress = prog
            print("正在上传\(fileName)","进度\(prog)")
        }
        DataSender.sharedSender.complete = {
            print("上传完成")
            KRProgressHUD.showMessage("上传完成")
            self.uploadProgress.removeFromSuperview()
        }
    }
    
    @objc func newAudio() {
        tableView.reloadData()
    }
    
    @objc func upload() {
        uploadProgress.isHidden = false
        for record in selected {
            DataSender.sharedSender.sendAudio(filePath: record.fileURL)
        }
    }
}

extension SendingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AudioRecorder.sharedRecorder.recordings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SendingTableViewCell.self), for: indexPath) as! SendingTableViewCell
        var record = AudioRecorder.sharedRecorder.recordings[indexPath.row]
        record.indexPath = indexPath
        cell.record = record
        cell.delegate = self
        return cell
    }
}

extension SendingViewController: SendingTableViewCellDelegate {
    func didSelect(at index: IndexPath) {
        selected.append(AudioRecorder.sharedRecorder.recordings[index.row])
    }
    
    func didDeselect(at index: IndexPath) {
        selected.remove(at: index.row)
    }
}

extension SendingViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
}
