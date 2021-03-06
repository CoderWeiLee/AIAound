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
    var listContainerView: JXSegmentedListContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        //1.初始化JXSegmentedView
        segmentedView = JXSegmentedView()
        segmentedView.delegate = self
        segmentedView.backgroundColor = UIColor(hexString: "#1fbad2")
        view.addSubview(segmentedView)
        segmentedView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(topSafeAreaHeight + statusBarHeight)
            make.height.equalTo(50)
        }
        
        //2.初始化dataSource
        //segmentedDataSource一定要通过属性强持有，不然会被释放掉
        segmentedDataSource = JXSegmentedTitleDataSource()
        //配置数据源相关配置属性
        segmentedDataSource.titles = ["Audio", "Motion", "Sending"]
        segmentedDataSource.titleNormalColor = UIColor(white: 1, alpha: 0.7)
        segmentedDataSource.titleSelectedColor = UIColor(white: 1, alpha: 1)
        segmentedDataSource.titleNormalFont = UIFont.systemFont(ofSize: 13)
        segmentedDataSource.titleSelectedFont = UIFont.systemFont(ofSize: 13)
        segmentedDataSource.isTitleColorGradientEnabled = true
        //关联dataSource
        segmentedView.dataSource = segmentedDataSource
        
        //3.初始化指示器indicator
        let indicator = JXSegmentedIndicatorLineView()
        indicator.indicatorColor = UIColor(hexString: "#242202")!
        indicator.indicatorHeight = 2
        segmentedView.indicators = [indicator]
        
        //4.初始化JXSegmentedListContainerView
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        view.addSubview(listContainerView)
        listContainerView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(indicator.snp_bottom)
        }
        //关联listContainer
        segmentedView.listContainer = listContainerView

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

extension FileViewController: JXSegmentedListContainerViewDataSource {
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        switch index {
        case 0:
            return AudioViewController()
        case 1:
            return MotionViewController()
        default:
            return SendingViewController()
        }
    }
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return 3
    }
    
    
}
