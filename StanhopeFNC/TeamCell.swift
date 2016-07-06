//
//  TeamCell.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 6/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    
    var latestResultUrl: String!
    
    var team: Team!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureTeamCell(team: Team){
        self.team = team
        
        self.teamNameLabel.text = team.teamName
        self.latestResultUrl = team.latestResultUrl
        
    }
    
}
