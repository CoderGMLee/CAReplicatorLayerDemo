//
//  ViewController.swift
//  CAReplicatorLayerDemo
//
//  Created by 李国民 on 15/11/19.
//  Copyright © 2015年 李国民. All rights reserved.
//


//学习链接：http://www.jianshu.com/p/76c588893b19

/*  关键属性
*   instanceCount
*   instanceDelay
*   instanceTransform
*/
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        animation1();
//        animation2();
//        animation3();
        animation4();
        
    }

    func animation1(){
        
        let r = CAReplicatorLayer();
        r.bounds = CGRect(x: 0, y: 0, width: 60, height: 60);
        r.position = view.center;
        r.backgroundColor = UIColor.lightGrayColor().CGColor;
        //将容器里的layer复制15份
        r.instanceCount = 3;
        //是副本之间动画之间的延迟
        r.instanceDelay = 0.33;
        r.masksToBounds = true
        //对容器里的layer添加矩阵变化
        r.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
        view.layer.addSublayer(r);
        
        
        let bar = CALayer();
        bar.bounds = CGRect(x: 0, y: 0, width: 8, height: 40);
        bar.position = CGPoint(x: 10, y: 75);
        bar.cornerRadius = 2.0;
        bar.backgroundColor = UIColor.redColor().CGColor;
        r.addSublayer(bar);
        
        let move = CABasicAnimation(keyPath: "position.y");
        move.toValue = bar.position.y - 35;
        move.duration = 0.5;
        move.autoreverses = true;
        move.repeatCount = Float.infinity;
        bar.addAnimation(move, forKey: "move");
    }
    
    func animation2(){
        
        let r = CAReplicatorLayer();
        r.bounds = CGRect(x: 0, y: 0, width: 200, height: 200);
        r.cornerRadius = 10.0;
        r.backgroundColor = UIColor(white: 0.0, alpha:0.75).CGColor;
        r.position = view.center;
        view.layer.addSublayer(r);
        
        let dot = CALayer();
        dot.bounds = CGRect(x: 0, y: 0, width: 14, height: 14);
        dot.position = CGPoint(x: 100, y: 40);
        dot.backgroundColor = UIColor(white: 0.8, alpha: 1).CGColor;
        dot.borderWidth = 1;
        dot.cornerRadius = 2;
        r.addSublayer(dot);
        
        let nrDots : Int = 15;
        r.instanceCount = nrDots;
        let angle = CGFloat(2*M_PI) / CGFloat(nrDots);
        r.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
        
        
        let duration : CFTimeInterval = 1.5;
        let shrink = CABasicAnimation(keyPath: "transform.scale");
        shrink.fromValue = 1.0;
        shrink.toValue = 0.1;
        shrink.duration = duration;
        shrink.repeatCount = Float.infinity
        dot.addAnimation(shrink, forKey: "shrink");
        
        r.instanceDelay = duration/Double(nrDots);
        dot.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
        
    }
    
    
    func animation3(){
        
        let r = CAReplicatorLayer();
        r.bounds = view.bounds;
        r.backgroundColor = UIColor(white: 0, alpha: 0.75).CGColor;
        r.position = view.center;
        view.layer.addSublayer(r);
        
        
        let dot = CALayer()
        dot.bounds = CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0)
        dot.backgroundColor = UIColor(white: 0.8,alpha:1.0).CGColor
        dot.borderColor = UIColor(white:1.0,alpha:1.0).CGColor
        dot.borderWidth = 1.0
        dot.cornerRadius = 5.0
        dot.shouldRasterize = true
        dot.rasterizationScale = UIScreen.mainScreen().scale
        r.addSublayer(dot)
        
        let move = CAKeyframeAnimation(keyPath:"position")
        move.path = rw()
        move.repeatCount = Float.infinity
        move.duration = 4.0
        dot.addAnimation(move,forKey:nil)
        
        r.instanceCount = 20
        r.instanceDelay = 0.1
        
    }
    
    
    func rw() -> CGPath{
        ////贝齐尔制图 变种
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(31.5,71.5))
        bezierPath.addLineToPoint(CGPointMake(31.5,23.5))
        bezierPath.addCurveToPoint(CGPointMake(58.5, 38.5),
            controlPoint1:CGPointMake(31.5,23.5),
            controlPoint2:CGPointMake(62.46,18.69))
        bezierPath.addCurveToPoint(CGPointMake(53.5,45.5),
            controlPoint1:CGPointMake(57.5,43.5),
            controlPoint2:CGPointMake(53.5,45.5))
        bezierPath.addLineToPoint(CGPointMake(43.5,48.5))
        bezierPath.addLineToPoint(CGPointMake(53.5,66.5))
        bezierPath.addLineToPoint(CGPointMake(62.5,51.5))
        bezierPath.addLineToPoint(CGPointMake(70.5,66.5))
        bezierPath.addLineToPoint(CGPointMake( 86.5,23.5))
        bezierPath.addLineToPoint(CGPointMake(86.5,78.5))
        bezierPath.addLineToPoint(CGPointMake(31.5,78.5))
        bezierPath.addLineToPoint(CGPointMake(31.5,71.5))
        bezierPath.closePath()
        
        var t = CGAffineTransformMakeScale(3.0, 3.0)
        return CGPathCreateCopyByTransformingPath(bezierPath.CGPath,&t)!
    }
    
    
    
    func animation4(){
        
        let r = CAReplicatorLayer();
        r.bounds = CGRect(x: 0, y: 0, width: 100, height: 100);
        r.position = view.center;
        r.backgroundColor = UIColor.grayColor().CGColor;
        view.layer.addSublayer(r);
        
        
        let dot = CALayer();
        dot.bounds = CGRect(x: 0, y: 0, width: 8, height: 40);
        dot.position = CGPoint(x: 50, y: 25);
        dot.backgroundColor = UIColor.whiteColor().CGColor;
        dot.shouldRasterize = true;
        dot.opacity = 0;
        r.addSublayer(dot);
        
        let move = CABasicAnimation(keyPath: "opacity");
        move.toValue = 1;
        move.fromValue = 0;
        move.duration = 1.5;
        move.repeatCount = Float.infinity;
        move.autoreverses = true;
        dot.addAnimation(move, forKey: "move");
        
        r.instanceCount = 15;
        r.instanceDelay = 1.5 / 15;
        
        let angle = CGFloat(2*M_PI) / CGFloat(15);
        r.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
        
        
    }
    
}





