//
//  SplitArray.swift
//  PPPMaker
//
//  Created by Cesar on 07/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation

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
