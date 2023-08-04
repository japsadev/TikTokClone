//
//  Post.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 4.08.2023.
//

import Foundation

class Post {
var uid: String?
var postId: String?
var imageUrl: String?
var videoUrl: String?
var description: String?
var creationDate: Date?
var likes: Int?
var views: Int?
var commentCount: Int?

static func transformPostVideo(dict: Dictionary<String, Any>, key: String) -> Post {
let post = Post()
post.postId = key
post.uid = dict["uid"] as? String
post.imageUrl = dict["imageUrl"] as? String
post.videoUrl = dict["videoUr]"] as? String
post.description = dict["description"] as? String
post.likes = dict["likes"] as? Int
post.views = dict[ "views"] as? Int
post.commentCount = dict["commentCount"] as? Int
let creationDouble = dict["creationDate"] as? Double ?? 0
post.creationDate = Date(timeIntervalSince1970: creationDouble)
return post
}
}
