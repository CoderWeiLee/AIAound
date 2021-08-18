//
//  FileViewController.swift
//  FileViewController
//
//  Created by 李伟 on 2021/8/1.
//

import UIKit
import JXSegmentedView
class FileViewController: UIViewController {
    var segmentedView: JXSegmentedView!
    var segmentedDataSource: JXSegmentedTitleDataSource!
    var indicator: JXSegmentedIndicatorLineView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        //1.初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        view.addSubview(segmentedView)
        
        //2.初始化dataSource
        //segmentedDataSource一定要通过属性强持有，不然会被释放掉
        segmentedDataSource = JXSegmentedTitleDataSource()
        //配置数据源相关配置属性
        segmentedDataSource.titles = ["Audio", "Motion", "Sending"]
        segmentedDataSource.isTitleColorGradientEnabled = true
        //关联dataSource
        segmentedView.dataSource = segmentedDataSource
        
        //3.初始化指示器indicator
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorWidth = 20
        segmentedView.indicators = [indicator]
    }


}

extension FileViewController: JXSegmentedViewDelegate {
    //点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，而不关心具体是点击还是滚动选中的情况。
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {}
    // 点击选中的情况才会调用该方法
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {}
    // 滚动选中的情况才会调用该方法
    func segmentedView(_ segmentedView: JXSegmentedView, didScrollSelectedItemAt index: Int) {}
    // 正在滚动中的回调
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {}
}

extension FileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "File", for: indexPath)
        
        return cell
    }
}
