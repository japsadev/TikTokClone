//
//  SharePostVC.swift
//  TikTokClone
//
//  Created by Salih Yusuf Göktaş on 2.08.2023.
//

import UIKit
import AVFoundation
import ProgressHUD

class SharePostVC: UIViewController {

	@IBOutlet weak var postButton: UIButton!
	@IBOutlet weak var draftsButton: UIButton!
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var thumbnailImageView: UIImageView!
	
	let originalVideoUrl: URL
	var encodedVideoURL: URL?
	var selectedPhoto: UIImage?
	let placeholder = "Please write a decription"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		textViewDidChanged()
		self.view.addGestureRecognizer (UITapGestureRecognizer(target: self, action: #selector (hideKeyboard)))
		
		if let thumbnailImage = self.thumbnailImageForFileUrl(originalVideoUrl) {
			self.selectedPhoto = thumbnailImage.imageRotated(by: .pi/2)
			thumbnailImageView.image = thumbnailImage.imageRotated(by: .pi/2)
		}
		saveVideoTobeUploadedToServerToTempDirectory(sourceURL: originalVideoUrl) {[weak self] (outputURL) in
			self?.encodedVideoURL = outputURL
			print("encodedVideoURL:", outputURL)
			}
		}
	
	
	func thumbnailImageForFileUrl(_ fileUrl: URL) -> UIImage? {
	let asset = AVAsset(url: fileUrl)
	let imageGenerator = AVAssetImageGenerator(asset: asset)
		do {
			let thumbnailCGImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 7, timescale: 1), actualTime: nil)
		return UIImage(cgImage: thumbnailCGImage)
			} catch let err {
			print(err)
			}
		return nil
	}
	
	@objc func hideKeyboard() {
		self.view.endEditing(true)
    }
    
	//captureButton a gelmeden tabbar kaybolsun
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = true
	}
	
	//tabbar geri gelsin
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.tabBarController?.tabBar.isHidden = false
	}
	
	init?(coder: NSCoder, videoUrl: URL) {
		self.originalVideoUrl = videoUrl
		super.init(coder: coder)
		
	}
	
	required init?(coder: NSCoder) {
	fatalError ("init(coder:) has not been implemented")
	}
	
	func setupView() {
	draftsButton.layer.borderColor = UIColor.lightGray.cgColor
	draftsButton.layer.borderWidth = 0.3
	}

	@IBAction func sharePostDidTapped(_ sender: Any) {
		self.sharePost {
			self.dismiss(animated: true) {
				self.tabBarController?.selectedIndex = 0
			}
		} onError: { errorMessage in
			ProgressHUD.showError(errorMessage)
		}

	}
	
	func sharePost(onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
		ProgressHUD.show("Loading...")
		Api.Post.sharePost(encodedVideoURL: encodedVideoURL, selectedPhoto: selectedPhoto, textView: textView) {
			ProgressHUD.dismiss()
			onSuccess()
		} onError: { errorMessage in
			onError(errorMessage)
		}

	}
	
	
}

extension SharePostVC: UITextViewDelegate {
	func textViewDidChanged() {
		textView.delegate = self
		textView.text = placeholder
		textView.textColor = .lightGray
	}
	
	func textViewDidBeginEditing(_ textView: UITextView) {
		if textView.textColor == .lightGray {
			textView.text = ""
			textView.textColor = .black
		}
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		if textView.text == "" {
			textView.text = placeholder
			textView.textColor = .lightGray
		}

	}
	
}

extension UIImage {

	func imageRotated(by radian: CGFloat) -> UIImage{
		
		let rotatedSize = CGRect(origin: .zero, size: size)
			.applying(CGAffineTransform(rotationAngle: radian))
			.integral.size
		UIGraphicsBeginImageContext (rotatedSize)
		if let context = UIGraphicsGetCurrentContext() {
			let origin = CGPoint(x: rotatedSize.width / 2.0,
								 y: rotatedSize.height / 2.0)
			context.translateBy(x: origin.x, y: origin.y)
			context.rotate(by: radian)
			draw(in: CGRect(x: -origin.y, y: -origin.x,
							width: size.width, height: size.height))
			let rotatedImage = UIGraphicsGetImageFromCurrentImageContext ()
			UIGraphicsEndImageContext()
			
			return rotatedImage ?? self
		}
		
		return self
	}
}
