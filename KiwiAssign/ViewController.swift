//
//  ViewController.swift
//  KiwiAssign
//
//  Created by Santosh  Kumar Chaurasia on 29/07/18.
//  Copyright © 2018 Santosh  Kumar Chaurasia. All rights reserved.
//

import UIKit


struct LabelAnimateAnchorPoint {
    // You can add more suitable archon point for your needs
    static let leadingCenterY        = CGPoint.init(x: 0, y: 0.5)
    static let trailingCenterY       = CGPoint.init(x: 1, y: 0.5)
    static let centerXCenterY        = CGPoint.init(x: 0.5, y: 0.5)
    static let leadingTop            = CGPoint.init(x: 0, y: 0)
    static let topCenter             = CGPoint.init(x: 0.5 , y:0.05)
}

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerBtn: UIButton!
    @IBOutlet weak var secondAnswerBtn: UIButton!
    @IBOutlet weak var thirdAnswerBtn: UIButton!
    
    let delayTime = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.isHidden = false
        questionLabel.animate(fontSize: 30, duration: 2, animateAnchorPoint: LabelAnimateAnchorPoint.centerXCenterY)
        
        DispatchQueue.main.asyncAfter(deadline:.now() + delayTime , execute: {
            self.showQuestionOptions()
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showQuestionOptions()
    {
        questionLabel.animate(fontSize: 20, duration: 2, animateAnchorPoint: LabelAnimateAnchorPoint.topCenter)
        //questionLabel.bounds.size.height = questionLabel.bounds.size.height/2
        firstAnswerBtn.layer.cornerRadius = firstAnswerBtn.bounds.height/4
        secondAnswerBtn.layer.cornerRadius = secondAnswerBtn.bounds.height/4
        thirdAnswerBtn.layer.cornerRadius = thirdAnswerBtn.bounds.height/4
        UIView.animate(withDuration: 2) {
            self.firstAnswerBtn.isHidden = false
            self.secondAnswerBtn.isHidden = false
            self.thirdAnswerBtn.isHidden = false
        }
        
    }
    
    
}
extension UILabel {
    func animate(fontSize: CGFloat, duration: TimeInterval, animateAnchorPoint: CGPoint) {
        let startTransform = transform
        let oldFrame = frame
        var newFrame = oldFrame
        let archorPoint = layer.anchorPoint
        let scaleRatio = fontSize / font.pointSize
        
        layer.anchorPoint = animateAnchorPoint
        
        newFrame.size.width *= scaleRatio
        newFrame.size.height *= scaleRatio
        newFrame.origin.x = oldFrame.origin.x - (newFrame.size.width - oldFrame.size.width) * animateAnchorPoint.x
        newFrame.origin.y = oldFrame.origin.y - (newFrame.size.height - oldFrame.size.height) * animateAnchorPoint.y
        frame = newFrame
        
        font = font.withSize(fontSize)
        
        transform = CGAffineTransform.init(scaleX: 1 / scaleRatio, y: 1 / scaleRatio);
        layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            self.transform = startTransform
            newFrame = self.frame
        }) { (Bool) in
            self.layer.anchorPoint = archorPoint
            self.frame = newFrame
        }
    }
}



