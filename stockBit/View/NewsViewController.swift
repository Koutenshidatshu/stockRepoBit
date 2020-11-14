//
//  NewsViewController.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel  = NewsViewModelFactory.create()
    private let disposeBag = DisposeBag()
    var newsTappedName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        bindingViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.filterByCategory(name: newsTappedName)
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
    }

    private func bindingViewModel() {
        viewModel.news
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
        viewModel.getNews()
    }
    
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell
        print("####", viewModel.itemAt(index: indexPath.row))
        cell?.setup(article: viewModel.itemAt(index: indexPath.row))
        return cell ?? UITableViewCell()
    }
    
}
