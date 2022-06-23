//
//  favouriteTableViewCell.swift
//  final_project
//
//  Created by mohamed ibrahim on 21/06/2022.
//

import UIKit
protocol Gotoyoutube {
    func getlink (endpoint : String)
}
class favouriteTableViewCell: UITableViewCell {
    
    
    var link : String?
    var gotoyoutube : Gotoyoutube?
    
    @IBOutlet weak var textlabell: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var textlabel: UIView!
    @IBAction func youtubebutton(_ sender: UIButton) {
    gotoyoutube?.getlink(endpoint: link!)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
