//
//  LeaguesTableViewCell.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import UIKit



protocol newpop {
    func onclieckcell (getlink : String)
}

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var textlabel: UILabel!
    var delegte2 : newpop?
    var link : String?
    @IBAction func youtubebutton(_ sender: UIButton) {
        delegte2?.onclieckcell(getlink: link!)
    }
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   }
}



