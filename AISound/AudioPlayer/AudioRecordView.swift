//
//  AudioRecordView.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/30.
//

import UIKit
class AudioRecordView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAnimation(addVoiceBar(addReplicatorLayer()))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 添加复制层
    func addReplicatorLayer() -> CAReplicatorLayer{
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = self.bounds
        replicatorLayer.instanceCount = 18 //复制出来5份
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(5, 0, 0)
        replicatorLayer.instanceDelay = 0.2 // 设置动画延迟   如果设置0 或者整数速度和高度完全一致，如果设置0.5奇偶数区别跳动
        
        replicatorLayer.instanceColor = UIColor(hexString: "#979797")?.cgColor // 动画颜色
        self.layer.addSublayer(replicatorLayer)
        return replicatorLayer
    }
    
    // 添加音量震动条
    func addVoiceBar(_ replicatorLayer: CAReplicatorLayer) -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 4, height: 60)
        layer.backgroundColor = UIColor.white.cgColor
        layer.position = CGPoint(x: 0, y: 80)
        layer.anchorPoint = CGPoint(x: 0, y: 1) // 设置缩放的锚点
        replicatorLayer.addSublayer(layer)
        return layer;
    }
    
    func addAnimation(_ layer: CALayer) {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale.y"
        animation.toValue = 0
        animation.repeatCount = MAXFLOAT
        animation.duration = 0.5
        animation.autoreverses = true
        layer.add(animation, forKey: nil)
        
    }
    
}
