//
//  Extension.swift
//  MVP
//
//  Created by Serkan Mehmet Malagiç on 3.01.2022.
//

import UIKit
import NVActivityIndicatorView

extension UIView{
    
    func createSpinner() -> NVActivityIndicatorView{
        let x = self.frame.width / 2 - 25
        let y = self.frame.height / 2
        
        return createSpinner(x: x, y: y)
    }
    
    func createSpinner(x: CGFloat, y: CGFloat) -> NVActivityIndicatorView{
        var activityView : NVActivityIndicatorView!
        if activityView == nil{
            activityView = NVActivityIndicatorView(frame: CGRect(x: x, y: y, width: 50, height: 50), type: NVActivityIndicatorType.circleStrokeSpin, color: UIColor.darkGray, padding: 0.0)
            self.addSubview(activityView)
        }
        return activityView
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension String {
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}
