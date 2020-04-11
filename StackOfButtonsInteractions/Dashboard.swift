//
//  Dashboard.swift
//  StackOfButtonsInteractions
//
//  Created by Neftali Samarey on 4/11/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit

enum ItemSelection : String {
    case Fries = "Fries"
    case Burger = "Burger"
    case Pizza = "Pizza"
}

protocol GetSelectedItemDelegate {
    func selectedItem(itemSelection: ItemSelection)
}

class Dashboard: UIView {
    
        // MARK: - Properties
        var delegate : GetSelectedItemDelegate? = nil
    
        // Constant references
       let fries = UIImage(named: "Fries")
       let burger = UIImage(named: "Burger")
       let pizza = UIImage(named: "Pizza")
    
        // Labels
        lazy var dashboardLabel : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
            label.text = "Pick your Food"
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
       
       // buttons
       lazy var first_button : UIButton = {
           let button = UIButton(type: .custom)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(self.fries, for: .normal)
           button.addTarget(self, action: #selector(Dashboard.firstButtonAction(sender:)), for: .touchUpInside)
           return button
       }()
       
       lazy var second_button : UIButton = {
           let button = UIButton(type: .custom)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(self.burger, for: .normal)
           button.addTarget(self, action: #selector(Dashboard.secondButtonAction(sender:)), for: .touchUpInside)
           return button
       }()
       
       lazy var third_button : UIButton = {
           let button = UIButton(type: .custom)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setImage(self.pizza, for: .normal)
           button.addTarget(self, action: #selector(Dashboard.thirdButtonAction(sender:)), for: .touchUpInside)
           return button
       }()
       
       lazy var horizontalStack : UIStackView = {
           let vstack = UIStackView()
           vstack.translatesAutoresizingMaskIntoConstraints = false
           vstack.axis = .horizontal
           vstack.distribution = .fillEqually
           vstack.spacing = 35
           return vstack
       }()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(dashboardLabel)
        
        dashboardLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        dashboardLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        dashboardLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        dashboardLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalStack)
        
        horizontalStack.topAnchor.constraint(equalTo: dashboardLabel.bottomAnchor, constant: 15).isActive = true
        horizontalStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        horizontalStack.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        // Set the explicit heights and widths of all the subview buttons
        for view in horizontalStack.arrangedSubviews {
        if let button = view as? UIButton{
                DispatchQueue.main.async {
                    button.sizeToFit()
                    button.height(constant: 150)
                    button.width(constant: 150)
                }
           }
        }

        // Add the icons to the stack
        horizontalStack.addArrangedSubview(first_button)
        horizontalStack.addArrangedSubview(second_button)
        horizontalStack.addArrangedSubview(third_button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    @objc func firstButtonAction(sender: UIButton) {
        self.delegate?.selectedItem(itemSelection: .Fries)
    }
    
    @objc func secondButtonAction(sender: UIButton) {
        self.delegate?.selectedItem(itemSelection: .Burger)
    }
    
    @objc func thirdButtonAction(sender: UIButton) {
        self.delegate?.selectedItem(itemSelection: .Pizza)
    }
    
}
