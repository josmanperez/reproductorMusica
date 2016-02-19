//
//  DetailViewController.swift
//  reproductorMusica
//
//  Created by Josman Pérez Expósito on 19/02/16.
//  Copyright © 2016 Josman Perez. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
  
  @IBOutlet weak var coverImagen: UIImageView!
  
  @IBOutlet weak var volumeSlider: UISlider!
  
  private var reproductor:AVAudioPlayer!
  
  var cancion:[String:AnyObject]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Imagen
    if let imagen = cancion!["imagen"] {
      coverImagen.image = imagen as? UIImage
    }
    // Titulo
    self.title = cancion!["descripcion"] as? String
    
    if let titulo = cancion!["titulo"] as? String {
      print(titulo)
      let sonidoURL = NSBundle.mainBundle().URLForResource(titulo, withExtension: "mp3")
      do {
        try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        // Volumen
        volumeSlider.value = reproductor.volume
      } catch{
        print("error")
      }
    }
    
    // Tocamos
    if !reproductor.playing {
      reproductor.play()
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Configure View
  func configureView() {
    
    if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
      let navBarAttributesDictionary:[String:AnyObject]? = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: navBarFont]
      navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
    }
  }
  
  
  @IBAction func pause() {
    if reproductor.playing {
      reproductor.pause()
    }
  }
  
  @IBAction func play() {
    if !reproductor.playing {
      reproductor.play()
    }
  }
  
  @IBAction func stop() {
    if reproductor.playing {
      reproductor.stop()
      reproductor.currentTime = 0;
    }
  }
  
  
  @IBAction func volumeChangeSlider(sender: UISlider) {
    
    reproductor.volume = sender.value
  }

  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
