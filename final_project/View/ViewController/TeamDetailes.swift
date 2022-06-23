//
//  ViewController2.swift
//  final_project
//
//  Created by mohamed ibrahim on 21/06/2022.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    var team : LeaguesDetaile?
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = team?.strTeam
        label2.text = team?.intFormedYear
        label3.text = team?.strLeague
        imageView.loadFrom(URLAddress: (team?.strTeamBadge)!)
        label4.text = team?.strStadium
        label5.text = team?.strDescriptionEN
        // Do any additional setup after loading the view.
    }
}
