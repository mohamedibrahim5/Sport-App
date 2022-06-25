//
//  ViewControllercountry.swift
//  final_project
//
//  Created by mohamed ibrahim on 25/06/2022.
//

import UIKit

class ViewControllercountry: UIViewController {
    
    static var arr : [Countrys]?

    override func viewDidLoad() {
        super.viewDidLoad()

        func showMoviesFromJson(){
            let urlString = "https://www.thesportsdb.com/api/v1/json/2/all_countries.php"
            
            if let url = URL(string: urlString) {
                 if let data = try? Data(contentsOf: url){
                     pras(json: data) 
            }
               
         }
        }
        
       
       
    }
    
    func pras(json :Data)
    {
        let decoder = JSONDecoder()
        if let jsonmovies = try? decoder.decode(Country.self, from: json)
        {
            ViewControllercountry.arr = jsonmovies.countries
          
            
            
        }
        
    else{
        print("data failed")
    }
    }
}
