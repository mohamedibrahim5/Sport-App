//
//  DBManger.swift
//  final_project
//
//  Created by mohamed ibrahim on 21/06/2022.
//

import Foundation
import CoreData


protocol DeletionDelegate{
    func deleteMovieAtIndexPath(indexPath: IndexPath)
}

class DBmanger {
    
    static let sharedInstance = DBmanger()
    private init(){
        
    }
}

extension DBmanger {
    
    
    func addMoviejson(appDelegate : AppDelegate , league : League){
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Fav", in: managedContext){
            let leg1 = NSManagedObject(entity: entity, insertInto: managedContext)
            leg1.setValue(league.idLeague, forKey: "id")
            leg1.setValue(league.strLeagueAlternate, forKey: "image")
            leg1.setValue(league.strLeague, forKey: "name")
            leg1.setValue(league.strSport, forKey: "sport")

            
            do{
                try managedContext.save()
            }catch let error as NSError{
                print("Error in Saving")
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func addMoviejsonind(appDelegate : AppDelegate , strname : String){
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Fav", in: managedContext){
            let leg1 = NSManagedObject(entity: entity, insertInto: managedContext)
            leg1.setValue(strname, forKey: "name")
            do{
                try managedContext.save()
                print("data is saved")
            }catch let error as NSError{
                print("Error in Saving")
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func addimageandytblink(
        appDelegate : AppDelegate ,strname : String, strimage : String,stryoutbe:String,strid:String
    ){
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "Fav", in: managedContext){
            let leg1 = NSManagedObject(entity: entity, insertInto: managedContext)
            leg1.setValue(strname, forKey: "name")
            leg1.setValue(strimage, forKey: "image")
            leg1.setValue(stryoutbe, forKey: "sport")
            leg1.setValue(strid, forKey: "id")
            do{
                try managedContext.save()
                print("data is saved")
            }catch let error as NSError{
                print("Error in Saving")
                print(error.localizedDescription)
            }
            
        }
        
    }

        
        func fetchData(appDelegate : AppDelegate) -> [Fav]{
            var fetchedList : [Fav] = []
            let managedContext = appDelegate.persistentContainer.viewContext
             let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Fav")
                do{
                    fetchedList = try managedContext.fetch(fetchRequest) as! [Fav]
                }catch let error as NSError {
                    print("Error In ReadData")
                    print(error.localizedDescription)
                }

            return fetchedList

        }
    func delete(favourite:Fav, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){


        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(favourite)
        do{
            try managedContext.save()
            delegate.deleteMovieAtIndexPath(indexPath: indexPath)
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }

    }

    }

