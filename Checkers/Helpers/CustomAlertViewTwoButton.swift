//
//  CustomAlertView.swift
//  Checkers
//
//  Created by Илья Синицын on 03.04.2022.
//

import UIKit
import SwiftEntryKit

class CustomAlertViewTwoButton: UIView {
    
    private let titleMeggage = UILabel()
    private let descriptionMessagge = UILabel()
    private let buttonYesMessage = UIButton(type: .system)
    private let buttonNoMessage = UIButton(type: .system)
    
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
        buttonYesMessage.setTitle("buttonSaveAlertYes_message_startGameVC".localized, for: .normal)
        buttonYesMessage.backgroundColor = .systemOrange
        buttonYesMessage.layer.cornerRadius = 15
        buttonNoMessage.setTitle("buttonSaveAlertNo_message_startGameVC".localized, for: .normal)
        buttonNoMessage.backgroundColor = .systemOrange
        buttonNoMessage.layer.cornerRadius = 15
        
        buttonYesMessage.addTarget(self, action: #selector(actionButtonYesPress), for: .touchUpInside)
        buttonNoMessage.addTarget(self, action: #selector(actionButtonNoPress), for: .touchUpInside)
    }
    
    @objc func actionButtonYesPress() {

    }
    
    @objc func actionButtonNoPress() {

    }
    
    func setupConstraints() {
        buttonYesMessage.translatesAutoresizingMaskIntoConstraints = false
        buttonNoMessage.translatesAutoresizingMaskIntoConstraints = false
        descriptionMessagge.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonYesMessage)
        addSubview(buttonNoMessage)
        addSubview(descriptionMessagge)
        NSLayoutConstraint.activate([
            descriptionMessagge.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            descriptionMessagge.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonYesMessage.topAnchor.constraint(equalTo: descriptionMessagge.bottomAnchor, constant: 22),
            buttonYesMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            buttonYesMessage.heightAnchor.constraint(equalToConstant: 50),
            buttonYesMessage.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            buttonNoMessage.topAnchor.constraint(equalTo: descriptionMessagge.bottomAnchor, constant: 22),
            buttonNoMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -30),
            buttonNoMessage.heightAnchor.constraint(equalToConstant: 50),
            buttonNoMessage.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        bottomAnchor.constraint(equalTo: buttonYesMessage.bottomAnchor, constant: 21).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

