//
//  NetworkManager.swift
//  LibraWallet
//
//  Created by palliums on 2019/9/17.
//  Copyright © 2019 palliums. All rights reserved.
//

import UIKit
import Moya
import Localize_Swift
let mainProvide = MoyaProvider<mainRequest>()
//let mainProvide = MoyaProvider<mainRequest>(stubClosure: MoyaProvider.immediatelyStub)
enum mainRequest {
    /// 获取Libra交易记录
    case GetTransactionHistory(String, Int64)
    /// 获取BTC余额记录
    case GetBTCBalance(String)
    /// 获取BTC交易记录
    case GetBTCTransactionHistory(String, Int, Int)
    /// 获取UTXO
    case GetBTCUnspentUTXO(String)
    /// 发送BTC交易
    case SendBTCTransaction(String)
    
    case BlockCypherBTCBalance(String)
    case BlockCypherBTCUnspentUTXO(String)
    case BlockCypherBTCPushTransaction(String)
    
    /// 获取Libra账户余额
    case GetLibraAccountBalance(String)
    /// 获取Libra账户Sequence Number
    case GetLibraAccountSequenceNumber(String)
    /// 获取Libra账户交易记录(地址、偏移量、数量)
    case GetLibraAccountTransactionList(String, Int, Int)
    /// 发送Libra交易
    case SendLibraTransaction(String)
    /// 获取Violas账户余额（钱包地址,代币地址（逗号分隔））
    case GetViolasAccountBalance(String, String)
    /// 获取Violas账户Sequence Number
    case GetViolasAccountSequenceNumber(String)
    /// 获取Violas账户交易记录（地址、偏移量、数量, 合约地址）
    case GetViolasAccountTransactionList(String, Int, Int, String)
    /// 发送Violas交易
    case SendViolasTransaction(String)
    /// 获取代币
    case GetViolasTokenList
    
    /// 获取钱包已开启代币列表
    case GetViolasAccountEnableToken(String)
    /// 获取交易所支持的代币列表
    case GetMarketSupportCoin
    /// 获取当前委托（地址、付出稳定币合约、兑换稳定币合约）
    case GetCurrentOrder(String, String, String)
    /// 获取当前进行中全部委托（地址、Version）
    case GetAllProcessingOrder(String, String)
    /// 获取订单详情(地址、页数)
    case GetOrderDetail(String, Int)
    /// 获取已完成订单
    case GetAllDoneOrder(String, String)
    /// 取消订单（交易字节码，Version）
    case CancelOrder(String, String)
    
    /// 查询映射信息
    case GetMappingInfo(String)
    /// 获取当前已开启映射币（钱包地址）
    case GetMappingTokenList(String)
    /// 获取映射交易记录（地址、偏移量、数量、类型（0：violas，1：Libra，2：BTC）
    case GetMappingTransactions(String, Int, Int, String)
    
