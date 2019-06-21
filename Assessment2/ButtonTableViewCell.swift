//
//  ButtonTableViewCell.swift
//  Assessment2
//
//  Created by Drew Seeholzer on 6/21/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    func updateButton (_ isChecked: Bool) {
        if isChecked == true {
            isCheckedButton.setImage(UIImage(contentsOfFile: "complete"), for: .normal)
        } else {
            isCheckedButton.setImage(UIImage(contentsOfFile: "incomplete"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var listItemLabel: UILabel!
    
    @IBOutlet weak var isCheckedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var delegate: ButtonTableViewCellDelegate?

    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ButtonTableViewCell {
    func update(withItem item: List) {
        listItemLabel.text = item.item
        updateButton(item.isChecked)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    var delegate: ButtonTableViewCellDelegate? {get}
    
}
