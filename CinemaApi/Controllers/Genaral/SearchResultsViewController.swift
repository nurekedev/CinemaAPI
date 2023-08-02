//
//  SearchResultsViewController.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 01.08.2023.
//

import UIKit


protocol SearchResultsViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDelegateDidTapItem(_ viewModel: TitlePreviewViewModel)
}


class SearchResultsViewController: UIViewController {
    
    
    
    public var titles: [Title] = [Title]()

    public var delegate: SearchResultsViewControllerDelegate?
    
    public let searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(searchCollectionView)
        
        
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self

    }
    
    override func viewDidLayoutSubviews() {
        searchCollectionView.frame = view.bounds
    }


}


extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        let titleName = title.original_title ?? ""
        
        ApiCaller.shared.getMovie(with: titleName) { [weak self]  result in
            switch result {
            case .success(let videoElem):
                self?.delegate?.searchResultsViewControllerDelegateDidTapItem(TitlePreviewViewModel(title: titleName, youtubeView: videoElem, titleOverview: title.overview ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
     
    }
}
