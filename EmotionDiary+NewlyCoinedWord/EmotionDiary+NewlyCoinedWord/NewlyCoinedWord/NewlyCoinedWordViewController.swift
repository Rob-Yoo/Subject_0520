//
//  NewlyCoinedWordViewController.swift
//  EmotionDiary+NewlyCoinedWord
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var searchButton: UIButton!
    
    @IBOutlet private var wordButtons: [UIButton]!
    
    @IBOutlet private var resultBackgroundImageView: UIImageView!
    @IBOutlet private var resultLabel: UILabel!

    private var searchingText: String = ""
    
    private var newlyCoinedWordDictionary = [
        "꾸안꾸": "'꾸민 듯 안 꾸민 듯'의 줄임말!",
        "아아": "'아이스 아메리카노'의 줄임말!",
        "삼귀자": "연애를 시작하기 전 썸 단계!",
        "저메추": "'저넉 메뉴 추천'의 줄임말!",
        "완내스": "'완전 내 스타일'의 줄임말!",
        "분좋카": "'분위기 좋은 카페'의 줄임말!",
        "700": "'귀여워'의 초성인 'ㄱㅇㅇ'의 숫자 버전!",
        "자강두천": "'자존심 강한 두 천재의 대결'의 줄임말!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpSearchTextField()
        self.setUpSearchButton()

        self.setUpWordButtons()

        self.setUpResultBackgroundImageView()
        self.setUpResultLabel()
    }

    @IBAction func searchTextFieldOnExit(_ sender: UITextField) {
        self.showResult()
    }
    
    @IBAction func searchTextFieldChanged(_ sender: UITextField) {
        self.searchingText = sender.text ?? ""
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        self.showResult()
        self.view.endEditing(true)
    }
    
    @IBAction func emptyScreenTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        self.searchingText = sender.currentTitle ?? ""
        self.showResult()
        self.searchTextField.text = ""
        self.searchingText = ""
        self.view.endEditing(true)
    }
    
}

//MARK: - Set Up Subviews
extension NewlyCoinedWordViewController {
    private func setUpSearchTextField() {
        self.searchTextField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        self.searchTextField.leftViewMode = .always

        self.searchTextField.placeholder = "신조어를 검색해보세요..."
        self.searchTextField.textColor = .black
        self.searchTextField.borderStyle = .none
        self.searchTextField.backgroundColor = .white
        
        self.searchTextField.autocorrectionType = .no
    }
    
    private func setUpSearchButton() {
        self.searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        self.searchButton.setTitle("", for: .normal)
        self.searchButton.tintColor = .white
    }
    
    private func setUpWordButtons() {
        let newlyCoinedWords = self.newlyCoinedWordDictionary.keys.shuffled()
        
        (0..<self.wordButtons.count).forEach {
            self.setUpWordButton(wordButton: self.wordButtons[$0], word: newlyCoinedWords[$0])
        }
    }
    
    private func setUpResultBackgroundImageView() {
        self.resultBackgroundImageView.image = UIImage.background
        self.resultBackgroundImageView.contentMode = .scaleAspectFill
    }
    
    private func setUpResultLabel() {
        self.resultLabel.text = "검색 결과가 없습니다."
        self.resultLabel.textColor = .black
        self.resultLabel.textAlignment = .center
        self.resultLabel.font = .systemFont(ofSize: 17, weight: .medium)
    }
}

//MARK: - Presentation Logic
extension NewlyCoinedWordViewController {
    private func showResult() {
        if let result = self.newlyCoinedWordDictionary[self.searchingText] {
            self.resultLabel.text = result
        } else {
            // 결과가 없는 단어 검색 시 신조어 추천 버튼의 단어들이 계속 바뀜

            self.resultLabel.text = "검색 결과가 없습니다."
            self.setUpWordButtons()
        }
    }
}

//MARK: - Rendering Utility Methods
extension NewlyCoinedWordViewController {
    private func setUpWordButton(wordButton: UIButton, word: String) {
        wordButton.setTitle(word, for: .normal)
        wordButton.setTitleColor(.black, for: .normal)
        wordButton.titleLabel?.font = .systemFont(ofSize: 13)
    
        wordButton.backgroundColor = .clear
        wordButton.layer.cornerRadius = 10
        wordButton.layer.borderColor = UIColor.black.cgColor
        wordButton.layer.borderWidth = 1
    }
}

