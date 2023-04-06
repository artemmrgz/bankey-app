//
//  ViewController.swift
//  Password
//
//  Created by Artem Marhaza on 05/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeholderText: "New password")
    let passwordStatusView = UIView()
    
    let criteriaView = PasswordCriteriaView(criterion: "uppercase letter (A-Z)")
    
    let repeatPasswordTextField = PasswordTextField(placeholderText: "Re-enter new password")
    let resetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        passwordStatusView.backgroundColor = .secondarySystemBackground
        
        resetButton.setTitle("Reset password", for: .normal)
        resetButton.configuration = .filled()
        
        criteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(passwordStatusView)
        stackView.addArrangedSubview(criteriaView)
        stackView.addArrangedSubview(repeatPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}
