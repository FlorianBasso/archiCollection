//
//  MovieCellItemTests.swift
//  archiCollection
//
//  Created by Florian BASSO on 13/04/2016.
//  Copyright © 2016 Meetic. All rights reserved.
//

import XCTest
@testable import archiCollection

class MovieCellItemTests: XCTestCase {
    
    func test_init_shouldSetImageName() {
        // Given & When
        let item = self.itemToTest(.Cover)
        
        // Then
        XCTAssertEqual(item.type, MovieType.Cover)
        XCTAssertEqual(item.movie.title, "titleMovie")
        XCTAssertEqual(item.movie.imageName, "imageMovie")
    }
    
    func test_nibNameForType() {
        
        for type in MovieType.allValues {
            
            // Given
            let item = self.itemToTest(type)
            
            // When
            let nibName = item.nibNameForType(type)
            
            // Then
            XCTAssertEqual(nibName, "Movie\(type.rawValue)Cell")
        }
        
    }
    
    func test_heightForType() {
        
        for type in MovieType.allValues {
            
            // Given
            let item = self.itemToTest(type)
            let expectedHeight = (type == .Cover ? CGFloat(200) : CGFloat(100))
            
            // When
            let height = item.heightForType(type)
            
            // Then
            XCTAssertEqual(height, expectedHeight)
        }
        
    }
    
    func test_reuseIdentifier() {
        
        for type in MovieType.allValues {
            
            // Given
            let item = self.itemToTest(type)
            
            // When
            let reuseIdentifier = item.reuseIdentifier()
            
            // Then
            XCTAssertEqual(reuseIdentifier, "MovieCell\(type.rawValue)")
        }
        
    }
    
    func test_cellSize() {
        
        for type in MovieType.allValues {
            
            // Given
            let item = self.itemToTest(type)
            let height = item.heightForType(type)
            
            // When
            let size = item.cellSize(CGSize(width: 400, height: 200))
            
            // Then
            XCTAssertEqual(size.width, 400)
            XCTAssertEqual(size.height, height)
        }
    }
    
    func test_cellNib() {
        
        for type in MovieType.allValues {
            // Given
            let item = self.itemToTest(type)
            
            // When
            let nib = item.cellNib()
            
            // Then
            XCTAssertNotNil(nib)
        }
    }
    
    func itemToTest(type: MovieType) -> MovieCellItem {
        let movie = Movie(title: "titleMovie", imageName: "imageMovie")
        return MovieCellItem(movie: movie, type: type)
    }
    
}
