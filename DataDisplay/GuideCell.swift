//
//  GuideCell.swift
//  DataDisplay
//
//  Created by Trevor Steele on 1/23/22.
//

import Foundation
import UIKit

final class GuideCell: UITableViewCell {
    
    static let identifier = "guideCell"
    var nameLabel = UILabel()
    var endDateLabel = UILabel()
    
    func configure(with guide: Guide) {
        nameLabel.text = guide.name
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        endDateLabel.text = "End Date: \(dateFormatter.string(from: guide.endDate))"
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(endDateLabel)
        
        updateConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        endDateLabel.text = nil
    }
    
    override func updateConstraints() {
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.positivePadding).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.positivePadding).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Constants.negativePadding).isActive = true
        
        endDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.positivePadding).isActive = true
        endDateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.positivePadding).isActive = true
        endDateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: Constants.negativePadding).isActive = true
        endDateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.negativePadding).isActive = true
        
        super.updateConstraints()
    }
}
