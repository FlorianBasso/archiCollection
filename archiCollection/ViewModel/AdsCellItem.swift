//
//  AdsViewModel.swift
//  collectionArchi
//
//  Created by Florian BASSO on 16/03/2016.
//  Copyright © 2016 Florian BASSO. All rights reserved.
//

import Foundation
import UIKit

struct AdsCellItem {
    
    // MARK: - Properties
    let imageName: String
    
    // MARK: - Initialization
    init(imageName: String) {
        self.imageName = imageName
    }
    
}

// MARK: - EventTableViewItem protocol
extension AdsCellItem: CellItem {
    func reuseIdentifier() -> String {
        return "AdsCell"
    }
    
    func configureCell(cell: UICollectionViewCell) {
        if let adsCell = cell as? AdsCell {
            adsCell.imageView.image = UIImage(named: self.imageName)
        }
    }
    
    func cellSize(maxSize: CGSize) -> CGSize {
        return CGSize(width: maxSize.width, height: 100)
    }
}