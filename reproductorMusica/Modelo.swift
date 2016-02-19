//
//  Modelo.swift
//  reproductorMusica
//
//  Created by Josman Perez on 18/2/16.
//  Copyright © 2016 Josman Perez. All rights reserved.
//

import Foundation
import UIKit


struct Cancion {
    let cancionesArray = [
        ["Sun_Models":UIImage(named: "sun-models-odesza")!],
    ]
    
    func randomSong() -> [String:UIImage] {
        let unsignedArrayCount = UInt32(cancionesArray.count)
        let usignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(usignedRandomNumber)
        
        return cancionesArray[randomNumber]
        
    }

}

//let cancion1:Cancion = Cancion(nombre: "Sun_Models", portada: UIImage(named: "sun-models-odesza")!)


