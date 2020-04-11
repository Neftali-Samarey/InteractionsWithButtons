//
//  ViewController.swift
//  StackOfButtonsInteractions
//
//  Created by Neftali Samarey on 4/11/20.
//  Copyright © 2020 Neftali Samarey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36.0, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "?"
        return label
    }()
    
    let dashboardView : Dashboard = {
        
        let dashboard = Dashboard()
        dashboard.translatesAutoresizingMaskIntoConstraints = false
        dashboard.layer.backgroundColor = UIColor.black.cgColor
        dashboard.alpha = 0.8
        dashboard.layer.cornerRadius = 15
        return dashboard
    }()
   

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemTeal
        
        dashboardView.delegate = self
        
        // Do any additional setup after loading the view.
        view.addSubview(mainLabel)
        view.addSubview(dashboardView)
        dashboardView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        dashboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        dashboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        dashboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45).isActive = true
        
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        mainLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
    }
    
    // MARK: - Methods
    internal func animateWith(text: String) {
        self.mainLabel.fadeTransition(0.2)
        self.mainLabel.text = text
    }

}

extension ViewController: GetSelectedItemDelegate {
    func selectedItem(itemSelection: ItemSelection) {
        switch itemSelection {
        case .Fries:
            animateWith(text: "Fries again?")
        case .Burger:
            animateWith(text: "Thats for the summer!")
        case .Pizza:
            animateWith(text: "Meehh, pizza?")
        default:
            print("None selected")
        }
    }

}



extension UIView {
    
  func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    
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

