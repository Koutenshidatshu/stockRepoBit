import XCTest
import RxSwift
@testable import stockBit

class NewstResponseTest: XCTestCase {
    
    private let emptyData = {
        return """
       []
       """
    }()
    
    func testParseWithEmptyData() {
        let disposeBag = DisposeBag()
        let newsResponse = NewsRequester(requestApi: .just(emptyData.data(using: .utf8)!))
        var result: NewsResponse?
        
        
        newsResponse.request()
            .subscribe(onSuccess: { result = $0 })
            .disposed(by: disposeBag)
        
        XCTAssertNil(result)
    }
    
    
    func testParseWithValidData() {
        let disposeBag = DisposeBag()
        let newsResponse = NewsRequester(requestApi:
            .just(validData.data(using: .utf8)!))
        var result: NewsResponse?
        
        newsResponse.request()
            .subscribe(onSuccess: { result = $0 },
                       onError: { XCTFail("fail with error \($0.localizedDescription)") })
            .disposed(by: disposeBag)
        
        XCTAssertNotNil(result)
        XCTAssertGreaterThan(result!.data.count, 1)
        XCTAssertEqual(result!.data.first?.body, "A skilled coder has just made $5 million worth of dai by flashloaning 80,000 eth, currently worth about $37 million. The return itself is substantial, more than 10%, but here...")
        XCTAssertEqual(result!.data.first?.categories, "ETH")
        XCTAssertEqual(result!.data.first?.tags, "Ethereum|News|Smart Contracts")
        XCTAssertEqual(result!.data.first?.title, "Guy Makes $5 Million From an 80,000 Ethereum Flashloan")
        
        XCTAssertEqual(result!.data.last?.body, "Blockchain analysis firm Chainalysis is launching a new program to help governments recover, store, and sell cryptoassets seized their operations, less than two weeks after the U.S. government seized over 69,000 BTC worth over $1 billion. According to announcement Chainalysis published, the program could help government agencies and insolvency practitioners “handle, store, realize, and monitor […]")
        XCTAssertEqual(result!.data.last?.categories, "BTC|Market|Blockchain|Altcoin|Business")
        XCTAssertEqual(result!.data.last?.tags, "Altcoins|Business|Security")
        XCTAssertEqual(result!.data.last?.title, "Chainalysis Launches Program to Help Governments Store and Sell Seized Cryptoassets")
       
    }
    
