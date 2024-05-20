//
//  SearchViewController.swift
//  NetflixProject
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet private var contentTitleLabel: UILabel!

    @IBOutlet private var searchBackgroundView: UIView!
    @IBOutlet private var searchIconImageView: UIImageView!
    @IBOutlet private var searchTextField: UITextField!
    
    
    @IBOutlet private var upcomingMovieButton: UIButton!
    @IBOutlet private var popularContentsButton: UIButton!
    @IBOutlet private var topTenSeriesButton: UIButton!

    
    @IBOutlet private var headTextLabel: UILabel!
    @IBOutlet private var subTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.setUpContentTitleLabel()
        self.setUpSearchView()
        self.setUpUpcomingMovieButton()
        self.setUpPopularContentsButton()
        self.setUpTopTenSeriesButton()
        self.setUpHeadTextLabel()
        self.setUpSubTextLabel()
    }
    
    @IBAction func upcomingMovieButtonTapped(_ sender: UIButton) {
        self.upcomingMovieButtonSelected()

        self.popularContentsButtonUnselected()
        self.topTenSeriesButtonUnselected()
    }
    
    
    @IBAction func popularContentsButtonTapped(_ sender: UIButton) {
        self.popularContentsButtonSelected()

        self.upcomingMovieButtonUnselected()
        self.topTenSeriesButtonUnselected()
    }
    
    
    @IBAction func topTenSeriesButtonTapped(_ sender: UIButton) {
        self.topTenSeriesButtonSelected()

        self.upcomingMovieButtonUnselected()
        self.popularContentsButtonUnselected()
    }
}


//MARK: - Set Up Subviews
extension SearchViewController {
    private func setUpContentTitleLabel() {
        self.contentTitleLabel.text = "New & Hot 검색"
        self.contentTitleLabel.textAlignment = .center
        self.contentTitleLabel.textColor = .white
        self.contentTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    private func setUpSearchView() {
        self.searchBackgroundView.backgroundColor = .darkGray
        self.searchBackgroundView.layer.cornerRadius = 5

        self.searchIconImageView.tintColor = .white
        
        self.setUpSearchTextFieldView()
    }
    
    private func setUpSearchTextFieldView() {
        self.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "게임, 시리즈, 영화를 검색하세요...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        self.searchTextField.borderStyle = .none
        self.searchTextField.tintColor = .white
        self.searchTextField.textColor = .white
    }
    
    private func setUpUpcomingMovieButton() {
        self.setUpButton(btn: self.upcomingMovieButton, image: .blue, title: "공개 예정")
        self.upcomingMovieButtonSelected()
    }
    
    private func setUpPopularContentsButton() {
        self.setUpButton(btn: self.popularContentsButton, image: .turquoise, title: "모두의 인기 콘텐츠")
        self.popularContentsButtonUnselected()
    }
    
    private func setUpTopTenSeriesButton() {
        self.setUpButton(btn: self.topTenSeriesButton, image: .pink, title: "TOP 10 시리즈")
        self.topTenSeriesButtonUnselected()
    }
    
    private func setUpHeadTextLabel() {
        self.headTextLabel.text = "공개 예정 작품이 현재 없습니다."
        self.headTextLabel.textColor = .white
        self.headTextLabel.textAlignment = .center
        self.headTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setUpSubTextLabel() {
        self.subTextLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        self.subTextLabel.textColor = .lightGray
        self.subTextLabel.textAlignment = .center
        self.subTextLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
}

extension SearchViewController {
    private func setUpButton(btn: UIButton, image: UIImage, title: String) {
        btn.layer.cornerRadius = 10
        btn.setImage(image, for: .normal)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 11)
    }
}

//MARK: - Presentation Logic
extension SearchViewController {
    private func upcomingMovieButtonSelected() {
        self.headTextLabel.text = "공개 예정 작품이 현재 없습니다."
        self.upcomingMovieButton.backgroundColor = .white
        self.upcomingMovieButton.setTitleColor(.black, for: .normal)
    }
    
    private func upcomingMovieButtonUnselected() {
        self.upcomingMovieButton.backgroundColor = .clear
        self.upcomingMovieButton.setTitleColor(.white, for: .normal)
    }
    
    private func popularContentsButtonSelected() {
        self.headTextLabel.text = "모두의 인기 콘텐츠가 없습니다."
        self.popularContentsButton.backgroundColor = .white
        self.popularContentsButton.setTitleColor(.black, for: .normal)
    }
    
    private func popularContentsButtonUnselected() {
        self.popularContentsButton.backgroundColor = .clear
        self.popularContentsButton.setTitleColor(.white, for: .normal)
    }
    
    private func topTenSeriesButtonSelected() {
        self.headTextLabel.text = "TOP 10 시리즈가 없습니다."
        self.topTenSeriesButton.backgroundColor = .white
        self.topTenSeriesButton.setTitleColor(.black, for: .normal)
    }
    
    private func topTenSeriesButtonUnselected() {
        self.topTenSeriesButton.backgroundColor = .clear
        self.topTenSeriesButton.setTitleColor(.white, for: .normal)
    }
}

