//
//  MotionRecord.swift
//  JRecor
//
//  Created by Junjie on 2021/6/15.
//

import Foundation
import CoreMotion

class MotionRecord: NSObject, CMHeadphoneMotionManagerDelegate{
    
    let motionRecorder = CMHeadphoneMotionManager()
        
    func start(){
        guard motionRecorder.isDeviceMotionAvailable else {return}
        
        motionRecorder.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {
            motion, error in
            guard let _ = motion, error == nil else {return}
            
        })
    }
    
}
