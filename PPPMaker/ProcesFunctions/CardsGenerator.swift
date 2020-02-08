//
//  CardsGenerator.swift
//  PPPMaker
//
//  Created by Cesar on 07/02/20.
//  Copyright © 2020 CesarVargas. All rights reserved.
//

import Foundation

 let cellHeaders = ["#","Col: A", "Col: B", "Col: C", "Col: D"]
 
class cardGenerator{

 //let cardToUse = pppStart
    
//let myCard = ["uOeo", "uOeU", "EeAe", "iUoo", "oiai", "OiAi", "aaue", "eOIE", "OOIa", "oIeA", "uiAi", "OaOO", "eeau", "IIaE", "EUUo", "ioUI", "AAII", "aIUO", "aoOE", "eIOi", "IeuU", "eAaI", "eeuu", "uioo", "IiIi", "eEaE", "iEii", "OEII", "IoIe", "eeiA", "eOAE", "aOiA"]

//Funcion que genera una matriz ya con headers e indicadores

   

func cardMatrixGenerator(headers: [String], disortedCardArray: [String]) -> [[String]] {
    
       var cardMatrix: [[String]] = [headers]
       var columnMatrix: [String] = []
    
//Empezamos proceso de hacer la matiz
disortedCardArray.forEach { i in
    
    //Añadimos los headers de la columna
           if columnMatrix.count == 0 {
               columnMatrix.append("\(cardMatrix.count)")
           }
    
           if columnMatrix.count < 5 {
               columnMatrix.append(i)
           } else {
            
                let finalLine = columnMatrix
                            cardMatrix.append(finalLine)
                            columnMatrix = []
               if columnMatrix.count == 0 {
                    
                            columnMatrix.append("\(cardMatrix.count)")
               }
            
               columnMatrix.append(i)
            }
       }
    
    //LLegamos al fin de la secciones que tenemos planeadas
       if columnMatrix.count == 5 {
        
        
           let finalLine = columnMatrix
        
                cardMatrix.append(finalLine)
        
                columnMatrix = []
       }
       
    return cardMatrix
}
    
        
    //Singleton
        
        static let pppStartGenerateCard = cardGenerator()

}


