//
//  pppProcess.swift
//  PPPMaker
//
//  Created by Cesar on 08/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation
import CryptoKit






func pppStartAlgorithm() -> [String]{
    
    // arreglo para las cartas
    var card : [Character] = []
    var cardSection:String = ""
    
    // Se inicializa el contador en 0
    var counter128 : UInt128 = 0
    
        for _ in 0...127{
           
    //Se declara una variable que contendrá el entero de 128bits que corresponda al protocolo data
            
            let dataCounter = Data(bytes: &counter128 ,count: MemoryLayout.size(ofValue:counter128))

    // aqui creamos una variable que contendra la salida de AES
            let counterAes = try! AES.GCM.seal(dataCounter, using: simkey).combined!

        // aqui se crea una constante que tiene el entero de la salida del AES
            let intValueAes = counterAes.withUnsafeBytes { $0.load(as: UInt32.self) }
               print(intValueAes)
        // division 128 con residuo
           let res =  divStep(aesInt: Int(intValueAes), setSize: charSetSize)
        // mapeado con el alfabeto
           let char = mapping(res: res, set: charSet)
            card.append(char)
        
        
            counter128 = counter128 + 1
            
            }//End for
    
 //   reiniciamos el contador
counter128 = 0
    
    for i in 0...127{
        cardSection.append(card[i])
    }
    print(cardSection)
    let a = cardSection.split(by: 4).count
    print(cardSection.split(by: 4))
    print(a)
    
    let b = cardSection.split(by: 4)
    
    print(b[1])
    
    return b
    
}
