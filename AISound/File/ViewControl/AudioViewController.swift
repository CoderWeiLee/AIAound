//
//  AudioViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
import JXSegmentedView
class AudioViewController: UIViewController {
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(FileTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(FileTableViewCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(newAudio), name: NSNotification.Name(kNewAudioNotificationName), object: nil)
    }
    
    @objc func newAudio() {
        tableView.reloadData()
    }
}

extension AudioViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AudioRecorder.sharedRecorder.recordings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(FileTableViewCell.self), for: indexPath) as! FileTableViewCell
        cell.record = AudioRecorder.sharedRecorder.recordings[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension AudioViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
}
