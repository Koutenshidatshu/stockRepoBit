//
//  CryptoListApiMock.swift
//  stockBitTests
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import Foundation
import RxSwift
@testable import stockBit

class CryptoListApiMock: GetCryptoLists {
    func get() -> Observable<Data> {
        return .just(sample.data(using: .utf8)!)
    }
    
    let sample = {
        """
        {
           "Message":"Success",
           "Type":100,
           "SponsoredData":[
              {
                 "CoinInfo":{
                    "Id":"936905",
                    "Name":"FFYI",
                    "FullName":"Fiscus FYI",
                    "Internal":"FFYI",
                    "ImageUrl":"/media/37305691/ffyi.png",
                    "Url":"/coins/ffyi/overview",
                    "Algorithm":"N/A",
                    "ProofType":"N/A",
                    "Rating":{
                       "Weiss":{
                          "Rating":"",
                          "TechnologyAdoptionRating":"",
                          "MarketPerformanceRating":""
                       }
                    },
                 }
              }
           ],
           "Data":[
              {
                 "CoinInfo":{
                    "Id":"1182",
                    "Name":"BTC",
                    "FullName":"Bitcoin",
                    "Internal":"BTC",
                    "ImageUrl":"/media/19633/btc.png",
                    "Url":"/coins/btc/overview",
                    "Algorithm":"SHA-256",
                    "ProofType":"PoW",
                    "Rating":{
                       "Weiss":{
                          "Rating":"B+",
                          "TechnologyAdoptionRating":"A-",
                          "MarketPerformanceRating":"C+"
                       }
                    },
                    "NetHashesPerSecond":132786306440.36441,
                    "BlockNumber":656620,
                    "BlockTime":585.8287671232878,
                    "BlockReward":6.25,
                    "AssetLaunchDate":"2009-01-03",
                    "MaxSupply":20999999.9769,
                    "Type":1,
                    "DocumentType":"Webpagecoinp"
                 },
                 "RAW":{
                    "USD":{
                       "TYPE":"5",
                       "MARKET":"CCCAGG",
                       "FROMSYMBOL":"BTC",
                       "TOSYMBOL":"USD",
                       "FLAGS":"2052",
                       "PRICE":16040.68,
                       "LASTUPDATE":1605198883,
                       "MEDIAN":16045.9,
                       "LASTVOLUME":0.018316,
                       "LASTVOLUMETO":293.86208716,
                       "LASTTRADEID":"3236838",
                       "VOLUMEDAY":45766.903740408045,
                       "VOLUMEDAYTO":726749490.03997,
                       "VOLUME24HOUR":65967.68705604,
                       "VOLUME24HOURTO":1046289387.0166619,
                       "OPENDAY":15707.08,
                       "HIGHDAY":16170.89,
                       "LOWDAY":15476.25,
                       "OPEN24HOUR":15778.07,
                       "HIGH24HOUR":16174.31,
                       "LOW24HOUR":15456.03,
                       "LASTMARKET":"binanceusa",
                       "VOLUMEHOUR":2118.6105242100252,
                       "VOLUMEHOURTO":34120749.594278164,
                       "OPENHOUR":16154.3,
                       "HIGHHOUR":16170.89,
                       "LOWHOUR":16034.24,
                       "TOPTIERVOLUME24HOUR":64797.98251693999,
                       "TOPTIERVOLUME24HOURTO":1028031198.7332991,
                       "CHANGE24HOUR":262.6100000000006,
                       "CHANGEPCT24HOUR":1.6643987509245464,
                       "CHANGEDAY":333.60000000000036,
                       "CHANGEPCTDAY":2.123882987799135,
                       "CHANGEHOUR":-113.61999999999898,
                       "CHANGEPCTHOUR":-0.7033421441968948,
                       "CONVERSIONTYPE":"direct",
                       "CONVERSIONSYMBOL":"",
                       "SUPPLY":18541346.04497096,
                       "MKTCAP":297415798676.6448,
                       "MKTCAPPENALTY":0,
                       "TOTALVOLUME24H":391486.00023953174,
                       "TOTALVOLUME24HTO":6267824482.932835,
                       "TOTALTOPTIERVOLUME24H":381408.1536794704,
                       "TOTALTOPTIERVOLUME24HTO":6106673639.096678,
                       "IMAGEURL":"/media/19633/btc.png"
                    }
                 },
                 "DISPLAY":{
                    "USD":{
                       "FROMSYMBOL":"Ƀ",
                       "TOSYMBOL":"$",
                       "MARKET":"CryptoCompare Index",
                       "PRICE":"$ 16,040.7",
                       "LASTUPDATE":"Just now",
                       "LASTVOLUME":"Ƀ 0.01832",
                       "LASTVOLUMETO":"$ 293.86",
                       "LASTTRADEID":"3236838",
                       "VOLUMEDAY":"Ƀ 45,766.9",
                       "VOLUMEDAYTO":"$ 726,749,490.0",
                       "VOLUME24HOUR":"Ƀ 65,967.7",
                       "VOLUME24HOURTO":"$ 1,046,289,387.0",
                       "OPENDAY":"$ 15,707.1",
                       "HIGHDAY":"$ 16,170.9",
                       "LOWDAY":"$ 15,476.3",
                       "OPEN24HOUR":"$ 15,778.1",
                       "HIGH24HOUR":"$ 16,174.3",
                       "LOW24HOUR":"$ 15,456.0",
                       "LASTMARKET":"binanceusa",
                       "VOLUMEHOUR":"Ƀ 2,118.61",
                       "VOLUMEHOURTO":"$ 34,120,749.6",
                       "OPENHOUR":"$ 16,154.3",
                       "HIGHHOUR":"$ 16,170.9",
                       "LOWHOUR":"$ 16,034.2",
                       "TOPTIERVOLUME24HOUR":"Ƀ 64,798.0",
                       "TOPTIERVOLUME24HOURTO":"$ 1,028,031,198.7",
                       "CHANGE24HOUR":"$ 262.61",
                       "CHANGEPCT24HOUR":"1.66",
                       "CHANGEDAY":"$ 333.60",
                       "CHANGEPCTDAY":"2.12",
                       "CHANGEHOUR":"$ -113.62",
                       "CHANGEPCTHOUR":"-0.70",
                       "CONVERSIONTYPE":"direct",
                       "CONVERSIONSYMBOL":"",
                       "SUPPLY":"Ƀ 18,541,346.0",
                       "MKTCAP":"$ 297.42 B",
                       "MKTCAPPENALTY":"0 %",
                       "TOTALVOLUME24H":"Ƀ 391.49 K",
                       "TOTALVOLUME24HTO":"$ 6.27 B",
                       "TOTALTOPTIERVOLUME24H":"Ƀ 381.41 K",
                       "TOTALTOPTIERVOLUME24HTO":"$ 6.11 B",
                       "IMAGEURL":"/media/19633/btc.png"
                    }
                 }
              },
              {
                 "CoinInfo":{
                    "Id":"7605",
                    "Name":"ETH",
                    "FullName":"Ethereum",
                    "Internal":"ETH",
                    "ImageUrl":"/media/20646/eth_logo.png",
                    "Url":"/coins/eth/overview",
                    "Algorithm":"Ethash",
                    "ProofType":"PoW",
                    "Rating":{
                       "Weiss":{
                          "Rating":"B+",
                          "TechnologyAdoptionRating":"A",
                          "MarketPerformanceRating":"D+"
                       }
                    },
                    "NetHashesPerSecond":257238449589951.6,
                    "BlockNumber":11239424,
                    "BlockTime":13.228282518768232,
                    "BlockReward":2.647925378066038,
                    "AssetLaunchDate":"2015-07-30",
                    "MaxSupply":-1,
                    "Type":1,
                    "DocumentType":"Webpagecoinp"
                 },
                 "RAW":{
                    "USD":{
                       "TYPE":"5",
                       "MARKET":"CCCAGG",
                       "FROMSYMBOL":"ETH",
                       "TOSYMBOL":"USD",
                       "FLAGS":"2052",
                       "PRICE":457,
                       "LASTUPDATE":1605198883,
                       "MEDIAN":457.23,
                       "LASTVOLUME":0.00000184,
                       "LASTVOLUMETO":0.000841248,
                       "LASTTRADEID":"66770829",
                       "VOLUMEDAY":272705.2174378265,
                       "VOLUMEDAYTO":125699920.05190916,
                       "VOLUME24HOUR":466493.10737805004,
                       "VOLUME24HOURTO":216418494.60360983,
                       "OPENDAY":463.91,
                       "HIGHDAY":470.4,
                       "LOWDAY":452.89,
                       "OPEN24HOUR":470.9,
                       "HIGH24HOUR":476.72,
                       "LOW24HOUR":451.94,
                       "LASTMARKET":"Coinbase",
                       "VOLUMEHOUR":12740.913630020033,
                       "VOLUMEHOURTO":5843663.732065838,
                       "OPENHOUR":462.01,
                       "HIGHHOUR":462.07,
                       "LOWHOUR":456.78,
                       "TOPTIERVOLUME24HOUR":465894.60303588,
                       "TOPTIERVOLUME24HOURTO":216145209.30610406,
                       "CHANGE24HOUR":-13.899999999999977,
                       "CHANGEPCT24HOUR":-2.951794436186022,
                       "CHANGEDAY":-6.910000000000025,
                       "CHANGEPCTDAY":-1.4895130521006283,
                       "CHANGEHOUR":-5.009999999999991,
                       "CHANGEPCTHOUR":-1.0843921127248308,
                       "CONVERSIONTYPE":"direct",
                       "CONVERSIONSYMBOL":"",
                       "SUPPLY":113388347.874,
                       "MKTCAP":51818474978.418,
                       "MKTCAPPENALTY":0,
                       "TOTALVOLUME24H":4899128.522684848,
                       "TOTALVOLUME24HTO":2242132879.3988166,
                       "TOTALTOPTIERVOLUME24H":4719187.275594147,
                       "TOTALTOPTIERVOLUME24HTO":2159899960.6652317,
                       "IMAGEURL":"/media/20646/eth_logo.png"
                    }
                 },
                 "DISPLAY":{
                    "USD":{
                       "FROMSYMBOL":"Ξ",
                       "TOSYMBOL":"$",
                       "MARKET":"CryptoCompare Index",
                       "PRICE":"$ 457.00",
                       "LASTUPDATE":"Just now",
                       "LASTVOLUME":"Ξ 0.00000184",
                       "LASTVOLUMETO":"$ 0.0008412",
                       "LASTTRADEID":"66770829",
                       "VOLUMEDAY":"Ξ 272,705.2",
                       "VOLUMEDAYTO":"$ 125,699,920.1",
                       "VOLUME24HOUR":"Ξ 466,493.1",
                       "VOLUME24HOURTO":"$ 216,418,494.6",
                       "OPENDAY":"$ 463.91",
                       "HIGHDAY":"$ 470.40",
                       "LOWDAY":"$ 452.89",
                       "OPEN24HOUR":"$ 470.90",
                       "HIGH24HOUR":"$ 476.72",
                       "LOW24HOUR":"$ 451.94",
                       "LASTMARKET":"Coinbase",
                       "VOLUMEHOUR":"Ξ 12,740.9",
                       "VOLUMEHOURTO":"$ 5,843,663.7",
                       "OPENHOUR":"$ 462.01",
                       "HIGHHOUR":"$ 462.07",
                       "LOWHOUR":"$ 456.78",
                       "TOPTIERVOLUME24HOUR":"Ξ 465,894.6",
                       "TOPTIERVOLUME24HOURTO":"$ 216,145,209.3",
                       "CHANGE24HOUR":"$ -13.90",
                       "CHANGEPCT24HOUR":"-2.95",
                       "CHANGEDAY":"$ -6.91",
                       "CHANGEPCTDAY":"-1.49",
                       "CHANGEHOUR":"$ -5.01",
                       "CHANGEPCTHOUR":"-1.08",
                       "CONVERSIONTYPE":"direct",
                       "CONVERSIONSYMBOL":"",
                       "SUPPLY":"Ξ 113,388,347.9",
                       "MKTCAP":"$ 51.82 B",
                       "MKTCAPPENALTY":"0 %",
                       "TOTALVOLUME24H":"Ξ 4.90 M",
                       "TOTALVOLUME24HTO":"$ 2.24 B",
                       "TOTALTOPTIERVOLUME24H":"Ξ 4.72 M",
                       "TOTALTOPTIERVOLUME24HTO":"$ 2.16 B",
                       "IMAGEURL":"/media/20646/eth_logo.png"
                    }
                 }
              }
           ],
           "RateLimit":{
              
           },
           "HasWarning":false
        }
        """
    }()
    
}
