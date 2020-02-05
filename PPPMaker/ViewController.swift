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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let simkey = SymmetricKey(size: .bits256)
        //Se inicializa el contador en 0
        var counter : UInt128 = 0
        let dataCounter = Data(bytes: &counter ,count: MemoryLayout.size(ofValue:counter))

        //Estimamos el set de caracteres y su tamaño en otra variable
        let characterSet: [String] = ["A","E","I","O","U","a","e","i","o","u"]
        let characterSetSize = characterSet.count
        print("tamaño del set =  \(characterSetSize)")

        //Vamos a cifrar el contador

        let counterAes = try! AES.GCM.seal(dataCounter, using: simkey).combined!

       // var intValueAes:Int = counterAes.withUnsafeBytes {$0.pointee}
        
       // let intValueAes = counterAes.withUnsafeBytes { $0.load(as: UInt32.self) }
            let intValueAes = counterAes.withUnsafeBytes { $0.load(as: UInt32.self) }
           print(intValueAes)
        
    
        let mod = divStep(aesInt: Int(intValueAes), setSize: characterSetSize)
        
       
            
        mapping(res: mod, set: characterSet)
            
       
    }
    
    func divStep(aesInt: Int, setSize: Int) -> Int {
        let module = aesInt % setSize
        print(module)
        return module
    }
    
    func mapping(res: Int, set: [String]) -> Character{
        
        let mappedChar = Character(set[res])
        print(mappedChar)
        return mappedChar
        
    }


}

