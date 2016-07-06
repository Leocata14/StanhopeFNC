//
//  ResultsTableVC.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 6/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ResultsTableVC: UITableViewController {

    @IBOutlet weak var teamsTableView: UITableView!
    
    var teams = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamsTableView.delegate = self
        teamsTableView.dataSource = self
        
        
        
        DataService.ds.REF_RESULTS.observe(FIRDataEventType.value, with: { (snapshot) in
            
            self.teams = []
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    if let teamDict = snap.value as? Dictionary<String,AnyObject> {
                        let key = snap.key
                        let team = Team(teamKey: key, dicitionary: teamDict)
                        self.teams.append(team)
                        print("SNAP:\(snap)")
                    }
                }
            }
            self.teamsTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teams[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell") as? TeamCell {
            
            
            cell.configureTeamCell(team: team)
            return cell
        } else {
            return TeamCell()
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
