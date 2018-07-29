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
    static let topCenter             = CGPoint.init(x: 0.5 , y:0.01)
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
        questionLabel.animate(fontSize: 30, duration: 1.5, animateAnchorPoint: LabelAnimateAnchorPoint.centerXCenterY)
        self.showQuestionOptions()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showQuestionOptions()
    {
        let height = firstAnswerBtn.bounds.height
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime, execute:{
            self.questionLabel.animate(fontSize: 20, duration: 1.5, animateAnchorPoint: LabelAnimateAnchorPoint.topCenter)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime + 2.0, execute: {
            self.self.firstAnswerBtn.layer.cornerRadius = height/3
            self.self.secondAnswerBtn.layer.cornerRadius = height/3
            self.thirdAnswerBtn.layer.cornerRadius = height/3
            UIView.animate(withDuration: 0.5, animations: {
                self.firstAnswerBtn.alpha = 1
                self.secondAnswerBtn.alpha = 1
                self.thirdAnswerBtn.alpha = 1
            }) { (finished) in
                
                self.firstAnswerBtn.isHidden = !finished
                self.secondAnswerBtn.isHidden = !finished
                self.thirdAnswerBtn.isHidden = !finished
            }
        })
    }
    @IBAction func secondBtnClicked(_ sender: Any) {
        firstAnswerBtn.backgroundColor = UIColor.gray
        secondAnswerBtn.backgroundColor = UIColor.magenta
        thirdAnswerBtn.backgroundColor = UIColor.gray
    }
    
    @IBAction func firstBtnClicked(_ sender: Any) {
        firstAnswerBtn.backgroundColor = UIColor.magenta
        secondAnswerBtn.backgroundColor = UIColor.gray
        thirdAnswerBtn.backgroundColor = UIColor.gray
    }
    
    @IBAction func thirdBtnClicked(_ sender: Any) {
        firstAnswerBtn.backgroundColor = UIColor.gray
        secondAnswerBtn.backgroundColor = UIColor.gray
        thirdAnswerBtn.backgroundColor = UIColor.magenta
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



