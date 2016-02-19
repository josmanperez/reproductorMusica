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
    ["titulo":"Sun_Models","imagen":UIImage(named: "sun-models-odesza")!,"descripcion": "Odeszza - Sun Models"],
    ["titulo":"Vargaft","imagen":UIImage(named: "deafnoise")!,"descripcion":"Deaf Noise - Vargaft"],
    ["titulo":"Acoustic_sunset","imagen":UIImage(named: "guitar")!,"descripcion":"Guitar - Emotional song"],
    ["titulo":"Emotional_piano","imagen":UIImage(named: "piano")!,"descripcion":"Piano - Love Song"],
    ["titulo":"Wonderwall","imagen":UIImage(named: "wonderwall")!,"descripcion":"Oasis - Wonderwall"]
  ]
  
  func randomSong() -> [String:AnyObject] {
    let unsignedArrayCount = UInt32(cancionesArray.count)
    let usignedRandomNumber = arc4random_uniform(unsignedArrayCount)
    let randomNumber = Int(usignedRandomNumber)
    
    return cancionesArray[randomNumber]
    
  }
  
}

//let cancion1:Cancion = Cancion(nombre: "Sun_Models", portada: UIImage(named: "sun-models-odesza")!)


