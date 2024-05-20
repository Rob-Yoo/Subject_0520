//
//  SavedContentsViewController.swift
//  NetflixProject
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

class SavedContentsListViewController: UIViewController {
    
    @IBOutlet private var contentTitleLabel: UILabel!
    
    @IBOutlet private var headTextLabel: UILabel!
    @IBOutlet private var subTextLabel: UILabel!
    
    @IBOutlet private var contentImageView: UIImageView!
    
    @IBOutlet private var settingButton: UIButton!
    @IBOutlet private var lookUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.setUpContentTitleLabel()
        self.setUpHeadTextLabel()
        self.setUpSubTextLabel()
        self.setUpContentImageView()
        self.setUpSettingButton()
        self.setUpLookUpButton()
    }
}

//MARK: - Set Up Subviews
extension SavedContentsListViewController {
    private func setUpContentTitleLabel() {
        self.contentTitleLabel.text = "저장한 콘텐츠 목록"
        self.contentTitleLabel.textAlignment = .center
        self.contentTitleLabel.textColor = .white
        self.contentTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    private func setUpHeadTextLabel() {
        self.headTextLabel.text = "'나만의 자동 저장' 기능"
        self.headTextLabel.textAlignment = .center
        self.headTextLabel.textColor = .white
        self.headTextLabel.font = .systemFont(ofSize: 25, weight: .semibold)
    }
    
    private func setUpSubTextLabel() {
        self.subTextLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.\n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이\n 없어요."
        self.subTextLabel.textAlignment = .center
        self.subTextLabel.textColor = .lightGray
        self.subTextLabel.font = .systemFont(ofSize: 15)
        self.subTextLabel.numberOfLines = 0
    }
    
    private func setUpContentImageView() {
        self.contentImageView.image = .dummy
        self.contentImageView.contentMode = .scaleAspectFill
    }
    
    private func setUpSettingButton() {

        self.settingButton.backgroundColor = .purple
        self.settingButton.layer.cornerRadius = 10
        self.settingButton.setTitle("설정하기", for: .normal)
        self.settingButton.setTitleColor(.white, for: .normal)
        self.settingButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    private func setUpLookUpButton() {
        self.lookUpButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        self.lookUpButton.setTitleColor(.black, for: .normal)
        self.lookUpButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        self.lookUpButton.backgroundColor = .white
        self.lookUpButton.layer.cornerRadius = 10
    }
}

