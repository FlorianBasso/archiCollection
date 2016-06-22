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
    var viewModel: ViewModel?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.viewModel = ViewModel(delegate: self)
        self.collectionView.dataSource = self.viewModel
        self.viewModel?.load()
    }
    
    func registerCells() {
        guard let vm = self.viewModel else {
            return
        }
        
        for item in vm.items {
            item.register(self.collectionView)
        }
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
        guard let vm = self.viewModel else {
            return CGSizeZero
        }
        let item = vm.items[indexPath.row]
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
        self.registerCells()
        self.collectionView.reloadData()
    }
    
    func viewModelDidFail() {
        print("Shit happens...")
    }
}