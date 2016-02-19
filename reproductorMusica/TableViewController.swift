//
//  TableViewController.swift
//  reproductorMusica
//
//  Created by Josman Perez on 18/2/16.
//  Copyright © 2016 Josman Perez. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  let canciones = Cancion()
  
  var cancionAleatoria:[String:AnyObject]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return canciones.cancionesArray.count
  }
  
  // MARK: - Configure View
  func configureView() {
    tableView.backgroundView = BackgroundView()
    
    tableView.rowHeight = 90;
    
    if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
      let navBarAttributesDictionary:[String:AnyObject]? = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: navBarFont]
      navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
    }
  }
  
  // MARK: - Table view
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! TableViewCell
    
    if let imagen = canciones.cancionesArray[indexPath.row]["imagen"] as? UIImage, descripcion = canciones.cancionesArray[indexPath.row]["descripcion"]  as? String {
      cell.tituloCancion.text = descripcion
      cell.coverCancion.image = imagen
    }
    print(canciones.cancionesArray[indexPath.row]["titulo"])
    
    //cell?.tituloCancion = canciones[indexPath.row]
    
    
    return cell
  }
  
  @IBAction func sendShuffle() {
    
    print("shuffle \(canciones.randomSong()["titulo"])")
    cancionAleatoria = canciones.randomSong()
    
    self.performSegueWithIdentifier("detailSong", sender: "aleatorio")
    
    
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if sender as? String == "aleatorio" {
      if let cancion = cancionAleatoria {
        (segue.destinationViewController as! DetailViewController).cancion = cancion;
      }
      
    } else {
      if segue.identifier == "detailSong" {
        if let indexpath = tableView.indexPathForSelectedRow {
          (segue.destinationViewController as! DetailViewController).cancion = canciones.cancionesArray[indexpath.row]
        }
      }
    }    
    
  }
  
  
}
