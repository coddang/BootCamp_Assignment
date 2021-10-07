//
//  DDayViewController.swift
//  emotion_diary_app
//
//  Created by LEO YANG on 2021/10/07.
//

import UIKit

class DDayViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 나머지 부분은 automatic 상태
//        if #available(iOS 14.0, *) {
//            datePicker.preferredDatePickerStyle = .inline
//        }
       
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        print(datePicker.date)
        
        
        // DateFormatter: 1.location(타임존에 맞출 수 있다.)
        
        let format = DateFormatter()
        format.dateFormat = "yy/MM/dd"
        let value = format.string(from: sender.date)
        print(value)
        
        // 오늘 날짜 기준으로 100일 뒤는?, timeInterval(초단위, Calender
        let afterDate = Date(timeInterval: 86400 * 100, since: sender.date)
        print(afterDate)
        
    }
    
}
