//
//  PostProfileCollectionViewCell.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 4.08.2023.
//

import UIKit

protocol PostProfileCollectionViewCellDelegate {
func goToDetailVC(postId: String)
}

class PostProfileCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var postImage: UIImageView!
	
	var delegate: PostProfileCollectionViewCellDelegate?
	var post: Post? {
		didSet {
			updateView()
		}
	}
	func updateView() {
		guard let postThumbnailImageUrl = post!.imageUrl else {return}
		self.postImage.loadImage(postThumbnailImageUrl)
		
		let tapGestureForPhoto = UITapGestureRecognizer(target: self, action: #selector(self.post_TouchUpInside))
		postImage.addGestureRecognizer(tapGestureForPhoto)
		postImage.isUserInteractionEnabled = true
	}
	@objc func post_TouchUpInside() {
		if let id = post?.postId {
			delegate?.goToDetailVC(postId: id)
		}
	}
	
}
