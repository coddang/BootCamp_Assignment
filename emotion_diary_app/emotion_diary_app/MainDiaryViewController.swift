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

        happyLabel.text = "행복해 \(UserDefaults.standard.integer(forKey: "happyCount"))"
        loveLabel.text = "사랑해 \(UserDefaults.standard.integer(forKey: "loveCount"))"
        likeLabel.text = "좋아해 \(UserDefaults.standard.integer(forKey: "likeCount"))"
        angerLabel.text = "화가나 \(UserDefaults.standard.integer(forKey: "angerCount"))"
        shockedLabel.text = "당황해 \(UserDefaults.standard.integer(forKey: "shockedCount"))"
        boreLabel.text = "심심해 \(UserDefaults.standard.integer(forKey: "boreCount"))"
        panicLabel.text = "황당해 \(UserDefaults.standard.integer(forKey: "panicCount"))"
        blueLabel.text = "우울해 \(UserDefaults.standard.integer(forKey: "blueCount"))"
        sadLabel.text = "슬퍼해 \(UserDefaults.standard.integer(forKey: "sadCount"))"
    }

    @IBAction func tappedhappyButton(_ sender: UIButton) {
        let number1 = UserDefaults.standard.integer(forKey: "happyCount")
        UserDefaults.standard.set(number1 + 1, forKey: "happyCount")
        let happyCount = UserDefaults.standard.integer(forKey: "happyCount")
        happyLabel.text = "행복해 \(happyCount)"
    }
    @IBAction func tappedLoveButton(_ sender: UIButton) {
        let number2 = UserDefaults.standard.integer(forKey: "loveCount")
        UserDefaults.standard.set(number2 + 1, forKey: "loveCount")
        let loveCount = UserDefaults.standard.integer(forKey: "loveCount")
        loveLabel.text = "사랑해 \(loveCount)"
    }
    @IBAction func tappedLikeButton(_ sender: UIButton) {
        let number3 = UserDefaults.standard.integer(forKey: "likeCount")
        UserDefaults.standard.set(number3 + 1, forKey: "likeCount")
        let likeCount = UserDefaults.standard.integer(forKey: "likeCount")
        likeLabel.text = "좋아해 \(likeCount)"
    }
    @IBAction func tappedAngerButton(_ sender: UIButton) {
        let number4 = UserDefaults.standard.integer(forKey: "angerCount")
        UserDefaults.standard.set(number4 + 1, forKey: "angerCount")
        let angerCount = UserDefaults.standard.integer(forKey: "angerCount")
        angerLabel.text = "화가나 \(angerCount)"
    }
    @IBAction func tappedShockedButton(_ sender: UIButton) {
        let number5 = UserDefaults.standard.integer(forKey: "shockedCount")
        UserDefaults.standard.set(number5 + 1, forKey: "shockedCount")
        let shockedCount = UserDefaults.standard.integer(forKey: "shockedCount")
        shockedLabel.text = "당황해 \(shockedCount)"
    }
    @IBAction func tappedBoreButton(_ sender: UIButton) {
        let number6 = UserDefaults.standard.integer(forKey: "boreCount")
        UserDefaults.standard.set(number6 + 1, forKey: "boreCount")
        let boreCount = UserDefaults.standard.integer(forKey: "boreCount")
        boreLabel.text = "심심해 \(boreCount)"
    }
    @IBAction func tappedPanicButton(_ sender: UIButton) {
        let number7 = UserDefaults.standard.integer(forKey: "panicCount")
        UserDefaults.standard.set(number7 + 1, forKey: "panicCount")
        let panicCount = UserDefaults.standard.integer(forKey: "panicCount")
        panicLabel.text = "황당해 \(panicCount)"
    }
    @IBAction func tappedBlueButton(_ sender: UIButton) {
        let number8 = UserDefaults.standard.integer(forKey: "blueCount")
        UserDefaults.standard.set(number8 + 1, forKey: "blueCount")
        let blueCount = UserDefaults.standard.integer(forKey: "blueCount")
        blueLabel.text = "우울해 \(blueCount)"
    }
    @IBAction func tappedSadButton(_ sender: UIButton) {
        let number9 = UserDefaults.standard.integer(forKey: "sadCount")
        UserDefaults.standard.set(number9 + 1, forKey: "sadCount")
        let sadCount = UserDefaults.standard.integer(forKey: "sadCount")
        sadLabel.text = "슬퍼해 \(sadCount)"
        
    }
    
    @IBAction func tappedLabelResetButton(_ sender: UIButton) {
        let emotionCounts = ["happyCount", "loveCount", "likeCount", "angerCount", "shockedCount", "boreCount", "panicCount", "blueCount", "sadCount"]
        for i in emotionCounts {
            UserDefaults.standard.removeObject(forKey: i)
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

