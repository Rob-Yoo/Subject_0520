//
//  EmotionDiaryModel.swift
//  EmotionDiary+NewlyCoinedWord
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

struct EmotionDiaryModel {
    var count: Int = Int.random(in: 0...9)
    let image: UIImage
    let description: String
    
    func provideEmotionData() -> (count: Int, image: UIImage, description: String) {
        return (count: count, image: image, description: description)
    }
    
    mutating func updateCount() {
        self.count += 1
    }
    
    mutating func resetCount() {
        self.count = Int.random(in: 0...9)
    }
}
