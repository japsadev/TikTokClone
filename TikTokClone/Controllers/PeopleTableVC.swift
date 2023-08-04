//
//  PeopleTableVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 4.08.2023.
//

import UIKit

class PeopleTableVC: UITableViewController {

	var users = [User] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		fetchUser()
   
    }

	func fetchUser() {
		Api.User.observeUsers { user in
		self.users.append(user)
		self.tableView.reloadData()
		}
	}
    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return self.users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as! PeopleTableViewCell

        return cell
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}


}
