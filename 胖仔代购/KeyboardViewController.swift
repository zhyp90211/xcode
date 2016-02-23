//
//  KeyboardViewController.swift
//  胖仔代购
//
//  Created by ZhangYupeng on 10/22/15.
//  Copyright © 2015 ZhangYupeng. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        
        addButtonNextkeybaord()
     
        let timeNow = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm";
        let timeArray = formatter.stringFromDate(timeNow).componentsSeparatedByString(":")
        var hour: Int = Int(timeArray[0])!
        let minute = timeArray[1]
        var String1 = "现在是美国加州时间"
        
        if hour < 5  {
            String1 += "凌晨\(hour):\(minute)哈"
        }
        else if hour >= 5  && hour < 9 {
            String1 += "早上\(hour):\(minute)哈"
        }
        else if hour >= 9 && hour < 13 {
            String1 += "上午\(hour):\(minute)哈"
        }
        else if hour >= 13 && hour < 18 {
            hour = hour - 12
            String1 += "下午\(hour):\(minute)哈"
        }
        else {
            hour = hour - 12
            String1 += "晚上\(hour):\(minute)哈"
        }
        
        let String2 = "直邮：购买物品达到3斤或以上可以享受直邮，直邮需要提供身份证照片正面和反面。拼" +
        
        "邮：购买物品不够三磅需要拼邮，即发到山东我妈妈那里然后由妈妈转发；若不够重量仍" +
        
        "然想直邮，可以多付运费，或者等到以后买够重量一起直邮。（大部分包包手表等一件即" +
        
        "可直邮)。拼邮直邮价钱一样，只是拼邮比直邮晚到5天左右😊"
        
        let String3 = "我每周日会将货物送到快递公司，由快递公司打包登记入库，赶礼拜四的送货飞机。上" +
        "飞机之日起3周左右到达😊"
        
        let String4 = "代理：发我相册里的广告，按广告上的价再加自己的利润卖即可。由于现在在我这里拿" +
        
        "货的大部分是代理，所以为了避免麻烦，就不分零售价代理价，全部按代理价发广告。但若每周都能拿货至少一次，便可享受vip代理价😊"
        
        let String5 = "快件查询网站：www.shiningexpress.com。查询单号：SE10000"
        
        let String6 = "支付方式：微信转账或微信红包或者支付宝，支付宝账户：605054858@qq.com，用的是王芳这个名字" +
        
        "不支持淘宝和微店付款😊"
        
        
        let buttonTitles = [String1, String2, String3, String4, String5, String6]
        
        addButtons(buttonTitles)
        
    }

    
    
    func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        (textDocumentProxy as UIKeyInput).insertText(title!)
    }
 
    func addButtons(titles: [String]){
        for var index = 0; index < titles.count; index++
        {
            let titleOne = titles[index]
            let ButtonOne = UIButton(type: .System)
            ButtonOne.setTitle(titleOne, forState: .Normal)
            ButtonOne.setTitleColor(UIColor(white: 0, alpha: 1), forState: .Normal)
            //ButtonOne.sizeToFit()
            ButtonOne.frame = CGRectMake(5, 5 + 30 * CGFloat(index), 360, 25);
            ButtonOne.autoresizesSubviews = false;
            // adding a callback
            ButtonOne.addTarget(self, action: "keyPressed:", forControlEvents: .TouchUpInside)
        
            // make the font bigger
            ButtonOne.titleLabel?.font = UIFont.systemFontOfSize(18)
    
            // add rounded corners
            ButtonOne.backgroundColor = UIColor(white: 1, alpha: 1)
            ButtonOne.layer.cornerRadius = 5
            view.addSubview(ButtonOne)
        
            // makes the vertical centers equa;
            let dotCenterYConstraint = NSLayoutConstraint(item: ButtonOne, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        
            // set the button 50 points to the left (-) of the horizontal center
            let dotCenterXConstraint = NSLayoutConstraint(item: ButtonOne, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: -50)
            view.addConstraints([dotCenterXConstraint, dotCenterYConstraint])
        }
    
    }
    
    func addButtonNextkeybaord() {
        self.nextKeyboardButton = UIButton(type: .System)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("  Next  ", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.backgroundColor = UIColor(white: 1, alpha: 1)
        self.nextKeyboardButton.layer.cornerRadius = 5
        self.nextKeyboardButton.titleLabel?.font = UIFont.systemFontOfSize(20)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false

        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        self.view.endEditing(false)
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 5.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -5.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    

}
