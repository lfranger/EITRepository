//
//  LoadingCellTableViewCell.swift
//  pokedexV3
//
//  Created by Consultant on 3/8/22.
//

import UIKit

class LoadingCell: UITableViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
    }

    
}
