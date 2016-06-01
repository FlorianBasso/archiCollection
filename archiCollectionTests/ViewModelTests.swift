//
//  archiCollectionTests.swift
//  archiCollectionTests
//
//  Created by Florian BASSO on 13/04/2016.
//  Copyright © 2016 Meetic. All rights reserved.
//

import XCTest
@testable import archiCollection

class archiCollectionTests: XCTestCase {
    
    func test_movies_shouldHaveCorrectData() {
        // Given
        let viewModel = self.viewModelToTest()
        let titles = ["Toy Story 3", "Big Hero 6", "Zootopia"]
        let images = ["toyStory", "bigHeroSix", "zootopia"]
        
        // When & Then
        XCTAssertEqual(viewModel.movies.count, 3)
        for index in 0..<viewModel.movies.count {
            let movie = viewModel.movies[index]
            let title = titles[index]
            let image = images[index]
            XCTAssertEqual(title, movie.title)
            XCTAssertEqual(image, movie.imageName)
        }
    }
    
    func test_load_shouldHaveItems() {
        // Given
        let viewModel = self.viewModelToTest()
        
        // When
        viewModel.load()
        
        // Then
        XCTAssertTrue(viewModel.items.count > 0)
    }
    
    func test_addItems_itemsShouldHaveCorrectCount() {
        // Given
        let viewModel = self.viewModelToTest()
        
        // When
        viewModel.addItems()
        
        // Then
        XCTAssertTrue(viewModel.items.count == 12)
       
    }
    
    
    func viewModelToTest() -> ViewModel {
        let viewController = ViewController()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        viewController.collectionView = collectionView
        let viewModel = ViewModel(delegate: viewController)
        return viewModel
    }
    
}
