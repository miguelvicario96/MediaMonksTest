//
//  PipView.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import UIKit
import Kingfisher

public class PipView: UIView {
    
    //MARK: - Properties
    private lazy var imageView: UIImageView = {
        guard let image = imageURL else { return UIImageView() }
        let url = URL(string: image)!
        
        let imageView = UIImageView()
        imageView.setCorner(cornerRadius: 10.0)
        imageView.contentMode = .scaleAspectFill
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
        return imageView
    }()
    
    private var imageURL: String?
    
    //MARK: - Life cycle
    override private init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
        activateConstraints()
    }
    
    convenience init(frame: CGRect, imageURL: String?) {
        self.init(frame: frame)
        
        self.imageURL = imageURL
        commonInit()
        activateConstraints()
    }
    
    //MARK: - Methods
    private func commonInit() {
        self.addShadow(color: UIColor.midBlue)
        addSubview(imageView)
    }
    
    private func activateConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

