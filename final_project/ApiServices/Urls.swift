//
//  Urls.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/all_\(endPoint)"
    }
}
// https://www.thesportsdb.com/api/v1/json/2/search_all_
// teams.php?l=\(strLeague)
// leagues 
struct UrlServices2 {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=\(endPoint)"
    }
}


//struct UrlServicesDetailes {
//    var endPoint: String = ""
//    var url: String {
//        return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=\(endPoint)"
//    }
//}







//https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=
// teams
struct UrlServices3 {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(endPoint)"
    }
}

// event
// latest event
struct UrlServices4 {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/searchfilename.php?e=\(endPoint)"
    }
}

// https://www.thesportsdb.com/api/v1/json/2/searchfilename.php?e=English_Premier_League_2015


// English_Premier_League_2021
