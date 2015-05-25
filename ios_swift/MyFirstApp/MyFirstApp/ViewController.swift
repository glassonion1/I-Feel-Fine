//
//  ViewController.swift
//  MyFirstApp
//
//  Created by taisuke fujita on 2014/06/06.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ビューの位置と大きさを決める
        let rect = CGRect(x: 100, y: 100, width: 100, height: 50)
        // ビューオブジェクトの生成
        let view = UIView(frame:rect)
        view.backgroundColor = UIColor.redColor()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(view)
        
        let width = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: rect.width)
        
        let height = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: rect.height)
        
        let centerX = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0)
        
        let y30 = NSLayoutConstraint(item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: 30)
        // 制約の追加
        self.view.addConstraints([width, height, centerX, y30])
        
        let button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 44)
        button.setTitle("開く", forState: UIControlState.Normal)
        button.addTarget(self,
            action: "respondToButtonClick:",
            forControlEvents: UIControlEvents.TouchUpInside)
        //view.addSubview(button)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToModalViewController(segue: UIStoryboardSegue) {
        //
    }
    
    func respondToButtonClick(sender: UIButton) {
        let controller = ModalViewController()
        controller.view.backgroundColor = UIColor.whiteColor()
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