    /// 扫码登录
    case SubmitScanLoginData(String, String)
    /// 激活Violas（临时）
    case ActiveViolasAccount(String)
    /// 激活Libra（临时）
    case ActiveLibraAccount(String)
    /// 获取Violas账户信息（临时）
    case GetViolasAccountInfo(String)
}
extension mainRequest:TargetType {
    var baseURL: URL {
        switch self {
        case .GetTransactionHistory(_, _):
            return URL(string:"https://libraservice2.kulap.io")!
        case .GetBTCBalance(_),
             .GetBTCTransactionHistory(_, _, _),
             .GetBTCUnspentUTXO(_),
             .SendBTCTransaction(_):
            return URL(string:"https://tchain.api.btc.com/v3")!
            //https://tbtc1.trezor.io/api/
        case .BlockCypherBTCBalance(_),
             .BlockCypherBTCUnspentUTXO,
             .BlockCypherBTCPushTransaction:
            return URL(string:"https://api.blockcypher.com/v1/btc/test3")!
            
            
        case .GetLibraAccountSequenceNumber(_),
             .GetLibraAccountTransactionList(_, _, _),
             .ActiveLibraAccount(_),
             .ActiveViolasAccount(_),
             .GetViolasAccountInfo(_):
            #if PUBLISH_VERSION
                return URL(string:"https://api.violas.io/1.0")!
            #else
                return URL(string:"http://52.27.228.84:4000/1.0")!
//                return URL(string:"https://api.violas.io/1.0")!
            #endif
        case .GetViolasAccountBalance(_, _),
             .GetViolasAccountSequenceNumber(_),
             .GetViolasAccountTransactionList(_, _, _, _),
             .SendViolasTransaction(_),
             .GetViolasTokenList,
             .GetViolasAccountEnableToken(_),
             .GetMappingInfo(_),
             .GetMappingTokenList(_),
             .GetMappingTransactions(_, _, _, _),
             .SubmitScanLoginData(_, _):
            #if PUBLISH_VERSION
                return URL(string:"https://api.violas.io/1.0")!
            #else
                return URL(string:"http://52.27.228.84:4000/1.0")!
//                return URL(string:"https://api.violas.io/1.0")!
            #endif
        case .GetMarketSupportCoin,
             .GetCurrentOrder(_, _, _),
             .GetAllProcessingOrder(_, _),
             .GetOrderDetail(_, _),
             .GetAllDoneOrder(_, _),
             .CancelOrder(_, _):
            #if PUBLISH_VERSION
                return URL(string:"https://dex.violas.io/v1")!
            #else
                return URL(string:"http://18.220.66.235:38181/v1")!
//                return URL(string:"https://dex.violas.io/v1")!
            #endif
        case .GetLibraAccountBalance(_),
             .SendLibraTransaction(_):
            return URL(string:"https://client.testnet.libra.org")!
        }
    }
    var path: String {
        switch self {
        case .GetTransactionHistory(_, _):
            return "/transactionHistory"
        case .GetBTCBalance(let address):
            return "/address/\(address)"
        case .GetBTCTransactionHistory(let address, _, _):
            return "/address/\(address)/tx"
        case .GetBTCUnspentUTXO(let address):
            return "/address/\(address)/unspent"
        case .SendBTCTransaction(_):
            return "/tools/tx-publish"
            
        case .BlockCypherBTCBalance(let address):
            return "/addrs/\(address)/balance"
        case .BlockCypherBTCUnspentUTXO(let address):
            return "/addrs/\(address)"
        case .BlockCypherBTCPushTransaction(_):
            return "/txs/push"
            
        case .GetLibraAccountBalance(_):
            return ""
        case .GetLibraAccountSequenceNumber(_):
            return "/libra/seqnum"
        case .GetLibraAccountTransactionList(_, _, _):
            return "/libra/transaction"
        case .SendLibraTransaction(_):
            return ""
        case .GetViolasAccountBalance(_, _):
            return "/violas/balance"
        case .GetViolasAccountSequenceNumber(_):
            return "/violas/seqnum"
        case .GetViolasAccountTransactionList(_, _, _, _):
            return "/violas/transaction"
        case .SendViolasTransaction(_):
            return "/violas/transaction"
        case .GetViolasTokenList:
            return "/violas/currency"
        case .GetMarketSupportCoin:
            return "/tokens"
        case .GetViolasAccountEnableToken(_):
            return "/violas/module"
        case .GetCurrentOrder(_, _, _):
            return "/orderbook"
        case .GetAllProcessingOrder(_, _):
            return "/orders"
        case .GetOrderDetail(_, _):
            return "/trades"
        case .GetAllDoneOrder(_, _):
            return "/orders"
        case .CancelOrder(_, _):
            return "/cancelOrder"
        case .GetMappingInfo(_):
            return "/crosschain/info"
        case .GetMappingTokenList(_):
            return "/crosschain/modules"
        case .GetMappingTransactions(_, _, _, _):
            return "/crosschain/transactions"
        case .SubmitScanLoginData(_, _):
            return "/violas/singin"
        case .ActiveLibraAccount(_):
            return "/libra/mint"
        case .ActiveViolasAccount(_):
            return "/violas/mint"
        case .GetViolasAccountInfo(_):
            return "/violas/account/info"
        }
    }
    var method: Moya.Method {
        switch self {
        case .GetTransactionHistory(_, _),
             .SendLibraTransaction(_),
             .SendViolasTransaction(_),
             .SendBTCTransaction(_),
             .BlockCypherBTCPushTransaction(_),
             .SubmitScanLoginData(_, _),
             .GetLibraAccountBalance(_),
             .CancelOrder(_, _):
            return .post
        case .GetBTCBalance(_),
             .GetBTCTransactionHistory(_, _, _),
             .GetBTCUnspentUTXO(_),
             
             .BlockCypherBTCBalance(_),
             .BlockCypherBTCUnspentUTXO(_),
             
             
             .GetLibraAccountSequenceNumber(_),
             .GetLibraAccountTransactionList(_, _, _),
             .GetViolasAccountBalance(_, _),
             .GetViolasAccountSequenceNumber(_),
             .GetViolasAccountTransactionList(_, _, _, _),
             .GetViolasTokenList,
             .GetMarketSupportCoin,
             .GetViolasAccountEnableToken(_),
             .GetCurrentOrder(_, _, _),
             .GetAllProcessingOrder(_, _),
             .GetOrderDetail(_, _),
             .GetAllDoneOrder(_, _),
             .GetMappingInfo(_),
             .GetMappingTokenList(_),
             .GetMappingTransactions(_, _, _, _),
             .ActiveViolasAccount(_),
             .ActiveLibraAccount(_),
             .GetViolasAccountInfo(_):
            return .get
        }
    }
    public var validate: Bool {
        return false
    }
    var sampleData: Data {
        switch self {
        case .GetLibraAccountTransactionList(_, _, _):
            return "{\"code\":2000,\"message\":\"ok\",\"data\":[{\"version\":1,\"address\":\"f053480d94d09a00f77fec9975463bfd109ebeb0915d62822702f453cc87c809\",\"value\":100,\"sequence_number\":1,\"expiration_time\":1572771944},{\"version\":2,\"address\":\"address\",\"value\":100,\"sequence_number\":2,\"expiration_time\":1572771224}]}".data(using: String.Encoding.utf8)!
        default:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    var task: Task {
        switch self {
        case .GetTransactionHistory(let address, _):
            return .requestParameters(parameters: ["address": address],
                                      encoding: JSONEncoding.default)
        case .GetBTCBalance(_):
            return .requestPlain
        case .GetBTCTransactionHistory(_, let page, let pageSize):
            return .requestParameters(parameters: ["page": page,
                                                   "pagesize":pageSize],
                                      encoding: URLEncoding.queryString)
        case .GetBTCUnspentUTXO(_):
            return .requestPlain
        case .SendBTCTransaction(let signature):
            return .requestParameters(parameters: ["rawhex": signature],
                                      encoding: JSONEncoding.default)
            
        case .BlockCypherBTCBalance(_):
            return .requestPlain
        case .BlockCypherBTCUnspentUTXO(_):
            return .requestParameters(parameters: ["unspentOnly": true,
                                                   "includeScript":true],
                                      encoding: URLEncoding.queryString)
        case .BlockCypherBTCPushTransaction(let signature):
            return .requestParameters(parameters: ["token": "64ff3535053045689add0ee65359c6a9",
                                                   "tx": signature],
                                      encoding: JSONEncoding.default)
            
        case .GetLibraAccountBalance(let address):
            return .requestParameters(parameters: ["jsonrpc":"2.0",
                                                   "method":"get_account_state",
                                                   "id":"123",
                                                   "params":["\(address)"]],
                                      encoding: JSONEncoding.default)
        case .GetLibraAccountSequenceNumber(let address):
            return .requestParameters(parameters: ["addr": address],
                                      encoding: URLEncoding.queryString)
        case .GetLibraAccountTransactionList(let address, let offset, let limit):
            return .requestParameters(parameters: ["addr": address,
                                                   "limit": limit,
                                                   "offset":offset],
                                      encoding: URLEncoding.queryString)
        case .SendLibraTransaction(let signature):
            return .requestParameters(parameters: ["jsonrpc":"2.0",
                                                   "method":"submit",
                                                   "id":"123",
                                                   "params":["\(signature)"]],
                                      encoding: JSONEncoding.default)
        case .GetViolasAccountBalance(let address, let modules):
            return .requestParameters(parameters: ["addr": address,
                                                   "modu": modules],
                                      encoding: URLEncoding.queryString)
        case .GetViolasAccountSequenceNumber(let address):
            return .requestParameters(parameters: ["addr": address],
                                      encoding: URLEncoding.queryString)
        case .GetViolasAccountTransactionList(let address, let offset, let limit, let contract):
            if contract.isEmpty == true {
                return .requestParameters(parameters: ["addr": address,
                                                       "limit": limit,
                                                       "offset":offset],
                                          encoding: URLEncoding.queryString)
            } else {
                return .requestParameters(parameters: ["addr": address,
                                                       "limit": limit,
                                                       "offset":offset,
                                                       "modu":contract],
                                          encoding: URLEncoding.queryString)
            }
        case .SendViolasTransaction(let signature):
            return .requestParameters(parameters: ["signedtxn": signature],
                                      encoding: JSONEncoding.default)
        case .GetViolasTokenList:
            return .requestPlain
        case .GetMarketSupportCoin:
            return .requestPlain
        case .GetViolasAccountEnableToken(let address):
            return .requestParameters(parameters: ["addr": address],
                                      encoding: URLEncoding.queryString)
        case .GetCurrentOrder(_, let baseAddress, let changeAddress):
            return .requestParameters(parameters: ["base": baseAddress,
                                                   "quote":changeAddress],
                                      encoding: URLEncoding.queryString)
        case .GetAllProcessingOrder(let address, let version):
            if version.isEmpty == true {
                return .requestParameters(parameters: ["user": address,
                                                       "state":0,
                                                       "limit":10],
                                          encoding: URLEncoding.queryString)
            } else {
                return .requestParameters(parameters: ["user": address,
                                                       "state":0,
                                                       "limit":10,
                                                       "version":version],
                                          encoding: URLEncoding.queryString)
            }
        case .GetOrderDetail(let version, let page):
            return .requestParameters(parameters: ["version":version,
                                                   "pagesize":10,
                                                   "pagenum":page],
                                      encoding: URLEncoding.queryString)
        case .GetAllDoneOrder(let address, let version):
            if version.isEmpty == true {
                return .requestParameters(parameters: ["user": address,
                                                       "state":4,
                                                       "limit":10],
                                          encoding: URLEncoding.queryString)
            } else {
                return .requestParameters(parameters: ["user": address,
                                                       "state": 4,
                                                       "limit": 10,
                                                       "version":version],
                                          encoding: URLEncoding.queryString)
            }
        case .CancelOrder(let signature, let version):
            return .requestParameters(parameters: ["version": version,
                                                   "signedtxn":signature],
                                      encoding: JSONEncoding.default)
        case .GetMappingInfo(let type):
            return .requestParameters(parameters: ["type":type.lowercased()],
                                      encoding: URLEncoding.queryString)
        case .GetMappingTokenList(let walletAddress):
            return .requestParameters(parameters: ["address": walletAddress],
                                      encoding: URLEncoding.queryString)
        case .GetMappingTransactions(let walletAddress, let offset, let limit, let type):
            return .requestParameters(parameters: ["address": walletAddress,
                                                   "limit": limit,
                                                   "offset":offset,
                                                   "type":type],
                                      encoding: URLEncoding.queryString)
        case .SubmitScanLoginData(let walletAddress, let sessionID):
            return .requestParameters(parameters: ["wallets": walletAddress,
                                                   "session_id": sessionID,
                                                   "type":2],
                                      encoding: JSONEncoding.default)
        case .ActiveLibraAccount(let authKey):
            let index = authKey.index(authKey.startIndex, offsetBy: 32)
            let address = authKey.suffix(from: index)
            let authPrefix = authKey.prefix(upTo: index)
            return .requestParameters(parameters: ["address": address,
                                                   "auth_key_perfix": authPrefix],
                                      encoding: URLEncoding.queryString)
        case .ActiveViolasAccount(let authKey):
            let index = authKey.index(authKey.startIndex, offsetBy: 32)
            let address = authKey.suffix(from: index)
            let authPrefix = authKey.prefix(upTo: index)
            return .requestParameters(parameters: ["address": address,
                                                   "auth_key_perfix": authPrefix],
                                      encoding: URLEncoding.queryString)
        case .GetViolasAccountInfo(let address):
            return .requestParameters(parameters: ["address": address],
                                      encoding: URLEncoding.queryString)
        }
    }
    var headers: [String : String]? {
        return ["Content-Type":"application/json",
                "app_version": appversion,
                "platform": "ios",
                "app_bundle_id":bundleID!,
                "language":Localize.currentLanguage()]
    }
}
