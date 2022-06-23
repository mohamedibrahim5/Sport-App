//
//  ViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var test: UICollectionView!
    
    var usersArray = [Sport]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homePresenter: IHomePresenter = HomePresenter(iHomeView: self)
        homePresenter.fetchData(endPoint: "sports.php")
        
    }
}
extension ViewController: IHomeView {
    
    func renderHomeView(users: [Sport]) {
        self.usersArray = users
        DispatchQueue.main.async {
            self.test.reloadData()
        }
    }
    func postErrorHomeView(error: Error) {
        print(error.localizedDescription)
    }
}
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usersArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.textlabel.text = usersArray[indexPath.row].strSport
        cell.imageview.roundImg()
        cell.imageview.loadFrom(URLAddress: usersArray[indexPath.row].strSportThumb!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*0.45, height: self.view.frame.width*0.5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "cell") as! LeaguesViewController
        vc.checkLeagues = usersArray[indexPath.row].strSport!
        vc.checksprts = usersArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        test.reloadData()
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

extension UIImageView{
    func roundImg(){
        
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
    }
}
