//
//  ViewController.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 11/11/20.
//

import UIKit
import RxSwift
import RxCocoa
import Starscream

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = CryptoViewModelFactory.create()
    private let disposeBag = DisposeBag()
    private var socket: WebSocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectWebsocket()
        registerCell()
        bindingViewModel()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "CryptoCoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
    }
    
    private func bindingViewModel() {
        viewModel.coinList
            
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [weak self] _ in
                self?.tableView.reloadData()
                self?.requestSubjectWebsocket()
            })
            .disposed(by: disposeBag)
        
        viewModel.getCryptoList()
    }
    
    private func connectWebsocket() {
        var request = URLRequest(url: URL(string: "wss://streamer.cryptocompare.com/v2?api_key=5dd1b8474e8e767024d92ba1f891eefdafb458018a2dd6ebb79f4b55bd5c15f9")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket?.delegate = self
        socket!.connect()
    }
    
    private func requestSubjectWebsocket() {
        let dic : NSDictionary = ["action" : "SubAdd",
                                  "subs" : getCoinArray()]
        let jsonData = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        socket?.write(string: jsonString!)
        socket?.respondToPingWithPong = true
    }
    
    private func getCoinArray() -> [String] {
        var arrayCoin = [String]()
        
        for i in 0...viewModel.coinCount() - 1 {
            let coinName = viewModel.getCoinName(index: i)
            arrayCoin.append("5~CCCAGG~\(coinName)~USD")
            
        }
        return arrayCoin
    }
    
    deinit {
      socket?.disconnect()
      socket?.delegate = nil
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coinCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as? CryptoCoinTableViewCell
        cell?.setup(coin: viewModel.itemAt(index: indexPath.row),
                    price: viewModel.getPriceItemAt(index: indexPath.row).price)
        return cell ?? UITableViewCell()
    }
    
    
}

extension ViewController : WebSocketDelegate {
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        print("@@@ event", event)
        switch event {
        case .text(let str):
            print("@@@", str)
            guard let data = str.data(using: .utf16),
                  let jsonData = try? JSONSerialization.jsonObject(with: data),
                  let jsonDict = jsonData as? [String: Any],
                  let messageType = jsonDict["TYPE"] as? String else {
                return
            }
            if messageType == "5",
               let price = jsonDict["PRICE"] as? Double {
                if let type = jsonDict["FROMSYMBOL"] as? String {
                    for i in 0...viewModel.coinCount() - 1 {
                        if type == viewModel.itemAt(index: i).name {
                            let indexPath = IndexPath(row: i, section: 0)
                            let cell = tableView.cellForRow(at: indexPath) as? CryptoCoinTableViewCell
                            cell?.updatePrice(price: price)
                            
                        }
                    }
                }
            }
        default:
            break
            
        }
    }
}


