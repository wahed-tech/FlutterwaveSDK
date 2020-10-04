//
//  Viewcontroller+setup.swift
//  FlutterwaveSDK_Example
//
//  Created by Rotimi Joshua on 02/10/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setUpConstraintsAndProperties(){
        
        addAllViews()
        setupFlutterLabel()
        setupExampleLabel()
        setupUnderLineView()
        setupLaunchButton()
        view.backgroundColor = UIColor(hex: "#FAF4EC")
        
    }
    func addAllViews(){
        view.addSubview(flutterLabel)
        view.addSubview(exampleLabel)
        view.addSubview(underLineView)
        view.addSubview(launchButton)
        
        NSLayoutConstraint.activate([
            flutterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            flutterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
             flutterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            exampleLabel.topAnchor.constraint(equalTo: flutterLabel.bottomAnchor, constant: 5),
            exampleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            underLineView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            underLineView.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 8),
            underLineView.heightAnchor.constraint(equalToConstant: 1),
            underLineView.widthAnchor.constraint(equalToConstant: 158),
            
            launchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            launchButton.heightAnchor.constraint(equalToConstant: 50),
            launchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            launchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
  
        ])
    }
    
    
    func setupFlutterLabel(){
        
        
        let attributedTitle = NSMutableAttributedString(string: "Welcome to ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .semibold) as Any, NSAttributedString.Key.foregroundColor: UIColor(hex: "#6E6B67")])
        
        attributedTitle.append(NSAttributedString(string: "FLUTTERWAVE SDK", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .semibold) as Any, NSAttributedString.Key.foregroundColor: UIColor(hex: "#050300")]))
        
        flutterLabel.attributedText = attributedTitle
        
        flutterLabel.numberOfLines = 0
       
        flutterLabel.translatesAutoresizingMaskIntoConstraints = false
        flutterLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupExampleLabel(){
        exampleLabel.text = "V3 Example"
        exampleLabel.numberOfLines = 0
        exampleLabel.textColor = UIColor(hex: "#6E6B67")
        exampleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        exampleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupUnderLineView(){
        underLineView.backgroundColor = UIColor(hex: "#F5A623")
        underLineView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLaunchButton(){
        launchButton.setTitle("LAUNCH FLUTTERWAVE", for: .normal)
        launchButton.setTitleColor(.white, for: .normal)
        launchButton.backgroundColor = UIColor(hex: "#F5A623")
        launchButton.layer.cornerRadius = 4
        launchButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        launchButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        launchButton.addTarget(self, action: #selector(showExample), for: .touchUpInside)
 
    }
}

