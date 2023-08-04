//
//  ProfileVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 31.07.2023.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

	@IBAction func logoutAction(_ sender: Any) {
		Api.User.logOut()
	}
	
}
