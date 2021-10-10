//
//  ProfileViewController.swift
//  DrinkWater
//
//  Created by LEO YANG on 2021/10/09.
//

import UIKit
import TextFieldEffects
import IQKeyboardManagerSwift


enum TextInputError: Error {
    case emptyNickName
    case emptyWeight
    case emptyHeight
}

class ProfileViewController: UIViewController {

    // MARK: Background Color UI
    @IBOutlet var profileBackground: UIView!
    
    // MARK: Navigation Item UI
    @IBOutlet weak var profileSaveButtonItem: UIBarButtonItem!
    @IBOutlet weak var profileNaviationItem: UINavigationItem!
    
    // MARK: Main Profile Image UI
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: User Text Field UI
    @IBOutlet weak var nickNameTextField: HoshiTextField!
    @IBOutlet weak var heightTextField: HoshiTextField!
    @IBOutlet weak var weightTextField: HoshiTextField!
    @IBOutlet weak var userTextFieldStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackgroundColor()
        updateNavigationItemUI()
        updateMainProfileImageUI()
        updateNavigationBarColor()
        userDefaultInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUserTextFieldUI()
        
    }
    
    // MARK: TextField Toggle Actions
    @IBAction func nickNameTextFieldEditDidBegin(_ sender: HoshiTextField) {
        nickNameTextField.clearsOnBeginEditing = true
        heightTextField.isHidden.toggle()
        weightTextField.isHidden.toggle()
    }
    
    @IBAction func nickNameEditChanged(_ sender: HoshiTextField) {
        if nickNameTextField.text?.count ?? 0 > 8 {
            nickNameTextField.deleteBackward()
        }
    }

    @IBAction func nickNameTextFieldEditDidEnd(_ sender: HoshiTextField) {
        heightTextField.isHidden.toggle()
        weightTextField.isHidden.toggle()
    }
    
    @IBAction func heightTextFieldEditDidBegin(_ sender: HoshiTextField) {
        heightTextField.clearsOnBeginEditing = true
        nickNameTextField.isHidden.toggle()
        weightTextField.isHidden.toggle()
    }
    
    @IBAction func heightEditChanged(_ sender: HoshiTextField) {
        if heightTextField.text?.count ?? 0 > 3 || Int(sender.text!) ?? 0 > 250 {
            heightTextField.deleteBackward()
        }
    }
    
    @IBAction func heightTextFieldEditDidEnd(_ sender: HoshiTextField) {
        nickNameTextField.isHidden.toggle()
        weightTextField.isHidden.toggle()
    }
    
    @IBAction func weightTextFieldEditDidBegin(_ sender: HoshiTextField) {
        weightTextField.clearsOnBeginEditing = true
        nickNameTextField.isHidden.toggle()
        heightTextField.isHidden.toggle()
    }
    
    @IBAction func weightEditChanged(_ sender: HoshiTextField) {
        if weightTextField.text?.count ?? 0 > 3 || Int(sender.text!) ?? 0 > 250 {
            weightTextField.deleteBackward()
        }
    }
    
    @IBAction func weightTextFieldEditDidEnd(_ sender: HoshiTextField) {
        nickNameTextField.isHidden.toggle()
        heightTextField.isHidden.toggle()
    }
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        checkTextFieldValidation()
    }
}

// MARK: Alert
extension ProfileViewController {
    func popFailAlert(error: TextInputError) {
        let alert: UIAlertController
        switch error {
        case .emptyNickName:
            alert = UIAlertController(title: "알 림", message: "닉네임을 입력해주세요 (최대 8자)", preferredStyle: .alert)
        case .emptyHeight:
            alert = UIAlertController(title: "알 림", message: "키를 입력해주세요", preferredStyle: .alert)
        case .emptyWeight:
            alert = UIAlertController(title: "알 림", message: "몸무게를 입력해주세요", preferredStyle: .alert)
        }
        let cancel = UIAlertAction(title: "재입력", style: .destructive)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func popSuccessAlert() {
        let alert = UIAlertController(title: "알 림", message: "사용자 정보를 성공적으로 저장했습니다!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


// MARK: Update UI
extension ProfileViewController {
    
    // UserDefault Initialization
    func userDefaultInit() {
        nickNameTextField.text = UserDefaults.standard.string(forKey: "nickName")
        heightTextField.text = UserDefaults.standard.string(forKey: "userHeight")
        weightTextField.text = UserDefaults.standard.string(forKey: "userWeight")
    }

    // Background Color Configure
    func updateBackgroundColor() {
        let backgroundColor = UIColor(displayP3Red: 31/255, green: 151/255, blue: 110/255, alpha: 1.0)
        profileBackground.backgroundColor = backgroundColor
    }
    
    // Navigation Item Bar Color Configure
    func updateNavigationBarColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // Navigation Item UI Configure
    func updateNavigationItemUI() {
        profileNaviationItem.backButtonDisplayMode = .default
        profileNaviationItem.backBarButtonItem?.style = .plain
        profileNaviationItem.backBarButtonItem?.tintColor = UIColor.white
        profileNaviationItem.backButtonTitle = "물 마시기"
        profileSaveButtonItem.title = "저장"
        profileSaveButtonItem.tintColor = UIColor.white
    }
    
    // Main Profile Image UI Configure
    func updateMainProfileImageUI() {
        profileImage.image = UIImage(named: "1-6")
    }
    
    // User Text Field UI Configure
    func updateUserTextFieldUI() {
        userTextFieldStackView.spacing = 30
        [nickNameTextField, heightTextField, weightTextField].forEach { textField in
            textField?.borderInactiveColor = UIColor.white
            textField?.borderActiveColor = UIColor.white
            textField?.placeholderColor = UIColor.white
            textField?.autocorrectionType = .no
            textField?.textColor = UIColor.white
        }
        nickNameTextField.placeholder = "닉네임을 설정해주세요"
        nickNameTextField.keyboardType = .namePhonePad
        nickNameTextField.text = UserDefaults.standard.string(forKey: "nickName")
        
        heightTextField.placeholder = "키(cm)를 설정해주세요"
        heightTextField.keyboardType = .numberPad
        heightTextField.text = UserDefaults.standard.string(forKey: "userHeight")
        
        weightTextField.placeholder = "몸무게(kg)를 설정해주세요"
        weightTextField.keyboardType = .numberPad
        weightTextField.text = UserDefaults.standard.string(forKey: "userWeight")
    }
    
    // Check TextField Validation
    func checkTextFieldValidation() {
        guard let nickName = nickNameTextField.text, nickName != "" else {
            popFailAlert(error: .emptyNickName)
            return
        }
        guard let height = heightTextField.text, height != "" else {
            popFailAlert(error: .emptyHeight)
            return
        }
        guard let weight = weightTextField.text, weight != "" else {
            popFailAlert(error: .emptyWeight)
            return
        }
        UserDefaults.standard.set(nickNameTextField.text, forKey: "nickName")
        UserDefaults.standard.set(heightTextField.text, forKey: "userHeight")
        UserDefaults.standard.set(weightTextField.text, forKey: "userWeight")
        popSuccessAlert()
    }
    
}
