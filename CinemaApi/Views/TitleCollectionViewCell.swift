//
//  TitleCollectionViewCell.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 30.07.2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let poster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // ?
        contentView.addSubview(poster)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        poster.frame = contentView.bounds
    }
    
    public func configure(with model: String){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
          return
        }
        
        poster.sd_setImage(with: url, completed: nil)
    }
    
    
}
