//
//  NewMessageController.swift
//  Knock Knock
//
//  Created by milind shelat on 19/03/20.
//  Copyright © 2020 milind shelat. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserCell"

class NewMessageController: UITableViewController {
    
    //Mark: - Properties
    
    private var users = [User]()
    
    //Mark: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUser()
        
    }
    
    //Mark: - Selectors
    
    @objc func handleDismissal() {
        dismiss(animated: true, completion: nil)
    }
    
    //Mark: - API
    
    func fetchUser() {
        Service.fetchUsers { (users) in
            self.users = users
            self.tableView.reloadData()
        }
        
    }
    
    //Mark: - Helpers
    
    func configureUI() {
        configureNavigationBar(withTitle: "New Message", preferedLargeTitles: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleDismissal))
        
        tableView.tableFooterView = UIView()
        tableView.register(UserCell.self , forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
}

extension NewMessageController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
}