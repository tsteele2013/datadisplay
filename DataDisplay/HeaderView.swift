//
//  HeaderView.swift
//  DataDisplay
//
//  Created by Trevor Steele on 1/24/22.
//

import Foundation
import UIKit

final class HeaderView: UIView {
    
    var label = UILabel()
    
    func configure(with date: Date) {
        label.text = dateFormatter.string(from: date)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.positivePadding).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Constants.negativePadding).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.heightAnchor.constraint(equalToConstant: Constants.headerHeight).isActive = true
        
        super.updateConstraints()
    }
}
