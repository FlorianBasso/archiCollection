//
//  MovieViewModel.swift
//  collectionArchi
//
//  Created by Florian BASSO on 16/03/2016.
//  Copyright © 2016 Florian BASSO. All rights reserved.
//

import Foundation
import UIKit

enum MovieType: String {
    case Poster = "Poster"
    case Cover = "Cover"
    case Side = "Side"
    
    static var allValues = [Cover, Poster, Side]
}

struct MovieCellItem {
    
    // MARK: - Properties
    let movie: Movie
    let type: MovieType
    
    // MARK: - Initialization
    init(movie: Movie, type: MovieType) {
        self.movie = movie
        self.type = type
    }
    
    // MARK: - Helper Methods
    func nibNameForType(type: MovieType) -> String {
        return "Movie\(type.rawValue)Cell"
    }
    
    func heightForType(type: MovieType) -> CGFloat {
        switch type {
        case .Cover:
            return 200
        default:
            return 100
        }
    }
}

// MARK: - CellItem protocol
extension MovieCellItem: CellItem {
    func reuseIdentifier() -> String {
        return "MovieCell\(self.type.rawValue)"
    }
    
    func configureCell(cell: UICollectionViewCell) {
        if let movieCell = cell as? MovieCell {
            movieCell.titleLabel.text = self.movie.title
            movieCell.titleLabel.textColor = UIColor.darkGrayColor()
            movieCell.imageView.image = UIImage(named: "\(self.movie.imageName)\(self.type.rawValue)")
        }
    }
    
    func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: self.heightForType(self.type))
    }
    
    
    func register(collectionView: UICollectionView) {
        let nib = self.cellNib()
        let reuseIdentifier = self.reuseIdentifier()
        collectionView.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func cellNib() -> UINib? {
        let nibName = self.nibNameForType(self.type)
        return UINib(nibName: nibName, bundle: NSBundle.mainBundle())
    }
}