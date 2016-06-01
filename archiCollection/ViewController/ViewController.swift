//
//  ViewController.swift
//  collectionArchi
//
//  Created by Florian BASSO on 16/03/2016.
//  Copyright © 2016 Florian BASSO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var collectionView: UICollectionView!
    lazy var viewModel: ViewModel = ViewModel(delegate: self)
    var items = [CellItem]()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewModel.load()
    }
    
    func registerCells() {
        for item in self.items {
            item.register(self.collectionView)
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
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

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let item = items[indexPath.row]
        let width = collectionView.frame.size.width
        return item.cellSize(CGSize(width: floor(width), height: collectionView.frame.size.height))
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 8
    }
}

// MARK: - EventsListViewModelDelegate
extension ViewController: ViewModelDelegate {
    func viewModelDidStartLoad() {
        print("Started !")
    }
    
    func viewModelDidLoad() {
        self.items = self.viewModel.items
        self.registerCells()
        self.collectionView.reloadData()
    }
    
    func viewModelDidFail() {
        print("Shit happens...")
    }
}