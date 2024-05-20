//
//  UserJoinViewController.swift
//  NetflixProject
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

class UserJoinViewController: UIViewController {

    @IBOutlet private var userIDTextField: UITextField!
    @IBOutlet private var userPwdTextField: UITextField!
    @IBOutlet private var userNicknameTextField: UITextField!
    @IBOutlet private var userLocationTextField: UITextField!
    @IBOutlet private var referralCodeTextField: UITextField!
    
    @IBOutlet private var joinButton: UIButton!
    
    @IBOutlet private var additionalInfoSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUserIDTextField()
        self.setUpUserPwdTextField()
        self.setUpUserNicknameTextField()
        self.setUpUserLocationTextField()
        self.setUpReferralCodeTextField()
        
        self.setUpJoinButton()
        self.setUpAdditionalInfoSwitch()
    }
    
    @IBAction func joinButtonTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        
        guard let userID = userIDTextField.text, !userID.isEmpty,
              let userPwd = userPwdTextField.text, userPwd.count >= 6 else {
            showAlert(message: "사용자 ID와 비밀번호를 확인해주세요. 비밀번호는 6자리 이상이어야 합니다.")
            return
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
}


//MARK: - Set Up Subviews
extension UserJoinViewController {
    private func setUpUserIDTextField() {
        self.setUpTextField(textField: self.userIDTextField, placeholder: "이메일 주소 또는 전화번호")
    }
    
    private func setUpUserPwdTextField() {
        self.setUpTextField(textField: self.userPwdTextField, placeholder: "비밀번호")
        self.userPwdTextField.isSecureTextEntry = true
    }
    
    private func setUpUserNicknameTextField() {
        self.setUpTextField(textField: self.userNicknameTextField, placeholder: "닉네임")
    }
    
    private func setUpUserLocationTextField() {
        self.setUpTextField(textField: self.userLocationTextField, placeholder: "위치")
    }
    
    private func setUpReferralCodeTextField() {
        self.setUpTextField(textField: self.referralCodeTextField, placeholder: "추천 코드 입력")
        self.referralCodeTextField.keyboardType = .numberPad
    }
    
    private func setUpJoinButton() {
        self.joinButton.backgroundColor = .white
        self.joinButton.setTitle("회원가입", for: .normal)
        self.joinButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.joinButton.setTitleColor(.black, for: .normal)
    }
    
    private func setUpAdditionalInfoSwitch() {
        self.additionalInfoSwitch.onTintColor = .orange
        self.additionalInfoSwitch.setOn(true, animated: true)
    }
}

//MARK: - Rendering Utility Method
extension UserJoinViewController {
    private func setUpTextField(textField: UITextField, placeholder: String, keyboardType: UIKeyboardType = .default) {
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.keyboardType = keyboardType
    }
}

