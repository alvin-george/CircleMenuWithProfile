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
        imageNameArray = ["activity","notification","profile","report","contact","subjects"]
        
        circleCenterButton.buttonsCount = imageNameArray.count
        circleCenterButton.tintColor = appUIColor_First
        //circleCenterButton.frame = CGRect(x: 200, y: 200, width: 50, height: 50)
     
        //circleCenterButton.frame.size.width = 150
       // circleCenterButton.frame.size.height = 80
        circleCenterButton.distance = Float(self.view.frame.midX)
       

    }

    
    
    // MARK: <CircleMenuDelegate>
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        
        circleMenu.buttonsCount =  imageNameArray.count
        circleMenu.tintColor = appUIColor_First
        
        circleCenterButton.frame.size.width = 80
        circleCenterButton.frame.size.height = 80
        
        button.imageView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        
        circleMenu.imageView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)

        button.backgroundColor = appUIColor_First
        
        
        //button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: imageNameArray[atIndex]), for: .normal)
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit;
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        // set highlited image
        let highlightedImage  = UIImage(named: imageNameArray[atIndex])?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        
        button.tintColor = appUIColor_First
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
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
