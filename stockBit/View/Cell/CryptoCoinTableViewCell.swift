//
//  CryptoCoinTableViewCell.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 13/11/20.
//

import UIKit

class CryptoCoinTableViewCell: UITableViewCell {

    @IBOutlet weak var tickerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(coin: CoinInfo) {
        priceLabel.text = "$" + "0"
        nameLabel.text = coin.name
        fullNameLabel.text = coin.fullName
    }

}
