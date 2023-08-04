//
//  PeopleTableViewCell.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 4.08.2023.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var avatar: UIImageView!
	
	var user: User? {
		didSet {
			loadData()
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func loadData() {
	self.usernameLabel.text = user?.username

	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		avatar.layer.cornerRadius = 25
		
	}

}
