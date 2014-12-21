//
//  ModalViewController.swift
//  TransitionSample
//
//  Created by taisuke fujita on 2014/12/05.
//  Copyright (c) 2014年 taisuke fujita. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton.buttonWithType(UIButtonType.System)
            as UIButton
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
        // 画面中央に配置する制約を追加
        self.view.addConstraints([centerX, centerY])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func respondToButtonClick(sender: UIButton!) {
        // 画面を閉じる
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
