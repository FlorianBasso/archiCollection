//
//  AdsCellItemTests.swift
//  archiCollection
//
//  Created by Florian BASSO on 13/04/2016.
//  Copyright © 2016 Meetic. All rights reserved.
//

import XCTest
@testable import archiCollection

class AdsCellItemTests: XCTestCase {
    
    func test_init_shouldSetImageName() {
        // Given & When
        let item = self.itemToTest()
        
        // Then
        XCTAssertEqual(item.imageName, "imageTest")
    }
    
    func test_reuseIdentifier() {
        // Given
        let item = self.itemToTest()
        
        // When
        let reuseIdentifier = item.reuseIdentifier()
        
        // Then
        XCTAssertEqual(reuseIdentifier, "AdsCell")
    }
    
    func test_cellSize() {
        // Given
        let item = self.itemToTest()
        
        // When
        let size = item.cellSize(CGSize(width: 400, height: 200))
        
        // Then
        XCTAssertEqual(size.width, 400)
        XCTAssertEqual(size.height, 100)
    }
    
    func test_cellNib() {
        // Given
        let item = self.itemToTest()
        
        // When
        let nib = item.cellNib()
        
        // Then
        XCTAssertNotNil(nib)
    }
    
    func itemToTest() -> AdsCellItem {
        return AdsCellItem(imageName: "imageTest")
    }
}
