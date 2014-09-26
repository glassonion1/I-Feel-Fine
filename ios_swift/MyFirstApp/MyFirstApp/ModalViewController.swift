//
//  ModalViewController.swift
//  MyFirstApp
//
//  Created by taisuke fujita on 2014/06/17.
//
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        button.setTitle("閉じる", forState: UIControlState.Normal)
        button.addTarget(self,
            action: "respondToButtonClick:",
            forControlEvents: UIControlEvents.TouchUpInside)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(button)
        
        let centerX = NSLayoutConstraint(item: button,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)
        
        let centerY = NSLayoutConstraint(item: button,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0)
        // 制約の追加
        self.view.addConstraints([centerX, centerY])
    }

    func respondToButtonClick(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
