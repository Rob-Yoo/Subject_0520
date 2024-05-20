//
//  EmotionDiaryViewController.swift
//  EmotionDiary+NewlyCoinedWord
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {

    @IBOutlet private var backgroundImageView: UIImageView!
    
    @IBOutlet private var emotionButtons: [UIButton]!
    @IBOutlet private var countLabels: [UILabel]!
    
    private var emotionDataArray: [EmotionDiaryModel] = [
        EmotionDiaryModel(image: .slime1, description: "행복해"),
        EmotionDiaryModel(image: .slime2, description: "좋아해"),
        EmotionDiaryModel(image: .slime3, description: "사랑해"),
        EmotionDiaryModel(image: .slime4, description: "분노해"),
        EmotionDiaryModel(image: .slime5, description: "퍙범해"),
        EmotionDiaryModel(image: .slime6, description: "피곤해"),
        EmotionDiaryModel(image: .slime7, description: "당황해"),
        EmotionDiaryModel(image: .slime8, description: "우울해"),
        EmotionDiaryModel(image: .slime9, description: "슬퍼해"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpBackgroundImageView()
        self.setUpEmotionViews()
    }
    
    @IBAction private func emotionButtonTapped(_ sender: UIButton) {
        let countLabel = self.countLabels[sender.tag]

        self.emotionDataArray[sender.tag].updateCount()
        self.setUpCountLabel(label: countLabel, count: self.emotionDataArray[sender.tag].count, description: self.emotionDataArray[sender.tag].description)
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        (0..<self.emotionDataArray.count).forEach {
            self.emotionDataArray[$0].resetCount()
            self.setUpCountLabel(label: self.countLabels[$0], count: self.emotionDataArray[$0].count, description:  self.emotionDataArray[$0].description)
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
            let (count, image, description) = self.emotionDataArray[$0].provideEmotionData()
            
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
