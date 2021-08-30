//
//  SendingViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
import JXSegmentedView
class SendingViewController: UIViewController {
    var tableView: UITableView!
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
        NotificationCenter.default.addObserver(self, selector: #selector(newAudio), name: NSNotification.Name(kNewAudioNotificationName), object: nil)
    }
    
    @objc func newAudio() {
        tableView.reloadData()
    }
}

extension SendingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AudioRecorder.sharedRecorder.recordings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(SendingTableViewCell.self), for: indexPath) as! SendingTableViewCell
        cell.record = AudioRecorder.sharedRecorder.recordings[indexPath.row]
        return cell
    }
}

extension SendingViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
}
