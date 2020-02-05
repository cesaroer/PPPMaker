//
//  CollectionViewController.swift
//  PPPMaker
//
//  Created by Cesar D4 on 05/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit
private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Regis
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        
        
        cell.cardSectionLabel.text = "aaaa"
        
        return cell
    }

}
