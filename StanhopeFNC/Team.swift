//
//  Team.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 6/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import Foundation

class Team {
    
    private var _teamKey: String!
    private var _latestResultUrl: String!
    private var _teamName: String!
    
    var teamKey: String {
        return _teamKey
    }
    
    var latestResultUrl: String {
        return _latestResultUrl
    }
    
    var teamName: String {
        return _teamName
    }
    
    
    init(teamName: String, latestResultUrl: String) {
        self._teamName = teamName
        self._latestResultUrl = latestResultUrl
    }
    
    init(teamKey: String, dicitionary: Dictionary<String,AnyObject>){
        self._teamKey = teamKey
        
        if let teamName = dicitionary["teamName"] as? String {
            self._teamName = teamName
        }
        
        if let latestResultUrl = dicitionary["latestResultUrl"] as? String {
            self._latestResultUrl = latestResultUrl
        }
    }
}
