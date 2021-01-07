//
//  PhotoTVC.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import UIKit
import Kingfisher

public class PhotoTVC: UITableViewCell {

    //MARK: - @IBOutlets
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    //MARK: - Properties
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: identifier, bundle: nil)
    }
    
    //MARK: - Life cycle
    override public func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override public func prepareForReuse() {
        photoImage.image = nil
        photoNameLabel.text = nil
    }
    
    //MARK: - Methods
    public func setModel(photo: Photo) {
        let url = URL(string: photo.thumbnailURL)
        photoImage.kf.indicatorType = .activity
        photoImage.kf.setImage(with: url)
        
        photoNameLabel.text = photo.title.capitalized
    }
    
}
