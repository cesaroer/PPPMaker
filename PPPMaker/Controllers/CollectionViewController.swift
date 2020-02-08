//
//  CollectionViewController.swift
//  PPPMaker
//
//  Created by Cesar on 07/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit

let ArrayTest = ["1","2","3","4"]
var cardToCell:[[String]] = []

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var savedCard: [[String]] = cardToCell
       
   
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
        
//        cardToCell = pppStart()
        
        //Inicializamos nuestro CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        
         loadData()
         collectionView?.reloadData()
    
    }
    
    
    
    
//  public  func saveData(){
//        let sessionData = UserDefaults.standard
//        sessionData.set(cardToCell,forKey: "data")
//        sessionData.set(simkey,forKey:"textFieldKey")
//    }
//
//    public func loadData(){
//        let sessionData = UserDefaults.standard
//        let arrayData = sessionData.array(forKey: "data") as? [[String]]
//        let loadedSimetricKey = sessionData.string(forKey: "textFieldKey")
//            legibleSimKey = loadedSimetricKey ?? ""
//        self.savedCard = arrayData ?? []
//        cardToCell = savedCard
//        collectionView?.reloadData()
//    }
    
    
    
    
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cardToCell.count
        }
    
                  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardToCell[section].count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
            cell.myLabel.text = cardToCell[indexPath.section][indexPath.row]
                cell.myLabel.textAlignment = .center
                cell.myLabel.sizeToFit()
            
        return cell
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
}


public  func saveData(){
      UserDefaults.standard.set(cardToCell,forKey: "data")
      UserDefaults.standard.set(legibleSimKey,forKey:"textFieldKey")
  }
  
  public func loadData(){
      let sessionData = UserDefaults.standard
      let arrayData = sessionData.array(forKey: "data") as? [[String]]
      let loadedSimetricKey = sessionData.string(forKey: "textFieldKey")
          legibleSimKey = loadedSimetricKey ?? ""
     
      cardToCell   = arrayData ?? []
    
  }
