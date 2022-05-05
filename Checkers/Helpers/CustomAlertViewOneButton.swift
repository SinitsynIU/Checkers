//
//  CustomAlertView.swift
//  Checkers
//
//  Created by Илья Синицын on 03.04.2022.
//

import UIKit
import SwiftEntryKit

class CustomAlertViewOneButton: UIView {
    
    private let descriptionMessagge = UILabel()
    private let buttonMessage = UIButton(type: .system)
    
    init(textDescriptionMessagge: String) {
        super .init(frame: UIScreen.main.bounds)
        
        descriptionMessagge.text = textDescriptionMessagge
        
        setupElements()
        setupConstraints()
    }
    
    func setupElements() {
        descriptionMessagge.numberOfLines = 0
        descriptionMessagge.textColor = .black
        descriptionMessagge.font = UIFont(name: "Helvetica", size: 20)
        buttonMessage.setTitle("Ok", for: .normal)
        buttonMessage.backgroundColor = .systemOrange
        buttonMessage.layer.cornerRadius = 15
        
//        buttonMessage.addTarget(self, action: #selector(actionButtonPress), for: .touchUpInside)
    }
    
    
    
    
    func setupConstraints() {
        buttonMessage.translatesAutoresizingMaskIntoConstraints = false
        descriptionMessagge.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonMessage)
        addSubview(descriptionMessagge)
        NSLayoutConstraint.activate([
            descriptionMessagge.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            descriptionMessagge.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonMessage.topAnchor.constraint(equalTo: descriptionMessagge.bottomAnchor, constant: 22),
            buttonMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonMessage.heightAnchor.constraint(equalToConstant: 50),
            buttonMessage.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        bottomAnchor.constraint(equalTo: buttonMessage.bottomAnchor, constant: 21).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
