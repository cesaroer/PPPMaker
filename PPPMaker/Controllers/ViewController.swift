//
//  ViewController.swift
//  PPPMaker
//
//  Created by Cesar on 03/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit
import CryptoKit

class ViewController: UIViewController {

    @IBOutlet weak var keySowLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var alphabetLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    //Añadiendo alfabeto a label de VC
        let alphabethString = charSet.joined(separator: ", ")
        alphabetLabel.text = alphabethString
        loadData()
       keySowLabel.text = legibleSimKey
       
}

    @IBAction func keyGenerator(_ sender: UIButton) {
    //Se crea nueva llave
         simkey = SymmetricKey(size: .bits256)
        legibleSimKey = simkey.withUnsafeBytes { return Data(Array($0)).base64EncodedString()}
    //Se inicializa el contador en 0
        keySowLabel.text = legibleSimKey
    //Iniciamos proceso del algoritmo
        let newCardSections = pppStartAlgorithm()
         cardToCell = cardGenerator.pppStartGenerateCard.cardMatrixGenerator(headers: cellHeaders, disortedCardArray: newCardSections)
        saveData()
        loadData()
    }
        


}





