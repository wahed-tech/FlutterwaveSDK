//
//  SavedCardsView.swift
//  RaveTest
//
//  Created by Olusegun Solaja on 09/09/2019.
//  Copyright © 2019 Olusegun Solaja. All rights reserved.
//

import UIKit

class SavedCardsView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please select your preferred card"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var savedCardTableContainer: UIView = {
        let label = UIView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    
//    lazy var useAnotherCardButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitleColor(.black, for: .normal)
//        button.setTitle("USE ANOTHER CARD", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    
    lazy var useAnotherCardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("USE ANOTHER CARD", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
//        button.backgroundColor = UIColor(hex: "#F5A623")
//        button.layer.cornerRadius = 4
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.heightAnchor.constraint(equalToConstant: 57).isActive = true
        button.setImage(UIImage(named: "anotherCard", in: Bundle.getResourcesBundle(), compatibleWith: nil), for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0,left: -80,bottom: 0,right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0,left:0,bottom: 4,right: 15)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(savedCardTableContainer)
        addSubview(useAnotherCardButton)
        
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
         setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant:20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-20),
            
            savedCardTableContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant:20),
            savedCardTableContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:20),
            savedCardTableContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-20),
            savedCardTableContainer.heightAnchor.constraint(equalToConstant: 284),
            
            useAnotherCardButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant:20),
            useAnotherCardButton.topAnchor.constraint(equalTo: savedCardTableContainer.bottomAnchor, constant:8),
            useAnotherCardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:-20),
            useAnotherCardButton.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
