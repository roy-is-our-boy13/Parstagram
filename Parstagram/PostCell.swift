//
//  PostCell.swift
//  Parstagram
//
//  Created by Roy Perlman on 3/18/20.
//  Copyright © 2020 Roy Perlman. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell
{
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
