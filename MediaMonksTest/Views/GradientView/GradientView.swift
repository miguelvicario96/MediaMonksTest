//
//  GradientView.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import UIKit

public class GradientView: UIView {
    
    //MARK: - Properties
    private var gradientLayer: CAGradientLayer?
    private var gradientSet = [[CGColor]]()
    private var currentGradient = 0
    private let gradientOne = UIColor.darkBlue.cgColor
    private let gradientTwo = UIColor.midBlue.cgColor
    private let gradientThree = UIColor.lightBlue.cgColor
    
    //MARK: - Life cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    public override class var layerClass: AnyClass {
        get { CAGradientLayer.self }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.frame = self.bounds
    }
    
    //MARK: - Methods
    private func commonInit() {
        gradientLayer = self.layer as? CAGradientLayer
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])

        gradientLayer?.colors = gradientSet[currentGradient]
        gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer?.drawsAsynchronously = true
    }
    
    public func animateGradient() {
        var previousGradient: Int!
        
        if currentGradient != gradientSet.count - 1 {
            currentGradient += 1
            previousGradient = currentGradient - 1
        } else {
            currentGradient = 0
            previousGradient = gradientSet.count - 1
        }
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = 2.0
        gradientAnimation.fromValue = gradientSet[previousGradient]
        gradientAnimation.toValue = gradientSet[currentGradient]
        gradientAnimation.delegate = self
        gradientLayer?.setValue(currentGradient, forKey: "colorChange")
        gradientLayer?.add(gradientAnimation, forKey: nil)
    }
}

//MARK: - CAAnimationDelegate
extension GradientView: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            if let colorChange = layer.value(forKey: "colorChange") as? Int {
                gradientLayer?.colors = gradientSet[colorChange]
                animateGradient()
            }
        }
    }
}
