//
//  LeaguesDetailesViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import UIKit
import SafariServices
class LeaguesDetailesViewController:UIViewController {
  
    
    var fetch : [Fav]?
    var arrcheck : [String] = []
    var check : String = ""
    @IBOutlet weak var collection4up: UICollectionView!
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    var isChecked: Bool = false {
           didSet {
               if isChecked == true {
               } else {
               }
           }
       }

    var ischecked : Bool?
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
 
    @IBOutlet weak var tableview: UITableView!
    
   
    @IBOutlet weak var fav: UIButton!
    @IBAction func favourite(_ sender: UIButton) {
        
        fetch = db.fetchData(appDelegate: appDelegate)
        for index in 0..<fetch!.count{
            arrcheck.append(fetch?[index].name ?? "")
        }
        if isChecked == true {
            fav.setTitle("fav", for: .normal)
            isChecked = !isChecked
        }
        if arrcheck.contains(checkstrname) {
            print("you are adding it before ")
            fav.setTitle("unfav", for: .normal)
            
        }else {
            print(isChecked)
        if isChecked == false{
            
            db.addimageandytblink(appDelegate: appDelegate,strname: checkstrname, strimage: checkimage, stryoutbe: checkyoutube, strid: id)
            isChecked = !isChecked
        }
        }
       
        
    }
    var checkstrname:String = ""
    var checkimage : String = ""
    var checkyoutube : String = ""
    var id :String = ""
    var checkarrstr:[String] = []
    var leaguesDetailes = [LeaguesDetaile]()
    var leg:League?
    var eventdetailes = [Event]()
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    var latestevent = [LatestEvent]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collection4up.register(UINib(nibName: "CollectionViewCellup2", bundle: nil), forCellWithReuseIdentifier: "cellup2")
        tableview.delegate = self
        tableview.dataSource = self
        checkarrstr = checkstrname.components(separatedBy: " ")
        print(checkstrname)
        
        let leaguPresenter : LeaguesDetailesPresenter = LeaguesDetailesPresenterr(LeaguesDetailes: self)
        let eventPresenter : EventPresenterr = EventPresenterr(LeaguesDetailes: self)
        let latestevent : LatestEventsPresenter = LatestEventPresenterr(LeaguesDetailes: self)
        switch (checkarrstr.count)
        {
        case 1 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_2021")
        case 2 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_2021")
        case 3:
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_2021")
        case 4 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_2021")
        case 5 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_2021")
        case 6 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])_2021")
        case 7 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])_\(checkarrstr[6])_2021")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])_\(checkarrstr[6])_2021")
            latestevent.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])_\(checkarrstr[6])_2021")
        default :
            showalert()
        }
       
    }
}




extension LeaguesDetailesViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collection4up{
            return latestevent.count
        }

            return leaguesDetailes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collection4up{
            let cell = collection4up.dequeueReusableCell(withReuseIdentifier: "cellup2", for: indexPath) as! CollectionViewCellup2
            cell.event.text = latestevent[indexPath.row].strEvent
            cell.home.text = latestevent[indexPath.row].intHomeScore
            cell.away.text = latestevent[indexPath.row].intAwayScore
            return cell
        }
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "celldown", for: indexPath) as! LeaguesDetailesCollectionViewCelldown
            cell.imagev.roundImg()
            cell.imagev.loadFrom(URLAddress: leaguesDetailes[indexPath.row].strTeamBadge ?? "")
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collection4up{
            return CGSize(width: self.view.frame.width*0.99, height: self.view.frame.width*0.5)
        }
        return CGSize(width: self.view.frame.width*0.25, height: self.view.frame.width*0.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collection4up{
        }
        if collectionView == collection{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "cellteam") as! ViewController2
       //     present(vc, animated: true, completion: nil)
            vc.team = leaguesDetailes[indexPath.row]
        //  navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true, completion: nil)
        }
    }
   
    
}


extension LeaguesDetailesViewController{
    func showalert(){
        let alert = UIAlertController(title: "Sorry", message: "This Leagues Will Coming Soon ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}



extension LeaguesDetailesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventdetailes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesDetailesTableViewCell
        cell.event.text = eventdetailes[indexPath.row].strEvent
        cell.data.text = eventdetailes[indexPath.row].strTime
        cell.time.text = eventdetailes[indexPath.row].dateEvent
        return cell
    }
    
    
}


extension LeaguesDetailesViewController : EventsView{
    func renderHomeView(users: [Event]) {
        self.eventdetailes = self.eventdetailes + users
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
        func postErrorHomeView(error: Error) {
              print(error.localizedDescription)
           }
        
    }
}

extension LeaguesDetailesViewController : LatestEventsView{
    func renderHomeView(users: [LatestEvent]) {
      //  self.eventdetailes = self.eventdetailes + users
        self.latestevent = self.latestevent + users
        DispatchQueue.main.async {
            self.collection4up.reloadData()
        }
        func postErrorHomeView(error: Error) {
              print(error.localizedDescription)
           }
        
    }
}

extension LeaguesDetailesViewController : LeaguesDetailesView{
    func renderHomeView(leagues: [LeaguesDetaile]) {
        self.leaguesDetailes = self.leaguesDetailes + leagues

        DispatchQueue.main.async {
            self.collection.reloadData()
           
        }
    }

    func postErrorHomeView(error: Error) {
        print(error.localizedDescription)
    }


}
