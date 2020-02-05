//
//  KeyGenerator.swift
//  PPPMaker
//
//  Created by Cesar on 03/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import UIKit
import CryptoKit


let simkey = SymmetricKey(size: .bits256)
//Se inicializa el contador en 0
var counter : UInt128 = 0
let dataCounter = Data(bytes: &counter ,count: MemoryLayout.size(ofValue:counter))

//Estimamos el set de caracteres y su tamaño en otra variable
let characterSet: [String] = ["A","E","I","O","U"]
let characterSetSize = characterSet.count


//Vamos a cifrar el contador

let counterAes = try! AES.GCM.seal(dataCounter, using: simkey, nonce: nil)

//let intValueAes:Int = try! counterAes.ciphertext.withUnsafeBytes {$0.pointee}

