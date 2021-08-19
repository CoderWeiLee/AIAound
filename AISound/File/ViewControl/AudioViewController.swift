//
//  AudioViewController.swift
//  AISound
//
//  Created by 李伟 on 2021/8/18.
//

import UIKit
class AudioViewController: UIViewController {
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FileTableViewCell.classForCoder(), forCellReuseIdentifier: "File")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
}

extension AudioViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
