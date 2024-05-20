//
//  HomeViewController.swift
//  NetflixProject
//
//  Created by Jinyoung Yoo on 5/20/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var userNameLabel: UILabel!
    
    @IBOutlet private var movieImageViews: [UIImageView]!
    @IBOutlet private var netflixBadges: [UIImageView]!
    @IBOutlet private var topTenBadges: [UIImageView]!
    
    @IBOutlet var hotListLabel: UILabel!

    @IBOutlet var playButton: UIButton!
    @IBOutlet var addWishListButton: UIButton!

    private var images: [UIImage] = [
        .극한직업, .노량, .더퍼스트슬램덩크, .도둑들, .명량, .밀수, .범죄도시3, .베테랑, .부산행, .신과함께인과연, .아바타물의길, .암살, .해운대
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.setUpUserNameLabel()
        self.setUpMovieImageViews()
        self.setUpPlayButton()
        self.setUpAddWishListButton()
        self.setUpHotListLabel()
    }
    
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        self.images.shuffle()
        self.setUpMovieImageViews()
    }
}

//MARK: - Set Up Subviews
extension HomeViewController {
    private func setUpUserNameLabel() {
        self.userNameLabel.text = "진영님"
        self.userNameLabel.textColor = .white
        self.userNameLabel.textAlignment = .center
        self.userNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setUpMovieImageViews() {
        (0..<self.movieImageViews.count).forEach {
            self.setUpMovieImageView(imageView: movieImageViews[$0], image: images[$0])
            self.setUpBadgeImageView(imageView: netflixBadges[$0], image: .singleBadge)
            self.setUpBadgeImageView(imageView: topTenBadges[$0], image: .top10Badge)
        }
    }
    
    private func setUpMovieImageView(imageView: UIImageView, image: UIImage) {
        imageView.layer.cornerRadius = 10
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
    
    private func setUpBadgeImageView(imageView: UIImageView, image: UIImage) {
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = Bool.random()
    }
    
    private func setUpPlayButton() {
        self.playButton.setImage(.playNormal, for: .normal)
        self.playButton.setTitle("", for: .normal)
    }
    
    private func setUpAddWishListButton() {
        let imgConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 10))

        self.addWishListButton.setImage(.init(systemName: "plus", withConfiguration: imgConfiguration), for: .normal)
        self.addWishListButton.setTitle(" 내가 찜한 리스트", for: .normal)
        self.addWishListButton.titleLabel?.font = .systemFont(ofSize: 10)
        self.addWishListButton.tintColor = .white
        self.addWishListButton.backgroundColor = .darkGray
        self.addWishListButton.layer.cornerRadius = 5
    }
    
    private func setUpHotListLabel() {
        self.hotListLabel.text = "지금 뜨는 콘텐츠"
        self.hotListLabel.textColor = .white
    }
}

