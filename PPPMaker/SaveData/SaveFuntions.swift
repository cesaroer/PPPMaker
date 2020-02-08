//
//  SaveFuntions.swift
//  PPPMaker
//
//  Created by Cesar on 08/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation
import UIKit


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
