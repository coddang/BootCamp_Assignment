//
//  SignInViewController.swift
//  chanflix_login_page
//
//  Created by LEO YANG on 2021/10/06.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailOrPhoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var recommendationCodeTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var changeStackViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
        
        [emailOrPhoneNumberTextField, passwordTextField, nicknameTextField, locationTextField, recommendationCodeTextField].forEach { button in
            button?.textAlignment = .center
            button?.textColor = UIColor.white
        }
        
        updateTextFieldPlaceholder(in: emailOrPhoneNumberTextField, placeholder: "이메일 주소 또는 전화번호")
        updateTextFieldPlaceholder(in: passwordTextField, placeholder: "비밀번호")
        updateTextFieldPlaceholder(in: nicknameTextField, placeholder: "닉네임")
        updateTextFieldPlaceholder(in: locationTextField, placeholder: "위치")
        updateTextFieldPlaceholder(in: recommendationCodeTextField, placeholder: "추천 코드 입력")
        
        locationTextField.textContentType = .location
        recommendationCodeTextField.keyboardType = .numberPad

        signInButton.layer.cornerRadius = 8
        signInButton.setTitle("회원가입", for: .normal)
        signInButton.backgroundColor = UIColor.white
    }
    
    func updateTextFieldPlaceholder(in textField: UITextField, placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    func alertMessage(message: String, buttonMsg: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: buttonMsg, style: .destructive, handler: nil)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func tappedBG(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func passwordEditingChanged(_ sender: UITextField) {
        if passwordTextField.text?.count ?? 0 > 6 {
            passwordTextField.deleteBackward()
        }
    }

    @IBAction func tappedSignInButton(_ sender: UIButton) {
        if emailOrPhoneNumberTextField.text!.contains("@") && emailOrPhoneNumberTextField.text!.contains(".") &&
            !emailOrPhoneNumberTextField.text!.contains(" ") &&
            passwordTextField.text!.count >= 6 {
            alertMessage(message: "로그인에 성공했습니다.", buttonMsg: "확인")
            print("회원가입 정보 확인")
            print("ID: \(String(describing: emailOrPhoneNumberTextField.text))")
            print("NICK: \(String(describing: nicknameTextField.text))")
            print("LOCATION: \(String(describing: locationTextField.text))")
            print("CODE: \(String(describing: recommendationCodeTextField.text))")
        } else {
            alertMessage(message: "올바른 이메일 혹은 비밀번호를 입력하세요.", buttonMsg: "다시 입력하기")
        }
    }
    
    @IBAction func changeStackViewClicked(_ sender: UISwitch) {
        let hiddenAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) { [weak self] in
            self?.nicknameTextField.isHidden.toggle()
            self?.locationTextField.isHidden.toggle()
            self?.recommendationCodeTextField.isHidden.toggle()
        }
        hiddenAnimator.startAnimation()
    }
}

