//
//  RemainderCell.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit

class RemainderCell: UITableViewCell {
    static let reuseIdentifier = "remainderCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func configure(with viewModel:Remainder)  {
        self.titleLabel.text = viewModel.name
    }
}

