//
//  AlertView.swift
//  Checkers
//
//  Created by Илья Синицын on 23.06.2022.
//

import UIKit

protocol AlertDelegateLeftButton: AnyObject {
    func leftButtonTapped()
}

protocol AlertDelegateRightButton: AnyObject {
    func rightButtonTapped()
}

class AlertView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var vsView: UIImageView!
    @IBOutlet weak var secondPlayerNameTextField: UITextField!
    
    weak var delegateLeftButton: AlertDelegateLeftButton?
    weak var delegateRightButton: AlertDelegateRightButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftButton.layer.cornerRadius = 22
        rightButton.layer.cornerRadius = 22
        bgView.layer.cornerRadius = 50
        secondPlayerNameTextField.layer.cornerRadius = 15
        secondPlayerNameTextField.layer.borderWidth = 1
        secondPlayerNameTextField.textAlignment = .center
        secondPlayerNameTextField.layer.borderColor = UIColor.black.cgColor
        secondPlayerNameTextField.placeholder = "secondPlayerTextFieldplaceholder_text_alertView".localized
    }
    
    func set(title: String? = nil, body: String? = nil, vsViewImage: Bool? = nil, leftButtonTitle: String? = nil, rightButtonTitle: String? = nil) {
        if vsViewImage == nil {
            vsView.isHidden = true
            secondPlayerNameTextField.isHidden = true
            titleLabel.text = title
            bodyLabel.text = body
            leftButton.setTitle(leftButtonTitle, for: .normal)
        } else {
            vsView.isHidden = false
            secondPlayerNameTextField.isHidden = false
            titleLabel.isHidden = true
            bodyLabel.isHidden = true
            leftButton.setTitle(leftButtonTitle, for: .normal)
        }
        if rightButtonTitle == nil {
            rightButton.isHidden = true
            rightButton.setTitle(rightButtonTitle, for: .normal)
        } else {
            rightButton.setTitle(rightButtonTitle, for: .normal)
        }
    }
    
    @IBAction func leftButtonTapped(_ sender: Any) {
        delegateLeftButton?.leftButtonTapped()
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        delegateRightButton?.rightButtonTapped()
    }
}
