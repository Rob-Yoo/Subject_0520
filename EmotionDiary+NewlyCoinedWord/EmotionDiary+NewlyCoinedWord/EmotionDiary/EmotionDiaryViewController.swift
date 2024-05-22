//
//  EmotionDiaryViewController.swift
//  EmotionDiary+NewlyCoinedWord
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

typealias EmotionDiaryAsset = (image: UIImage, description: String)

class EmotionDiaryViewController: UIViewController {

    @IBOutlet private var backgroundImageView: UIImageView!
    
    @IBOutlet private var emotionButtons: [UIButton]!
    @IBOutlet private var countLabels: [UILabel]!
    
    static var selectedCountArray: [Int] = Array(repeating: 0, count: 9) // AppDelegate의 didFinishingLaunchingWithOptions 메서드에서 UserDefaults에 저장된 값으로 설정됨
    
    private var emotionAssetArray: [EmotionDiaryAsset] = [
        (image: .slime1, description: "행복해"),
        (image: .slime2, description: "좋아해"),
        (image: .slime3, description: "사랑해"),
        (image: .slime4, description: "분노해"),
        (image: .slime5, description: "퍙범해"),
        (image: .slime6, description: "피곤해"),
        (image: .slime7, description: "당황해"),
        (image: .slime8, description: "우울해"),
        (image: .slime9, description: "슬퍼해")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpBackgroundImageView()
        self.setUpEmotionViews()
    }
    
    @IBAction private func emotionButtonTapped(_ sender: UIButton) {
        let countLabel = self.countLabels[sender.tag]
        let description = self.emotionAssetArray[sender.tag].description
        let count = EmotionDiaryViewController.selectedCountArray[sender.tag]
        
        self.setUpCountLabel(label: countLabel, count: count + 1, description: description)
        EmotionDiaryViewController.selectedCountArray[sender.tag] = count + 1
    }
    
    @IBAction private func refreshButtonTapped(_ sender: UIBarButtonItem) {
        EmotionDiaryViewController.selectedCountArray = Array(repeating: 0, count: 9)

        (0..<self.emotionAssetArray.count).forEach {
            self.setUpCountLabel(label: self.countLabels[$0], count: 0, description: self.emotionAssetArray[$0].description)
        }
    }
    
}

//MARK: - Set Up Subviews
extension EmotionDiaryViewController {
    private func setUpBackgroundImageView() {
        self.backgroundImageView.image = UIImage.emotionBackground
        self.backgroundImageView.contentMode = .scaleAspectFill
    }
    
    private func setUpEmotionViews() {
        (0..<self.emotionButtons.count).forEach {
            let btn = self.emotionButtons[$0]
            let label = self.countLabels[$0]
            let (image, description) = self.emotionAssetArray[$0]
            let count = EmotionDiaryViewController.selectedCountArray[$0]
            
            self.setUpEmotionButton(button: btn, image: image)
            self.setUpCountLabel(label: label, count: count, description: description)
        }
    }
}

//MARK: - Rendering Utility Methods
extension EmotionDiaryViewController {
    private func setUpEmotionButton(button: UIButton, image: UIImage) {
        var configuration = UIButton.Configuration.plain()
        
        configuration.background.image = image
        button.configuration = configuration
        button.setTitle("", for: .normal)
    }
    
    private func setUpCountLabel(label: UILabel, count: Int, description: String) {
        label.text = description + " \(count)"
    }
}
