//
//  GroupVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 5/27/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit

class GroupVC: UIViewController {

    @IBOutlet weak var groupsTableView: UITableView!
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsTableView.delegate = self
        groupsTableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                
                self.groupsTableView.reloadData()
            }
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension GroupVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        let group = groupsArray[indexPath.row]
        
        cell.configureCell(title: group.groupTitle, description: group.groupDescription, memberCount: group.memberCount)
        
        return cell
    }
    
}

