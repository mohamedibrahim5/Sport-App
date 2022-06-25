//
//  LeaguesDetailesViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import UIKit
import SafariServices
import Network
class LeaguesDetailesViewController:UIViewController {

    var y = 0
    var arr : Fav?
    var fetch : [Fav]?
    var arrcheck : [String] = []
    var check : String = ""
    @IBOutlet weak var collection4up: UICollectionView!
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
 
    @IBOutlet weak var tableview: UITableView!
    
   
    @IBOutlet weak var fav: UIButton!
    @IBAction func favourite(_ sender: UIButton) {
        
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        fetch = db.fetchData(appDelegate: appDelegate)
        for index in 0..<fetch!.count{
            arrcheck.append(fetch?[index].name ?? "")
        }
        if arrcheck.contains(checkstrname) {
            print("you are adding it before ")
            showalerttt()
            
        }
        else if (y == 1 ) {
            print("do not add empty data ")
            showalertttt()
        }
        else {
            db.addimageandytblink(appDelegate: appDelegate,strname: checkstrname, strimage: checkimage, stryoutbe: checkyoutube, strid: id)
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
        let leagueName_arr = checkstrname.components(separatedBy: " ")
        var leagueName_final = (leagueName_arr[0])
        for index in 1..<leagueName_arr.count {
            leagueName_final = leagueName_final + "%20\(leagueName_arr[index])"
                        }
        collection4up.register(UINib(nibName: "CollectionViewCellup2", bundle: nil), forCellWithReuseIdentifier: "cellup2")
        tableview.delegate = self
        tableview.dataSource = self
        checkarrstr = checkstrname.components(separatedBy: " ")
        let leaguPresenter : LeaguesDetailesPresenter = LeaguesDetailesPresenterr(LeaguesDetailes: self)
        let eventPresenter : EventPresenterr = EventPresenterr(LeaguesDetailes: self)
        let latestevent : LatestEventsPresenter = LatestEventPresenterr(LeaguesDetailes: self)
        leaguPresenter.fetchData(endPoint: leagueName_final)
        eventPresenter.fetchData(endPoint: leagueName_final)
        latestevent.fetchData(endPoint: "\(leagueName_final)_2021")
        
       
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
            return CGSize(width: self.view.frame.width*0.8, height: self.view.frame.width*0.5)
        }
        return CGSize(width: self.view.frame.width*0.25, height: self.view.frame.width*0.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collection4up{
        }
        if collectionView == collection{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "cellteam") as! ViewController2
            vc.team = leaguesDetailes[indexPath.row]
        //  navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true, completion: nil)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if (latestevent.count == 0 && leaguesDetailes.count == 0){
           y = 1
        }
        if (y == 1){
            for _ in 0...20000000{}
            showalertt()
        }
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


extension LeaguesDetailesViewController{
    func showalertt(){
        let alert = UIAlertController(title: "Sorry", message: "This League Will Coming Soon ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showalerttt(){
        let alert = UIAlertController(title: "Warning", message: "You are add it brfore ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    func showalertttt(){
        let alert = UIAlertController(title: "Sorry", message: "can not add empty league now ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
