//
//  DrinkWaterViewController.swift
//  DrinkWater
//
//  Created by LEO YANG on 2021/10/09.
//

import UIKit
import IQKeyboardManagerSwift


enum CompleteAlert {
    case refreshComplete
    case drinkWaterComplete
}


class DrinkWaterViewController: UIViewController {
    
    // MARK: Background UI
    @IBOutlet var background: UIView!
    
    // MARK: NaviationItem UI
    @IBOutlet weak var resetBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var mainNavigationItem: UINavigationItem!
    @IBOutlet weak var profileBarButtonItem: UIBarButtonItem!
    
    // MARK: Cactus Image UI
    @IBOutlet weak var cactusImageView: UIImageView!
    
    // MARK: My Water TextField UI
    @IBOutlet weak var waterTextField: UITextField!
    
    // MARK: Total Water Label UI
    @IBOutlet weak var totalWaterLabelStackView: UIStackView!
    @IBOutlet weak var totalWaterNotice1: UILabel!
    @IBOutlet weak var totalWaterNotice2: UILabel!
    @IBOutlet weak var totalWaterML: UILabel!
    @IBOutlet weak var totalWaterPercentage: UILabel!
    
    // MARK: Recommend Water Label UI
    @IBOutlet weak var recommendWaterLabel: UILabel!
    
    // MARK: Drink Water Button UI
    @IBOutlet weak var drinkWaterButtonBottomView: UIView!
    @IBOutlet weak var drinkWaterButton: UIButton!
    
    // MARK: First Notice Message label UI
    @IBOutlet weak var firstNoticeMessage: UILabel!
    
