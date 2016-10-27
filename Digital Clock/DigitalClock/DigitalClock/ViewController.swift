//
//  ViewController.swift
//  DigitalClock
//
//  Created by Cuong Trinh on 1/12/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelPMAM: UILabel!
    
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateClock()
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(ViewController.updateClock), userInfo: nil, repeats: true)
    }
    func updateClock() {
        let date = Date()
        let calendar = Calendar.current
        let requestedComponents: NSCalendar.Unit = [
            NSCalendar.Unit.hour,
            NSCalendar.Unit.minute
        ]

        let components = (calendar as NSCalendar).components(requestedComponents, from: date)
        var hour = components.hour
        let minutes = components.minute
        if hour! > 12 {
            hour = hour! - 12
            labelPMAM.text = "PM"
        } else {
            labelPMAM.text = "AM"
        }
        
        labelTime.text = padZero(hour!) + ":" + padZero(minutes!)
        
    }
    
    func padZero(_ num: Int) -> String {
        let temp = (num < 10 ? "0":"") + String(num)
        print(temp)
        return temp
    }


}

