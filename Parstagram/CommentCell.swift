//
//  CommentCell.swift
//  Parstagram
//
//  Created by Roy Perlman on 3/25/20.
//  Copyright © 2020 Roy Perlman. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
