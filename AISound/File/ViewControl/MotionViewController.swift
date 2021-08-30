//
//  MotionViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
import JXSegmentedView
class MotionViewController: UIViewController {
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MotionTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MotionTableViewCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
}

extension MotionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AudioRecorder.sharedRecorder.recordings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MotionTableViewCell.self), for: indexPath) as! MotionTableViewCell
        cell.record = AudioRecorder.sharedRecorder.recordings[indexPath.row]
        return cell
    }
}

extension MotionViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
