//
//  TitleTableViewCell.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 31.07.2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
        
    }()
    
    private let titlePosterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // ??
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        applyConstarints()
    }
    
    
    private func applyConstarints(){
        let titlePosterImageViewConstarints = [
            titlePosterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),//?
            titlePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePosterImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterImage.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
  
        ]
        
        let playButtonConstraints = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            playButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(titlePosterImageViewConstarints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)

        
    }
    
    public func configure(with model: TitleViewModel){
                
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {
          return
        }
        
        titlePosterImage.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
