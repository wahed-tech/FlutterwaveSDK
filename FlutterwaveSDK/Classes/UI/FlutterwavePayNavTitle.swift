//
//  FlutterwavePayNavTitle.swift

//
//  Created by Olusegun Solaja on 15/08/2018.
//  Copyright © 2018 Olusegun Solaja. All rights reserved.
//

import UIKit

class FlutterwavePayNavTitle: UIView {
    let titleLabel:UILabel = {
        let label = UILabel()
        label.text = "SECURED BY FLUTTERWAVE"
        label.textColor = UIColor(hex: "#4A4A4A")
        label.font = UIFont.boldSystemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrowButton:UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "newPadLock",in: Bundle.getResourcesBundle(), compatibleWith: nil), for: .normal)
        button.tintColor = UIColor(hex: "#647482")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(arrowButton)
        setupConstraints()
    }
    
    func setupConstraints(){
       
        arrowButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        arrowButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        arrowButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: arrowButton.rightAnchor, constant: 7).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 2).isActive = true
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
