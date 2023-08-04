//
//  Ref.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 31.07.2023.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase

let REF_USER = "users"
let STORAGE_PROFILE = "profile"
let URL_STORAGE_ROOT = "gs://tiktokclone-aef1b.appspot.com"
let EMAIL = "email"
let UID = "uid"
let USERNAME = "username"
let PROFILE_IMAGE_URL = "profileImageUrl"
let STATUS = "status"

let IDENTIFIER_TABBAR = "TabbarVC"
let IDENTIFIER_MAIN = "MainVC"


class Ref {
		let databaseRoot = Database.database().reference()

		var databaseUsers: DatabaseReference {
			return databaseRoot.child (REF_USER)
}
	
	func databaseSpesificUser(uid: String) -> DatabaseReference {
	return databaseUsers.child(uid)
	}

	//Storage Ref

		let storageRoot = Storage.storage().reference(forURL: URL_STORAGE_ROOT)

		var storageProfile: StorageReference {
			return storageRoot.child(STORAGE_PROFILE)

	}
	
	func storageSpesificProfile(uid: String) -> StorageReference {
	return storageProfile.child(uid)
	}

}
