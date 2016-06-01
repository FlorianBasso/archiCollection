//
//  ViewModel.swift
//  collectionArchi
//
//  Created by Florian BASSO on 16/03/2016.
//  Copyright © 2016 Florian BASSO. All rights reserved.
//

import Foundation

protocol ViewModelDelegate {
    
    func viewModelDidStartLoad()
    func viewModelDidLoad()
    func viewModelDidFail()
}


class ViewModel {
    
    private var delegate: ViewModelDelegate
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
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    func load() {
        self.delegate.viewModelDidStartLoad()
        self.addItems()
        self.delegate.viewModelDidLoad()
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