    private let validData = {
        """
    {
       "Type":100,
       "Message":"News list successfully returned",
       "Promoted":[
          
       ],
       "Data":[
          {
             "id":"25113336",
             "guid":"https://www.trustnodes.com/?p=33464",
             "published_on":1605373250,
             "imageurl":"https://images.cryptocompare.com/news/trustnodes/81wgE6gw080.jpeg",
             "title":"Guy Makes $5 Million From an 80,000 Ethereum Flashloan",
             "url":"https://www.trustnodes.com/2020/11/14/guy-makes-5-million-from-an-80000-ethereum-flashloan",
             "source":"trustnodes",
             "body":"A skilled coder has just made $5 million worth of dai by flashloaning 80,000 eth, currently worth about $37 million. The return itself is substantial, more than 10%, but here...",
             "tags":"Ethereum|News|Smart Contracts",
             "categories":"ETH",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"TrustNodes",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/trustnodes.png"
             }
          },
          {
             "id":"25113304",
             "guid":"https://decrypt.co/?p=48252",
             "published_on":1605373006,
             "imageurl":"https://images.cryptocompare.com/news/decrypt/c4sB0da0g4U.jpeg",
             "title":"Wall Street’s Fidelity Mounts Defense For Bitcoin",
             "url":"https://decrypt.co/48252/wall-streets-fidelity-mounts-defense-for-bitcoin",
             "source":"decrypt",
             "body":"In a bid to promote Bitcoin as a viable asset, Fidelity published a six-pronged response to most common criticisms.",
             "tags":"Coins|BTC",
             "categories":"BTC",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Decrypt",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/decrypt.png"
             }
          },
          {
             "id":"25113102",
             "guid":"https://cryptobriefing.com/?p=72707",
             "published_on":1605372169,
             "imageurl":"https://images.cryptocompare.com/news/cryptobriefing/dE99o2io8Cg.png",
             "title":"$50 Million Lost: The Top 19 DeFi Cryptocurrency Hacks of 2020",
             "url":"https://cryptobriefing.com/50-million-lost-the-top-19-defi-cryptocurrency-hacks-2020/",
             "source":"cryptobriefing",
             "body":"",
             "tags":"Analysis|Hacks",
             "categories":"Market",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Crypto Briefing",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/cryptobriefing.png"
             }
          },
          {
             "id":"25112940",
             "guid":"https://www.trustnodes.com/?p=33447",
             "published_on":1605371441,
             "imageurl":"https://images.cryptocompare.com/news/trustnodes/e2041040000.jpeg",
             "title":"Why is Bitcoin Rising?",
             "url":"https://www.trustnodes.com/2020/11/14/why-is-bitcoin-rising",
             "source":"trustnodes",
             "body":"Unnoticeably, bitcoin is moving and, what in 2017 felt like the stratosphere, now feels like nothing. This thing was at $3,000 just a few months back in March 2020, and...",
             "tags":"Bitcoin|Editorial",
             "categories":"BTC",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"TrustNodes",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/trustnodes.png"
             }
          },
          {
             "id":"25112951",
             "guid":"http://eng.ambcrypto.com/?p=72160",
             "published_on":1605371419,
             "imageurl":"https://images.cryptocompare.com/news/ambcrypto/c0p7ekx10oO.jpeg",
             "title":"Bitstamp still ‘assessing support’ for XRP Utility fork airdrop",
             "url":"https://eng.ambcrypto.com/bitstamp-still-assessing-support-for-xrp-utility-fork-airdrop/",
             "source":"ambcrypto",
             "body":"With the Flare Network scheduled to carry out an airdrop of Spark Tokens almost a month from now, it has been receiving support from a host of exchanges including Bitrue, Cred, Uphold, and Bitbns. However, there are many exchanges that have not yet confirmed their support of the airdrop, exchanges like Bitstamp. Bitstamp revealed that [&#8230;]The post Bitstamp still &#8216;assessing support&#8217; for XRP Utility fork airdrop appeared first on AMBCrypto.",
             "tags":"Altcoins|News|Social|Trading View|XRP",
             "categories":"XRP|ICO|Altcoin",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"AMB Crypto",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/ambcrypto.png"
             }
          },
          {
             "id":"25112994",
             "guid":"https://dailyhodl.com/?p=117358",
             "published_on":1605371418,
             "imageurl":"https://images.cryptocompare.com/news/dailyhodl/cZza03FCxc0.jpeg",
             "title":"Here’s Why PayPal Is Not Supporting Fourth-Largest Crypto Asset XRP",
             "url":"https://dailyhodl.com/2020/11/14/heres-why-paypal-is-not-supporting-fourth-largest-crypto-asset-xrp/",
             "source":"dailyhodl",
             "body":"Crypto enthusiasts wondering why PayPal has skipped over the fourth-largest cryptocurrency by market cap, XRP, are getting some answers. PayPal has partnered with the crypto exchange and stablecoin issuer Paxos Trust Company to allow its millions of users in the US to buy, sell and store Bitcoin (BTC), Ethereum (ETH), Bitcoin Cash (BCH) and Litecoin [&#8230;]The post Here&#8217;s Why PayPal Is Not Supporting Fourth-Largest Crypto Asset XRP appeared first on The Daily Hodl.",
             "tags":"Ripple and XRP|News|Ripple|XRP",
             "categories":"XRP|BCH|ETH|LTC|Exchange",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"The Daily Hodl",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/dailyhodl.png"
             }
          },
          {
             "id":"25112908",
             "guid":"https://en.ethereumworldnews.com/?p=564610",
             "published_on":1605371316,
             "imageurl":"https://images.cryptocompare.com/news/ethereumworldnews/d5Ao63IOk1P.jpeg",
             "title":"Tron’s (TRX) Total Transaction Volume in October Surpasses Ethereum’s",
             "url":"https://en.ethereumworldnews.com/trons-trx-total-transaction-volume-in-october-surpasses-ethereums/",
             "source":"ethereumworldnews",
             "body":"Quick take: In the month of October, Tron and Ethereum generated $280 million and $159 Million in transaction volume respectively Tron&#8217;s daily active addresses increased by 248% in the month of October Ethereum&#8217;s daily active addresses rose by 10% in the same time period TRONCHAIN and TRON2GET were the 2 Dapps behind Tron&#8217;s impressive growth The month of October has been an active one for the Tron (TRX) network. According to DappRadar&#8217;s most recent DeFi and Exchanges report, the Tron [&#8230;]",
             "tags":"TRON (TRX) News|DeFi|defi|Ethereum (ETH)|Tron (TRX)",
             "categories":"TRX|ETH",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Ethereum World News",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/ethereumworldnews.png"
             }
          },
          {
             "id":"25112855",
             "guid":"https://bitcoinist.com/?p=143540",
             "published_on":1605371151,
             "imageurl":"https://images.cryptocompare.com/news/bitcoinist/9u1q6ynAQxE.jpeg",
             "title":"Indicator Suggests Bitcoin is Overbought; $13,300 Could be Imminent",
             "url":"https://bitcoinist.com/indicator-suggests-bitcoin-is-overbought-13300-could-be-imminent/?utm_source=rss&utm_medium=rss&utm_campaign=indicator-suggests-bitcoin-is-overbought-13300-could-be-imminent",
             "source":"bitcoinist",
             "body":"Bitcoin is currently struggling to hold above its crucial $16,000 support level as buyers and sellers both fight for control of its near-term price action Where it trends next will likely depend largely on the continued reaction to this level, as a sustained decline below it could strike a serious blow to its technical outlook One trader is noting that one technical indicator is suggesting that Bitcoin is overbought at the present moment The same [&#8230;]",
             "tags":"Bitcoin|btcusd|BTCUSDT|xbtusd",
             "categories":"BTC|Trading",
             "upvotes":"0",
             "downvotes":"1",
             "lang":"EN",
             "source_info":{
                "name":"Bitcoinist",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/bitcoinist.png"
             }
          },
          {
             "id":"25112749",
             "guid":"https://news.bitcoin.com/?p=423679&preview=true&preview_id=423679",
             "published_on":1605370549,
             "imageurl":"https://images.cryptocompare.com/news/bitcoin.com/8idsR0gc00g.jpeg",
             "title":"Galaxy Digital Acquires 2 Crypto Firms, Sees Big Wave of Institutional Demand for Bitcoin",
             "url":"https://news.bitcoin.com/galaxy-digital-acquires-crypto-firms-institutional-demand-bitcoin/",
             "source":"bitcoin.com",
             "body":"Bitcoin Bull Michael Novogratz&#8217;s company, Galaxy Digital, has acquired two cryptocurrency firms in preparation to meet a &#8220;bigger wave of institutional demand&#8221; for bitcoin. Big Wave of Institutional Demand for Bitcoin Incoming Galaxy Digital Holdings announced Friday that it has acquired two cryptocurrency trading firms: Drawbridge Lending and Blue Fire Capital. New York City-headquartered crypto [&#8230;]The post Galaxy Digital Acquires 2 Crypto Firms, Sees Big Wave of Institutional Demand for Bitcoin appeared first on Bitcoin News.",
             "tags":"News|crypto companies|Galaxy Digital|galaxy digital acquisition|institutional investors|Michael Novogratz|Mike Novogratz",
             "categories":"BTC|Trading",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Bitcoin.com",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/bitcoincom.png"
             }
          },
          {
             "id":"25112592",
             "guid":"https://www.theblockcrypto.com/linked/84544/",
             "published_on":1605369904,
             "imageurl":"https://images.cryptocompare.com/news/theblock/8j0b51gg22w.jpeg",
             "title":"U.S. regulators have hit crypto firms with at least $198 million in financial penalties to date",
             "url":"https://www.theblockcrypto.com/linked/84544/u-s-regulators-have-hit-crypto-firms-with-at-least-198-million-in-financial-penalties-to-date?utm_source=cryptocompare&utm_medium=rss",
             "source":"theblock",
             "body":"The top two U.S. market regulators — the SEC and the CFTC — have charged crypto firms and founders at least $198 million in penalties to date, according to The Block Research.The post U.S. regulators have hit crypto firms with at least $198 million in financial penalties to date appeared first on The Block.",
             "tags":"Regulation",
             "categories":"Regulation|Market",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"TheBlock",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/theblock.png"
             }
          },
          {
             "id":"25112505",
             "guid":"http://eng.ambcrypto.com/?p=72216",
             "published_on":1605369634,
             "imageurl":"https://images.cryptocompare.com/news/ambcrypto/eygcn18i1y6.jpeg",
             "title":"Chile’s CMF now working with Central Bank on crypto-regulations",
             "url":"https://eng.ambcrypto.com/chiles-cmf-now-working-with-central-bank-on-crypto-regulations/",
             "source":"ambcrypto",
             "body":"Even though the idea of cryptocurrencies has been to provide financial independence to people, for worldwide adoption, crypto will require support from world governments. This is an important step since it allows digital assets to be seen not as a threat, but as a medium of improving the flaws in traditional banking. However, not every [&#8230;]The post Chile&#8217;s CMF now working with Central Bank on crypto-regulations appeared first on AMBCrypto.",
             "tags":"News|Social|Trading View",
             "categories":"Fiat",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"AMB Crypto",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/ambcrypto.png"
             }
          },
          {
             "id":"25112506",
             "guid":"https://cryptoslate.com/?p=175938",
             "published_on":1605369628,
             "imageurl":"https://images.cryptocompare.com/news/cryptoslate/8L1CtN12waM.jpeg",
             "title":"Ethereum DeFi’s most enigmatic investor, “DegenSpartan” says this will be DeFi’s watershed moment",
             "url":"https://cryptoslate.com/ethereum-defis-most-enigmatic-investor-degenspartan-says-this-will-be-defis-watershed-moment/",
             "source":"cryptoslate",
             "body":"If you&#8217;ve followed DeFi on Twitter, you&#8217;ve likely heard of the name &#8220;DegenSpartan.&#8221; The pseudonymous investor, believed to be based in Asia, has become one of the most popular voices within the Ethereum and DeFi community, having entered this crypto industry extremely early on. The post Ethereum DeFi&#8217;s most enigmatic investor, &#8220;DegenSpartan&#8221; says this will be DeFi&#8217;s watershed moment appeared first on CryptoSlate.",
             "tags":"Culture|DeFi|ETHUSD",
             "categories":"ETH|Business|Asia",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"CryptoSlate",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/cryptoslate.png"
             }
          },
          {
             "id":"25112507",
             "guid":"https://decrypt.co/?p=48245",
             "published_on":1605369480,
             "imageurl":"https://images.cryptocompare.com/news/decrypt/c1wB90A8010.jpeg",
             "title":"Bitcoin Dips Below $16k While Wall Street Breaks Records",
             "url":"https://decrypt.co/48245/bitcoin-dips-below-16k-while-wall-street-breaks-records",
             "source":"decrypt",
             "body":"Bitcoin’s price has been on an upward spiral all this week, rising from $15,000 on Sunday to $16,000 on Thursday, while stocks ended the week with a rally following the Covid-19 vaccine breakthrough.",
             "tags":"Coins|BTC",
             "categories":"BTC|Trading",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Decrypt",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/decrypt.png"
             }
          },
          {
             "id":"25112490",
             "guid":"https://zycrypto.com/?p=46720",
             "published_on":1605369421,
             "imageurl":"https://images.cryptocompare.com/news/zycrypto/eG0w80Mwe20.jpeg",
             "title":"Bitcoin Quickly Falls Below $16,000 As Parabolic Bull Run Pauses",
             "url":"https://zycrypto.com/bitcoin-quickly-falls-below-16000-as-parabolic-bull-run-pauses/",
             "source":"zycrypto",
             "body":"Bitcoin’s price has been trending up over the past few weeks, hitting as high as $16,485. Bitcoin had shown quite some resilience above $16K which has in the past acted as a major reversal point. On Saturday, however, the flagship cryptocurrency fell to as low as $15,755 within a few hours as the bulls seemed [&#8230;]",
             "tags":"Bitcoin|Markets|News|Bitcoin News|BTCUSD|BTCUSDC|BTCUSDT|XBTUSD",
             "categories":"BTC|Trading|Market",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"ZyCrypto",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/zycrypto.png"
             }
          },
          {
             "id":"25112147",
             "guid":"https://www.cryptopolitan.com/?p=69468",
             "published_on":1605368143,
             "imageurl":"https://images.cryptocompare.com/news/cryptopolitan/e0xB0a88200.jpeg",
             "title":"BitPay Send allows companies to pay employees in crypto",
             "url":"https://www.cryptopolitan.com/bitpay-send-allows-companies-to-pay-employee/",
             "source":"cryptopolitan",
             "body":"BitPay introduces BitPay Send to businesses worldwide This new services would allow businesses to make mass payments in cryptocurrency BitPay has announced a new project called BitPay Send. BitPay Send is a new service that will allow organizations to be able to carry out mass payments. The service will enable these organizations carry out their […]",
             "tags":"Industry News",
             "categories":"Other",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Cryptopolitan",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/cryptopolitan.png"
             }
          },
          {
             "id":"25112180",
             "guid":"http://www.chaindd.com/3439906.html?lang=en&wxshare=1",
             "published_on":1605368029,
             "imageurl":"https://images.cryptocompare.com/news/chaindd/e3e6P01w040.jpeg",
             "title":"CCB Labuan Branch: Not the First Bank to Issue Bonds with Blockchain Technology",
             "url":"http://www.chaindd.com/3439906.html?lang=en&wxshare=1",
             "source":"chaindd",
             "body":"The branch clarified that CCB was not the issuer of the bond, but the lead arranger and issuance consultant of the bond.",
             "tags":"Bank,China,Blockchain,Bitcoin",
             "categories":"Blockchain|Technology|Fiat",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"Chaindd",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/chaindd.png"
             }
          },
          {
             "id":"25112103",
             "guid":"http://eng.ambcrypto.com/?p=72158",
             "published_on":1605367854,
             "imageurl":"https://images.cryptocompare.com/news/ambcrypto/93Ms20l4w80.jpeg",
             "title":"Chainlink, Waves, VeChain Price Analysis: 14 November",
             "url":"https://eng.ambcrypto.com/chainlink-waves-vechain-price-analysis-14-november/",
             "source":"ambcrypto",
             "body":"Chainlink did not have strong buying interest behind it as its price appeared to break out of a continuation pattern, one that invalidated the break. Waves, on the contrary, saw rapid gains and could post more, although it also showed some important levels to watch out for in case the surge north broke down. Finally, [&#8230;]The post Chainlink, Waves, VeChain Price Analysis: 14 November appeared first on AMBCrypto.",
             "tags":"Altcoins|Analysis|Hide Cryptopanic|News|Social|Trading View|Link|VET|WAVES",
             "categories":"Market|Trading|Altcoin",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"AMB Crypto",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/ambcrypto.png"
             }
          },
          {
             "id":"25112135",
             "guid":"https://cointelegraph.com/news/blockchain-voting-is-the-alternative-for-trusted-democratic-elections",
             "published_on":1605367800,
             "imageurl":"https://images.cryptocompare.com/news/cointelegraph/dOs06180E20.jpeg",
             "title":"Blockchain voting is the alternative for trusted democratic elections",
             "url":"https://cointelegraph.com/news/blockchain-voting-is-the-alternative-for-trusted-democratic-elections",
             "source":"cointelegraph",
             "body":"There is a way to give the voting system greater legitimacy and veracity: backing it with blockchain technology.",
             "tags":"United States|Voting|Colombia|Elections|Politics",
             "categories":"Blockchain|Technology",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"CoinTelegraph",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/cointelegraph.png"
             }
          },
          {
             "id":"25111974",
             "guid":"https://www.cryptoglobe.com/latest/2020/11/chainalysis-launches-program-to-help-governments-store-and-sell-seized-cryptoassets/",
             "published_on":1605367200,
             "imageurl":"https://images.cryptocompare.com/news/cryptoglobe/djkC1wg4LbP.jpeg",
             "title":"Chainalysis Launches Program to Help Governments Store and Sell Seized Cryptoassets",
             "url":"https://www.cryptoglobe.com/latest/2020/11/chainalysis-launches-program-to-help-governments-store-and-sell-seized-cryptoassets/",
             "source":"cryptoglobe",
             "body":"Blockchain analysis firm Chainalysis is launching a new program to help governments recover, store, and sell cryptoassets seized their operations, less than two weeks after the U.S. government seized over 69,000 BTC worth over $1 billion. According to announcement Chainalysis published, the program could help government agencies and insolvency practitioners “handle, store, realize, and monitor […]",
             "tags":"Altcoins|Business|Security",
             "categories":"BTC|Market|Blockchain|Altcoin|Business",
             "upvotes":"0",
             "downvotes":"0",
             "lang":"EN",
             "source_info":{
                "name":"CryptoGlobe",
                "lang":"EN",
                "img":"https://images.cryptocompare.com/news/default/cryptoglobe.png"
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
