//
//  ClockViewController.swift
//  UdemyIOS9
//
//  Created by Cynthia Whitlatch on 10/9/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
    
  @IBOutlet weak var myTimeLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      myTimeLabel.text = ""
      _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(ClockViewController.updateClock)), userInfo: nil, repeats: true)
    }

  func updateClock() {

    let date = Date()
    let calendar = Calendar.current
    let components = (calendar as NSCalendar).components([.hour, .minute, .second], from: date)
    
    var hour = components.hour! > 12 ? components.hour! - 12 : components.hour
    hour = hour == 0 ? 12 : hour

    let hourString = hour! > 9 ? "\(hour!)" : "0\(hour!)"
    let minutes = components.minute! > 9 ? "\(components.minute!)" : "0\(components.minute!)"
    let seconds = components.second! > 9 ? "\(components.second!)" : "0\(components.second!)"
    let ampm = components.hour! > 12 ? "PM" : "AM"
    
    if myTimeLabel != nil {
        myTimeLabel!.text = "\(hourString):\(minutes):\(seconds) \(ampm)"
    }
  }
}
