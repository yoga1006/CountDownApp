//
//  ViewController.swift
//  CountDownApp
//
//  Created by Yoga on 2023/7/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var eventLabel: UILabel!
    
    @IBOutlet weak var eventTextField: UITextField!
    
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    @IBOutlet weak var totalDaysLabel: UILabel!
    
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var minuteLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var eventView: UIView!
    
    @IBOutlet weak var background1ImageView: UIImageView!
    
    @IBOutlet weak var countDownDatePicker: UIDatePicker!
    
    let now = Date() //取得現在時間
    let dateFormatter = DateFormatter()
   
    var timer: Timer? //宣告timer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventView.isHidden = true
        eventView.frame = view.frame
        background1ImageView.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }


   
    
    @IBAction func selectDatePicker(_ sender: Any) {
        
        //透過 timer 設定每幾秒執行 function
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] Timer in
            let interval = Int(self.countDownDatePicker.date.timeIntervalSinceNow)
                       let year = interval / (60 * 60 * 24 * 30 * 12)
                       let mth = interval / (60 * 60 * 24 * 30)
                       let day = interval / (60 * 60 * 24) % 30
                       let hrs = interval / (60 * 60) % 24
                       let min = interval / 60 % 60
                       let sec = interval % 60
            
            countDownLabel.text = String(interval/86400) //因單位為秒，要算出天的話為60*60*24
            
            let numberFormatter = NumberFormatter() //利用NumberFormatter()設定數字顯示
            numberFormatter.formatWidth = 2 //十位數顯示
            numberFormatter.paddingCharacter = "0"
            
            yearLabel.text = numberFormatter.string(from: NSNumber(value: year))
            monthLabel.text = numberFormatter.string(from: NSNumber(value: mth))
            dayLabel.text = numberFormatter.string(from: NSNumber(value: day))
            hourLabel.text = numberFormatter.string(from: NSNumber(value: hrs))
            minuteLabel.text = numberFormatter.string(from: NSNumber(value: min))
            secondLabel.text = numberFormatter.string(from: NSNumber(value: sec))
        })
        
        
        countDownDatePicker.minimumDate = now //設計為倒數日，故最小日期為now
            
        dateFormatter.dateFormat = "yyyy/MM/dd" //存取的格式
        let dateString = dateFormatter.string(from: selectDatePicker.date)//將選擇的日期和時間轉換成文字格式（String）
        totalDaysLabel.text = dateString
        
    }
    
    
    @IBAction func addEvent(_ sender: Any) {
        eventView.isHidden = false
        
    }
    
    
    @IBAction func checkEvent(_ sender: Any) {
        eventLabel.text = eventTextField.text!
        eventView.isHidden = true
        
    }
    
    
}

