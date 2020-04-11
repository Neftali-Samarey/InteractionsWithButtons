//
//  ViewController.swift
//  StackOfButtonsInteractions
//
//  Created by Neftali Samarey on 4/11/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // buttons
    let first_button : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 1", for: .normal)
        button.addTarget(self, action: #selector(ViewController.firstButtonAction), for: .touchUpInside)
        return button
    }()
    
    let second_button : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 2", for: .normal)
        button.addTarget(self, action: #selector(ViewController.secondButtonAction), for: .touchUpInside)
        return button
    }()
    
    let third_button : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button 3", for: .normal)
        button.addTarget(self, action: #selector(ViewController.thirdButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var verticalStack : UIStackView = {
        let vstack = UIStackView()
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .vertical
        vstack.distribution = .fillEqually
        vstack.spacing = 5
        return vstack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemTeal
        // Do any additional setup after loading the view.
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStack)
        
        verticalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        verticalStack.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        verticalStack.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        

        verticalStack.addArrangedSubview(first_button)
        verticalStack.addArrangedSubview(second_button)
        verticalStack.addArrangedSubview(third_button)
        
    }

    // MARK: - Actions
    @objc func firstButtonAction() {
        print("Selected 1st")
    }
    
    @objc func secondButtonAction() {
        print("Selected 2nd")
    }
    
    @objc func thirdButtonAction() {
        print("Selected 3rd")
    }

}

extension UIView {
  func height(constant: CGFloat) {
    setConstraint(value: constant, attribute: .height)
  }
  
  func width(constant: CGFloat) {
    setConstraint(value: constant, attribute: .width)
  }
  
    private func removeConstraint(attribute: NSLayoutConstraint.Attribute) {
    constraints.forEach {
      if $0.firstAttribute == attribute {
        removeConstraint($0)
      }
    }
  }
  
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute) {
    removeConstraint(attribute: attribute)
    let constraint =
      NSLayoutConstraint(item: self,
                         attribute: attribute,
                         relatedBy: NSLayoutConstraint.Relation.equal,
                         toItem: nil,
                         attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                         multiplier: 1,
                         constant: value)
    self.addConstraint(constraint)
        constraint.priority = UILayoutPriority(rawValue: 999)
  }
}

