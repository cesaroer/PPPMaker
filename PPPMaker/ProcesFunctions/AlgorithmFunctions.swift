//
//  Algorithm Steps.swift
//  PPPMaker
//
//  Created by Cesar on 07/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation
import UIKit


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



