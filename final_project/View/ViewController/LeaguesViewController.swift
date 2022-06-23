//
//  LeaguesViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import UIKit
import SafariServices

class LeaguesViewController: UIViewController {
    var checkLeagues = ""
    var leaguesArray = [League]()
    var checksprts : Sport?
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let leaguPresenter : LeaguesPresenterr = LeaguesPresenterr(LeaguesView: self)
        for index in 0..<Country.arr.count{
            leaguPresenter.fetchData(endPoint: "\(Country.arr[index])&s=\(checkLeagues)")
        }
        print(checkLeagues)
    }
}

extension LeaguesViewController : LeaguesView{
    func renderHomeView(leagues: [League]) {
        self.leaguesArray = self.leaguesArray + leagues
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    func postErrorHomeView(error: Error) {
        print(error.localizedDescription)
    }
}
extension LeaguesViewController : UITableViewDelegate,UITableViewDataSource{
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(leaguesArray.filter({$0.strSport == checkLeagues}).count)
        return leaguesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        cell.textlabel.text = leaguesArray[indexPath.row].strLeague
        cell.imageview.loadFrom(URLAddress: leaguesArray[indexPath.row].strBadge!)
        cell.delegte2 = self
        cell.link = leaguesArray[indexPath.row].strYoutube
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        if (leaguesArray.count == 0)
        {
            for _ in 0...10000000000 {}
            showalert()
        }
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
       
        
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "down") as!
            LeaguesDetailesViewController
   
        vc.checkstrname = leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row].strLeague!
        vc.checkimage = leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row].strBadge!
        vc.checkyoutube = leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row].strYoutube!
            vc.leg = leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row]
         print(leaguesArray[indexPath.row].strYoutube!)
          present(vc, animated: true, completion: nil)
        //    navigationController?.pushViewController(vc, animated: true)
    }
}
extension LeaguesViewController{
    func showalert(){
        let alert = UIAlertController(title: "Sorry", message: "This Sport Will Coming Soon ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}


extension LeaguesViewController : newpop{
    func onclieckcell(getlink: String) {
        if let url = URL(string: "https://\(getlink)") {
           let vc = SFSafariViewController(url: url)
           self.present(vc, animated: true, completion: nil)
       }
    }
    
    
}
