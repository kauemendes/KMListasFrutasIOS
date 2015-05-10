//
//  KMFFrutasTableViewCell.swift
//  KMListasFrutas
//
//  Created by Kaue Mendes on 3/26/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class KMFFrutasTableViewCell: UITableViewCell {

    @IBOutlet weak var starFavorite: UIImageView!
    @IBOutlet weak var imgFrutas: UIImageView!
    @IBOutlet weak var txtNameFrutas: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
