//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Daniel Pratt on 2/16/17.
//  Copyright © 2017 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Constants
    let reuseID = "historyCellIdentifier"
    let titleInfo = "title"
    let detailsInfo = "details"
    let imageInfo = "image"
    
    // MARK: Variables for displaying table view info
    var history: [RPSMatch]?
    var matchDetails = [[String : String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        constructMatchDictionaries()
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (matchDetails.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        let cellDetails = matchDetails[(indexPath as NSIndexPath).row]
        
        cell?.textLabel?.text = cellDetails[titleInfo]
        cell?.detailTextLabel?.text = cellDetails[detailsInfo]
        cell?.imageView?.image = UIImage(named: cellDetails[imageInfo]!) ?? nil
        
        return cell!
    }
    
    // MARK: Functions to create match dictionary that table view will be constructed from
    
    func constructMatchDictionaries() {
        for match in history! {
            let didWinMessage = getWinningInformation(match)
            let matchDetailsMessage = "\(match.p1) vs \(match.p2)"
            let matchImage = getWinningImage(match)
            matchDetails.append([titleInfo : didWinMessage, detailsInfo : matchDetailsMessage,  imageInfo : matchImage])
        }
    }
    
    // Figures out if human won or lost the match, and will return the correct string to add to the dictionary for the title message
    func getWinningInformation(_ match: RPSMatch) -> String {
        let p1Choice = match.p1
        let p2Choice = match.p2
        let loserChoice = match.loser
        
        if p1Choice == loserChoice {
            return "You Lost"
        } else if p1Choice == p2Choice {
            return "You Tied"
        } else {
            return "You Won!"
        }
    }
    
    func getWinningImage(_ match: RPSMatch) -> String {
        
        if match.p1 == match.p2 {
            return "itsATie"
        }
        
        switch match.winner {
        case RPS.rock:
            return "RockCrushesScissors"
        case RPS.scissors:
            return "ScissorsCutPaper"
        case RPS.paper:
            return "PaperCoversRock"
        }
    }
    
    
    // MARK: Button Actions
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
