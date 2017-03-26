//
//  MainVC.swift
//  TacoPop
//
//  Created by Ravi Tiwari on 3/25/17.
//  Copyright © 2017 SelfStudy. All rights reserved.
//

import UIKit

class MainVC: UIViewController, DataServiceDelegate {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var ds: DataService = DataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ds = DataService.instance
        ds.delegate = self
        ds.loadDeliciousTacoData()
        ds.tacoArray.shuffle()
        
        headerView.addDropShadow()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Old way of doing it before our protocol/protocol extensions
        //        let nib = UINib(nibName: "TacoCell", bundle: nil)
        //        collectionView.register(nib, forCellWithReuseIdentifier: "TacoCell")
        collectionView.register(TacoCell.self)
        
    }
    
    func deliciousTacoDataloaded() {
        print("Delicious Taco Data is Loaded")
        collectionView.reloadData()
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ds.tacoArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Old way of doing it before our protocol/protocol extensions
        //        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell {
        //            cell.configureCell()
        //            return cell
        //        }
        //        return UICollectionViewCell()
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as TacoCell
        cell.configureCell(taco: ds.tacoArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            cell.shake()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 95)
    }}

