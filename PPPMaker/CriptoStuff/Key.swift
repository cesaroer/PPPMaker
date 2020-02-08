//
//  Key.swift
//  PPPMaker
//
//  Created by Cesar on 08/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation
import CryptoKit

var simkey = SymmetricKey(size: .bits256)
var legibleSimKey = simkey.withUnsafeBytes { return Data(Array($0)).base64EncodedString()}
