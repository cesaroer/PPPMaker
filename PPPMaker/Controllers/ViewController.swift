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
        
    let charSet: [String] = ["A","E","I","O","U","a","e","i","o","u"]
    let charSetSize = charSet.count
    // arreglo para las cartas
        var card : [Character] = []
        var cardSection:String = ""
        
    let simkey = SymmetricKey(size: .bits256)
     
        keySowLabel.text = simkey.withUnsafeBytes{
            return Data(Array($0)).base64EncodedString() }
        
        var alphabetString: String = ""
        alphabetString = charSet.joined(separator: " , ")
        alphabetLabel.text = alphabetString
        
      //        //Se inicializa el contador en 0
    var counter : UInt128 = 0
    
        
    for _ in 0...127{
       
//Se declara una variable que contendrá el entero de 128bits que corresponda al protocolo data
        
        let dataCounter = Data(bytes: &counter ,count: MemoryLayout.size(ofValue:counter))

// aqui creamos una variable que contendra la salida de AES
        let counterAes = try! AES.GCM.seal(dataCounter, using: simkey).combined!

    // aqui se crea una cinstante que tiene el entero de la salida del AES
        let intValueAes = counterAes.withUnsafeBytes { $0.load(as: UInt32.self) }
           print(intValueAes)
    // division 128 con residuo
       let res =  divStep(aesInt: Int(intValueAes), setSize: charSetSize)
    // mapeado con el alfabeto
       let char = mapping(res: res, set: charSet)
        card.append(char)
    
    
        counter = counter + 1
        
        }//End for
        
        for i in 0...127{
            cardSection.append(card[i])
        }
        print(cardSection)
        let a = cardSection.split(by: 4).count
        print(cardSection.split(by: 4))
        print(a)
        
        let b = cardSection.split(by: 4)
        
        print(b[1])
        
       
}

   
    
    @IBAction func keyGenerator(_ sender: UIButton) {
        
        let simkey = SymmetricKey(size: .bits256)
               //        //Se inicializa el contador en 0
               keySowLabel.text = simkey.withUnsafeBytes{
                   return Data(Array($0)).base64EncodedString() }
        
    }
//    func divStep(aesInt: Int, setSize: Int) -> Int {
//        let module = aesInt % setSize
//        print(module)
//        return module
//    }
//
//    func mapping(res: Int, set: [String]) -> Character{
//
//        let mappedChar = Character(set[res])
//        print(mappedChar)
//        return mappedChar
//
//      }
    
    
    
   

    


}

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}



