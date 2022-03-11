//
//  DecodeViewController.swift
//  projectCodable2
//
//  Created by Consultant on 3/2/22.
//

import UIKit

class DecodeViewController: UIViewController {
    @IBOutlet var imageImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var primaryAttributeLabel: UILabel!
    @IBOutlet var primaryAttackLabel: UILabel!
    @IBOutlet var legsLabel: UILabel!
    
    var hero: Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = hero?.name
        primaryAttackLabel.text = hero?.attackType
        primaryAttributeLabel.text = hero?.primaryAttribute
        legsLabel.text = "\((hero?.legs)!)"
        let baseURL = "https://api.opendota.com" + (hero?.image)!
        let url = URL(string: baseURL)
        imageImageView.getImage(from: url!)
    }
}
