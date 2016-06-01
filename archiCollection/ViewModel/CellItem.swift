//
//  CellViewModel.swift
//  collectionArchi
//
//  Created by Florian BASSO on 16/03/2016.
//  Copyright © 2016 Florian BASSO. All rights reserved.
//

import Foundation
import UIKit

protocol CellItem {
    
    func reuseIdentifier() -> String
    func cellNib() -> UINib?
    func configureCell(cell: UICollectionViewCell)
    func cellSize(maxSize: CGSize) -> CGSize
    func register(collectionView: UICollectionView)    
}

extension CellItem {
    
    func register(collectionView: UICollectionView) {
        let nib = self.cellNib()
        let reuseIdentifier = self.reuseIdentifier()
        collectionView.registerNib(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func cellNib() -> UINib? {
        return UINib(nibName: self.reuseIdentifier(), bundle: NSBundle.mainBundle())
    }
    
}