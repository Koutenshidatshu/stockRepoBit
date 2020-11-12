//
//  ViewController.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 11/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = CryptoViewModelFactory.create()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        bindingViewModel()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "CryptoCoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
    }
    
    func bindingViewModel() {
        viewModel.coinList
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel.getCryptoList()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? CryptoCoinTableViewCell
        cell?.setup(coin: viewModel.itemAt(index: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
    
}
