//
//  FavouriteViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import UIKit
import SafariServices
import Network
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [self] path in
            if path.status == .satisfied{
                    DispatchQueue.main.async { [self] in
                        print("internet Connected")
                        tableview.reloadData()
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "down") as!
                        LeaguesDetailesViewController
                        vc.arr = arr[indexPath.row]
                        vc.checkstrname = arr[indexPath.row].name!
//                        if (arr[indexPath.row].name!.isEmpty || ((arr[indexPath.row].sport?.isEmpty) != nil)){
//                            showalertt()
//                        }
                      present(vc, animated: true, completion: nil)

                    }
            } else {
                
                DispatchQueue.main.async { [self] in
                    showalert()
                  
                tableview.reloadData()

                }
            }
        }

        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
       
    }
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

extension FavouriteViewController
{
    func showalert(){
        let alert = UIAlertController(title: "Warning", message: "You are Not connect to InterNet ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
//    func showalertt(){
//        let alert = UIAlertController(title: "Sorry", message: "This Leagues Will Coming Soon ", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//        
   }
//
//}


