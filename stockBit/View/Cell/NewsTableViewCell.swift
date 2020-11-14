//
//  NewsTableViewCell.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(article: Article) {
        sourceLabel.text = article.categories
        titleLabel.text = article.title
        bodyLabel.text = article.body
    }
    
}
