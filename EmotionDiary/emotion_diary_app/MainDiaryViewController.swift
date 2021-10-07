//
//  ViewController.swift
//  emotion_diary_app
//
//  Created by LEO YANG on 2021/10/06.
//

import UIKit

class MainDiaryViewController: UIViewController {

    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var angerLabel: UILabel!
    @IBOutlet weak var shockedLabel: UILabel!
    @IBOutlet weak var boreLabel: UILabel!
    @IBOutlet weak var panicLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var sadLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEmotionUI()
    }
    
    @IBAction func tappedCountingButton(_ sender: UIButton) {
        let count = UserDefaults.standard.integer(forKey: "emotion \(sender.tag)")
        UserDefaults.standard.set(count + 1, forKey: "emotion \(sender.tag)")
        updateEmotionUI()
        
    }
    
    func updateEmotionUI() {
        happyLabel.text = "행복해 \(UserDefaults.standard.integer(forKey: "emotion 0"))"
        loveLabel.text = "사랑해 \(UserDefaults.standard.integer(forKey: "emotion 1"))"
        likeLabel.text = "좋아해 \(UserDefaults.standard.integer(forKey: "emotion 2"))"
        angerLabel.text = "화가나 \(UserDefaults.standard.integer(forKey: "emotion 3"))"
        shockedLabel.text = "당황해 \(UserDefaults.standard.integer(forKey: "emotion 4"))"
        boreLabel.text = "심심해 \(UserDefaults.standard.integer(forKey: "emotion 5"))"
        panicLabel.text = "황당해 \(UserDefaults.standard.integer(forKey: "emotion 6"))"
        blueLabel.text = "우울해 \(UserDefaults.standard.integer(forKey: "emotion 7"))"
        sadLabel.text = "슬퍼해 \(UserDefaults.standard.integer(forKey: "emotion 8"))"
    }
    
    @IBAction func tappedRemoveCountButton(_ sender: UIButton) {
        for i in 0...8 {
            UserDefaults.standard.removeObject(forKey: "emotion \(i)")
        }
        happyLabel.text = "행복해 0"
        loveLabel.text = "사랑해 0"
        likeLabel.text = "좋아해 0"
        angerLabel.text = "화가나 0"
        shockedLabel.text = "당황해 0"
        boreLabel.text = "심심해 0"
        panicLabel.text = "황당해 0"
        blueLabel.text = "우울해 0"
        sadLabel.text = "슬퍼해 0"
    }
}
