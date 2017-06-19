//
//  ViewController.swift
//  CircleMenuWithAnimation
//
//  Created by apple on 16/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CircleMenuDelegate {
    
    var appUIColor_First:UIColor = UIColor(rgb: 0x3F51B5)
    var imageNameArray:[String]!
    var menuItemNameArray:[String]!
    var buttonTitleLabel:UILabel!
    
    @IBOutlet weak var circleCenterButton: CircleMenu!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateArrays()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateArrays()
    }
    func updateArrays()
    {
        imageNameArray = ["activity","notification","profile","report","contact","subjects","child"]
        menuItemNameArray = ["Activity","Notification","Profile","Report","Contact","Subjects","Child"]
        
        circleCenterButton.buttonsCount = imageNameArray.count
        circleCenterButton.tintColor = appUIColor_First
        
    }
    
    // MARK: <CircleMenuDelegate>
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        
        circleMenu.buttonsCount =  imageNameArray.count
        circleMenu.distance =  Float(self.view.frame.size.width/2 - 10)
        circleMenu.duration = 0.3
        
        button.setBackgroundImage(UIImage(named: imageNameArray[atIndex]), for: .normal)
        
        // set highlited image
        let highlightedImage  = UIImage(named: imageNameArray[atIndex])?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        
        
        buttonTitleLabel = UILabel(frame: CGRect(x: button.frame.origin.x - button.frame.midX , y: button.frame.origin.y + (button.frame.midX + 10), width: button.frame.size.width * 2, height: button.frame.size.height))
        buttonTitleLabel?.text = menuItemNameArray[atIndex]
        buttonTitleLabel?.font = UIFont(name: "Arial", size: 12.0)
        buttonTitleLabel?.textAlignment =  .center
        buttonTitleLabel?.textColor =  UIColor.black
        buttonTitleLabel?.allowsDefaultTighteningForTruncation =  true
        button.addSubview(buttonTitleLabel!)
        
        
        
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        buttonTitleLabel.text = ""
        button.addSubview(buttonTitleLabel!)
        
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
