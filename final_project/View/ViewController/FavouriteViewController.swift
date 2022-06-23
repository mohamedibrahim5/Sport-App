//
//  FavouriteViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import UIKit
import SafariServices
class FavouriteViewController: UIViewController {
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var arr = [Fav]()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arr = db.fetchData(appDelegate: appDelegate)
        DispatchQueue.main.async { [self] in
            tableview.reloadData()
          
        }
    }
}

extension FavouriteViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! favouriteTableViewCell
        cell.textlabell.text = arr[indexPath.row].name
        cell.imageview.loadFrom(URLAddress: arr[indexPath.row].image!)
        cell.link = arr[indexPath.row].sport
        cell.gotoyoutube = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableview.reloadData()
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row].strLeague!)
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "down") as! LeaguesDetailesViewController
////        vc.checkLeagues = usersArray[indexPath.row].strLeague
////        vc.checksprts = usersArray[indexPath.row]
//        vc.checkstrname = leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row].strLeague!
//        vc.leg = leaguesArray.filter({$0.strSport == checkLeagues})[indexPath.row]
//        print(leaguesArray[indexPath.row].strLeague!)
//        navigationController?.pushViewController(vc, animated: true)
//
//
//    }
}

extension FavouriteViewController:Gotoyoutube{
    func getlink(endpoint: String) {
        if let url = URL(string: "https:\(endpoint)") {
           let vc = SFSafariViewController(url: url)
           self.present(vc, animated: true, completion: nil)
      }
        print("helloworld")
    }
}
