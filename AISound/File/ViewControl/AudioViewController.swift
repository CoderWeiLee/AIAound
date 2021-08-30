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
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FileTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(FileTableViewCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
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
}

extension AudioViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
