//
//  LeaguesDetailesTableViewCell.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import UIKit

class LeaguesDetailesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var event: UILabel!
    
    @IBOutlet weak var data: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
