//
//  AlbumTVC.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import UIKit

public class AlbumTVC: UITableViewCell {

    //MARK: - @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
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
        titleLabel.text = nil
    }
    
    //MARK: - Methods
    public func setModel(album: Album) {
        titleLabel.text = album.title
    }
    
}
