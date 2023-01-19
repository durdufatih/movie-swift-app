//
//  MOFavoriteTableViewCell.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 18.01.2023.
//

import UIKit

class MOFavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
