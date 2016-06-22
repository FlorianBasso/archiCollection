//
//  ViewModel.swift
//  collectionArchi
//
//  Created by Florian BASSO on 16/03/2016.
//  Copyright © 2016 Florian BASSO. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelDelegate: class {
    func viewModelDidStartLoad()
    func viewModelDidLoad()
    func viewModelDidFail()
}

class ViewModel: NSObject {
    
    // MARK: - Properties
    private weak var delegate: ViewModelDelegate?
    var items = [CellItem]()
    lazy var movies: [Movie] = {
        
        var tempMovies = [Movie]()
        
        // Toy Story
        let toyStory = Movie(title: "Toy Story 3", imageName: "toyStory")
        tempMovies.append(toyStory)
        
        // Big Hero Six
        let bigHeroSix = Movie(title: "Big Hero 6", imageName: "bigHeroSix")
        tempMovies.append(bigHeroSix)
        
        // Zootopia
        let zootopia = Movie(title: "Zootopia", imageName: "zootopia")
        tempMovies.append(zootopia)
        
        return tempMovies
    }()
    
    // MARK: - Initialization
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Configuration
    func load() {
        self.delegate?.viewModelDidStartLoad()
        self.addItems()
        self.delegate?.viewModelDidLoad()
    }
    
    func addItems() {
        var tempItems = [CellItem]()
        
        // Adds movie items        
        for movieType in MovieType.allValues {
            
            for index in 0..<self.movies.count {
                let movie = self.movies[index]
                let newItem = MovieCellItem(movie: movie, type: movieType)
                tempItems.append(newItem)
                                
                if index == self.movies.count - 1 {
                    let adsItem = AdsCellItem(imageName: "adBanner")
                    tempItems.append(adsItem)
                }
            }
        }
        
        self.items = tempItems
    }
}

// MARK: - UICollectionViewDataSource
extension ViewModel: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = self.items[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(item.reuseIdentifier(), forIndexPath: indexPath)
        item.configureCell(cell)
        return cell
    }
}