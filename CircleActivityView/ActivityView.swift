//
//  ActivityView.swift
//  CircleActivityView
//
//  Created by HLH on 2017/2/16.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

class ActivityView: UIView {

    fileprivate lazy var shapeLayer : CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect.init(origin: .zero, size: CGSize.init(width: 50, height: 50))
        layer.fillColor = UIColor.clear.cgColor // 填充颜色
        layer.strokeColor = UIColor.blue.cgColor
        layer.lineWidth = 4
        layer.lineCap = kCALineCapRound
        layer.strokeStart = 0
        layer.strokeEnd = 0.8
        
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
        layer.backgroundColor = UIColor.white.cgColor
        
        let bezierPath : UIBezierPath = UIBezierPath.init(arcCenter: CGPoint.init(x: shapeLayer.frame.origin.x + 25, y: shapeLayer.frame.origin.y + 25), radius: 21, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)
        bezierPath.close()
        shapeLayer.frame.origin.x = 5
        shapeLayer.frame.origin.y = 5
        shapeLayer.path = bezierPath.cgPath
        layer.addSublayer(shapeLayer)
        addAnimation()
    }
    
    func addAnimation() {
        let rotationAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2 * M_PI
        rotationAnimation.duration = 1
        rotationAnimation.isRemovedOnCompletion = false
        rotationAnimation.repeatCount = Float.infinity
        
        let colorAnimation = CAKeyframeAnimation.init(keyPath: "strokeColor")
        
        colorAnimation.values = [UIColor.colorWithHex(hex: 0xffce3b, alpha: 1).cgColor,UIColor.red.cgColor,UIColor.colorWithHex(hex: 0xffce3b, alpha: 1).cgColor]
        colorAnimation.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)]
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.repeatCount = Float.infinity
        
        let animationGroup = CAAnimationGroup.init()
        animationGroup.repeatCount = Float.infinity
        animationGroup.duration = 2
        animationGroup.animations = [rotationAnimation,colorAnimation]
        shapeLayer.add(animationGroup, forKey: "group")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