    // MARK: Total Water
    var totalWater = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackgroundColor()
        updateNavigationItemUI()
        updateDrinkWaterButtonUI()
        updateRecommendLabelUI()
        updateMyWaterTextFieldUI()
        addTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCactusImageAnimation()
        updateTotalWaterLabelUI()
        updateUserInterfaceMessage()
    }

    // MARK: Background UI Configure
    func updateBackgroundColor() {
        let backgroundColor = UIColor(displayP3Red: 31/255, green: 151/255, blue: 110/255, alpha: 1.0)
        background.backgroundColor = backgroundColor
    }
    
    // MARK: TapGesture Configure
    func addTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedBG))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tappedBG(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: Cactus Image UI Configure
    // Cactus Image UI Animation
    func updateCactusImageAnimation() {
        let animations: () -> () = {
            var frame = self.cactusImageView.frame
            frame.size = CGSize(width: frame.width * 1.1, height: frame.height * 1.1)
            self.cactusImageView.alpha = 0.9
            self.cactusImageView.bounds = frame
        }
        UIView.animate(withDuration: 2,
                       delay: 0.3,
                       options: [.repeat, .autoreverse, .curveLinear],
                       animations: animations,
                       completion: nil)
    }
    
    func updateCactusImageChange(from percentWater: String) {
        let waterPercent = UserDefaults.standard.integer(forKey: percentWater)
        if 0 <= waterPercent && waterPercent < 10 {
            cactusImageView.image = UIImage(named: "1-1")
        } else if 10 <= waterPercent && waterPercent < 30 {
            cactusImageView.image = UIImage(named: "1-2")
        } else if 30 <= waterPercent && waterPercent < 40 {
            cactusImageView.image = UIImage(named: "1-3")
        } else if 40 <= waterPercent && waterPercent < 50 {
            cactusImageView.image = UIImage(named: "1-4")
        } else if 50 <= waterPercent && waterPercent < 70 {
            cactusImageView.image = UIImage(named: "1-5")
        } else if 70 <= waterPercent && waterPercent < 80 {
            cactusImageView.image = UIImage(named: "1-6")
        } else {
            cactusImageView.image = UIImage(named: "1-9")
        }
    }
    
    // MARK: Navigation Item UI Configure
    func updateNavigationItemUI() {
        resetBarButtonItem.tintColor = UIColor.white
        profileBarButtonItem.tintColor = UIColor.white
        mainNavigationItem.title = "??? ?????????"
        
        resetBarButtonItem.image = UIImage(systemName: "refresh")
        resetBarButtonItem.style = .done
        profileBarButtonItem.image = UIImage(systemName: "person.circle")
        profileBarButtonItem.style = .done
    }
    
    // MARK: Total Water Label UI Configure
    func updateTotalWaterLabelUI() {
        totalWaterLabelStackView.spacing = 1
        [totalWaterNotice1,
         totalWaterNotice2,
         totalWaterML,
         totalWaterPercentage].forEach { label in
            label.textColor = UIColor.white
        }
        
        totalWaterNotice1.font = UIFont.systemFont(ofSize: 20)

        
        totalWaterNotice2.font = UIFont.systemFont(ofSize: 20)
        totalWaterNotice2.text = "?????? ?????? ??????"
        
        totalWaterML.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        totalWaterML.sizeToFit()
        
        totalWaterPercentage.font = UIFont.systemFont(ofSize: 12)
        totalWaterPercentage.sizeToFit()
    }
    
    // MARK: My Water TextField UI Configure
    func updateMyWaterTextFieldUI() {
        waterTextField.textAlignment = .center
        waterTextField.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        waterTextField.keyboardType = .numberPad
        waterTextField.textColor = UIColor.white
        waterTextField.sizeToFit()
        waterTextField.attributedPlaceholder = NSAttributedString(string: "ml", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]
        )
    }

    // MARK: Recommend Water Label UI Configure
    func updateRecommendLabelUI() {
        recommendWaterLabel.textColor = UIColor.white
        recommendWaterLabel.textAlignment = .center
        recommendWaterLabel.numberOfLines = 0
        recommendWaterLabel.sizeToFit()
    }
    
    // MARK: Drink Water Button UI Configure
    func updateDrinkWaterButtonUI() {
        [drinkWaterButtonBottomView,
         drinkWaterButton].forEach { buttonView in
            buttonView?.backgroundColor = UIColor.white
        }
        
        drinkWaterButton.setTitle("??? ?????????", for: .normal)
        drinkWaterButton.tintColor = UIColor.black
        drinkWaterButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        drinkWaterButton.clipsToBounds = true
        drinkWaterButton.layer.cornerRadius = 20
        drinkWaterButton.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    // MARK: Update User Interface UI Configure
    func updateTotalUserWater() {
        let totalML = UserDefaults.standard.integer(forKey: "totalML")
        let totalWaterPercent = UserDefaults.standard.integer(forKey: "totalWater")
        
        self.totalWaterML.text = "\(totalML)ml"
        self.totalWaterPercentage.text = "????????? \(totalWaterPercent)%"
    }
    
    func updateUserInterfaceMessage() {
        guard let _ = UserDefaults.standard.string(forKey: "nickName") else {
            updateFirstNoticeMessages()
            return
        }
        updateUserWaterMessages()
    }
    
    func updateFirstNoticeMessages() {
        updateRecommendLabelUI()
        
        totalWaterLabelStackView.isHidden = true
        cactusImageView.image = UIImage(named: "1-1")
        firstNoticeMessage.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        firstNoticeMessage.textColor = UIColor.white
        firstNoticeMessage.text = "????????? ?????? ??? ?????? ??????!"
        firstNoticeMessage.textAlignment = .right
        firstNoticeMessage.sizeToFit()
        drinkWaterButton.isEnabled = false
        waterTextField.isHidden = true
        resetBarButtonItem.isEnabled = false
        drinkWaterButton.setTitle("????????? ?????????", for: .disabled)
        recommendWaterLabel.text = "????????? ????????? ?????? ????????? ??? ???????????? ?????????????????????"
    }
    
    func updateInitialNoticeMessages() {
        firstNoticeMessage.isHidden = true
        totalWaterLabelStackView.isHidden = false
        cactusImageView.image = UIImage(named: "1-1")
        totalWaterNotice1.text = "???????????? ??????!"
        UserDefaults.standard.setValue(0, forKey: "totalML")
        UserDefaults.standard.setValue(0, forKey: "totalWater")
        UserDefaults.standard.setValue(0, forKey: "PercentWater")
        let nickName = UserDefaults.standard.string(forKey: "nickName")!
        let recommendWater = makeRecommendWater()
        recommendWaterLabel.text = nickName + "?????? ?????? ?????? ??? ???????????? \(recommendWater)L ?????????."
        totalWater = 0
        totalWaterPercentage.text = "????????? 0%"
        totalWaterML.text = "0ml"
        totalWaterML.textColor = UIColor.white
        totalWaterPercentage.textColor = UIColor.white
    }
    
    func updateUserWaterMessages() {
        totalWaterLabelStackView.isHidden = false
        waterTextField.isHidden = false
        resetBarButtonItem.isEnabled = true
        drinkWaterButton.isEnabled = true
        totalWaterNotice1.text = "???????????? ??????!"
        drinkWaterButton.setTitle("??? ?????????", for: .normal)
        self.totalWater = UserDefaults.standard.integer(forKey: "totalWater")
        let nickName = UserDefaults.standard.string(forKey: "nickName")!
        let recommendWater = makeRecommendWater()
        let percentWater = Int(Double((totalWater)) / (recommendWater * 1000.0) * 100.0)
        totalWaterPercentage.text = "????????? \(percentWater)%"
        recommendWaterLabel.text = nickName + "?????? ?????? ?????? ??? ???????????? \(recommendWater)L ?????????."
        totalWaterML.text = "\(totalWater)ml"
        firstNoticeMessage.isHidden = true
        
        UserDefaults.standard.set(percentWater, forKey: "percentWater")
        updateCactusImageChange(from: "percentWater")
        
        if totalWater >= Int(recommendWater * 1000) {
            totalWaterNotice1.text = "????????? ?????? ????????? ??????!"
            let fontSizeUp = UIFont.systemFont(ofSize: 22, weight: .bold)
            let attributedStr = NSMutableAttributedString(string: totalWaterNotice1.text ?? "")
            attributedStr.addAttribute(.font, value: fontSizeUp, range: (totalWaterNotice1.text! as NSString).range(of: "???"))
            totalWaterNotice1.attributedText = attributedStr
            
            totalWaterML.textColor = UIColor.yellow
            totalWaterPercentage.textColor = UIColor.yellow
        }
        
    }

    func makeRecommendWater() -> Double {
        let height = UserDefaults.standard.integer(forKey: "userHeight")
        let weight = UserDefaults.standard.integer(forKey: "userWeight")
        return Double(height + weight) / 100.0
    }
    
    @IBAction func drinkWaterButtonClicked(_ sender: UIButton) {
        guard let userTakeWater = waterTextField.text, userTakeWater != "", let userTakeWaterInt = Int(userTakeWater) else {
            failDrinkWaterInputAlert()
            return
        }
        updateUserWaterMessages()
        
        totalWater = totalWater + userTakeWaterInt
        UserDefaults.standard.setValue(totalWater, forKey: "totalWater")
        updateUserInterfaceMessage()
        completeAlert(complete: .drinkWaterComplete)
    }
    
    @IBAction func refreshButtonClicked(_ sender: UIBarButtonItem) {
        updateInitialNoticeMessages()
        completeAlert(complete: .refreshComplete)
    }
    
    @IBAction func waterTextFieldEditDidBegin(_ sender: UITextField) {
        totalWaterLabelStackView.isHidden.toggle()
        waterTextField.clearsOnBeginEditing = true
    }
    
    @IBAction func waterTextFieldEditChanged(_ sender: UITextField) {
        if waterTextField.text?.count ?? 0 > 4 || Int(sender.text!) ?? 0 > 1500 {
            waterTextField.deleteBackward()
        }
    }
    
    @IBAction func waterTextFieldEditDidEnd(_ sender: UITextField) {
        totalWaterLabelStackView.isHidden.toggle()
        if Int(sender.text!) ?? 0 == 0 || Int(sender.text!)!.words.first ?? 0 == 0 {
            waterTextField.text = ""
            failDrinkWaterInputAlert()
        }
    }
    
    @IBAction func unwindDrinkWaterViewController(_ sender: UIStoryboardSegue) {
    }
}

// MARK: Complete/ Fail Alert
extension DrinkWaterViewController {
    func completeAlert(complete: CompleteAlert) {
        var alert = UIAlertController()
        switch complete {
        case .refreshComplete:
            alert = UIAlertController(title: "??? ???", message: "??? ???????????? ????????? ???????????????!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "??????", style: .default, handler: nil)
            alert.addAction(okAction)
        case .drinkWaterComplete:
            alert = UIAlertController(title: "????????????", message: "??????! ?????? ???????????????!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "??????", style: .default) { _ in
                self.waterTextField.text = ""
            }
            alert.addAction(okAction)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func failDrinkWaterInputAlert() {
        let alert = UIAlertController(title: "??????", message: "??? ???????????? ??????????????????", preferredStyle: .alert)
        let ok = UIAlertAction(title: "??????", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
