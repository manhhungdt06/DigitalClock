//
//  ViewController.swift
//  Digital Clock
//
//  Created by techmaster on 10/24/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ampmLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    func updateTime() {
        let date = Date()
        let calendar = NSCalendar.current
        let retCal: NSCalendar.Unit = [
            NSCalendar.Unit.hour,
            NSCalendar.Unit.minute,
            NSCalendar.Unit.second
        ]
        
        let retTime = (calendar as NSCalendar).components(retCal, from: date)
        var hour = retTime.hour
        let minute = retTime.minute
        let second = retTime.second
        if hour! > 12 {
            hour = hour! - 12
            ampmLabel.text = "PM"
        } else {
            ampmLabel.text = "AM"
        }
        timeLabel.text = convertZero(hour!) + ":" + convertZero(minute!) + ":" + convertZero(second!)
    }
    func convertZero(_ num: Int) -> String {
        let tmpStr = (num < 10 ? "0":"") + String(num)
        return tmpStr
    }
}

