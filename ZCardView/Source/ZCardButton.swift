//
//  ZCardButton.swift
//  Pods
//
//  Created by sudayn on 12/27/20.
//

import UIKit

public class ZCardButton: UIButton {
    
    //MARK: Properties
    @IBInspectable
    public var radius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor = .lightGray {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 0 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    public var shadowOffsetX: CGFloat = 0 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    public var shadowOffsetY: CGFloat = 0 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable
    public var shadowOpacity: CGFloat = 1 {
        didSet {
            updateShadow()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.layer.masksToBounds = false
    }
    
    func updateShadow() {
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.radius).cgPath
        self.layer.shadowOffset = CGSize(width: self.shadowOffsetX, height: self.shadowOffsetY)
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = self.shadowRadius
    }
    
    func updateCornerRadius() {
        self.layer.cornerRadius = self.radius
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateShadow()
        updateCornerRadius()
    }
}
