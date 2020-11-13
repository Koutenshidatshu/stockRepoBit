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
    private var tempPrice: Double = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(coin: CoinInfo, price: Double) {
        priceLabel.text = "$ " + "\(price)"
        nameLabel.text = coin.name
        fullNameLabel.text = coin.fullName
        tempPrice = price
    }
    
    func updatePrice(price: Double) {
        updateTickerView(price: price)
        priceLabel.text = "$ " + "\(price)"
        tempPrice = price
    }
    
    private func updateTickerView(price: Double) {
        if tempPrice > price {
            tickerView.backgroundColor = #colorLiteral(red: 0.09207006544, green: 0.6476076245, blue: 0.2091273367, alpha: 1)
        } else if tempPrice < price { tickerView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) }
    }

}
