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
    var history: [RPSMatch]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(history ?? "Can't print history")
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (history?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID)
        cell?.imageView?.image = nil
        
        return UITableViewCell()
    }
    
    
    // MARK: Button Actions
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
