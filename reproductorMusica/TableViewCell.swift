//
//  TableViewCell.swift
//  reproductorMusica
//
//  Created by Josman Perez on 19/2/16.
//  Copyright © 2016 Josman Perez. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tituloCancion: UILabel!
    @IBOutlet weak var coverCancion: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
