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
        
        //Inicializamos nuestro CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        
         loadData()
         collectionView?.reloadData()
    
    }
        
    
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
    //Cargamos datos del color
                cell.myLabel.sizeToFit()
            
        return cell
        
    }
    
//Tamaño de la celda
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
    
    
//Celda seleccionada
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // Declaramos nueva celda y hacemos que cuando la toquemos cambie de color
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.myLabel.text = cardToCell[indexPath.section][indexPath.row]
        cell.myLabel.backgroundColor = .red
      //  let cellCoordColored = [indexPath.section][indexPath.row]
      //  UserDefaults.standard.set(cellCoordColored,forKey: "cellColor")
        print(cell.myLabel.text!)
    }
    
}



  

