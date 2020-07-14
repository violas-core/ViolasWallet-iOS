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
    /// 获取BTC余额记录
    case GetBTCBalance(String)
    /// 获取BTC交易记录
    case GetBTCTransactionHistory(String, Int, Int)
    /// 获取UTXO
    case GetBTCUnspentUTXO(String)
    /// 发送BTC交易
    case SendBTCTransaction(String)
    
    case TrezorBTCBalance(String)
    case TrezorBTCUnspentUTXO(String)
    case TrezorBTCTransactions(String, Int, Int)
    case TrezorBTCPushTransaction(String)
    
    /// 获取Libra账户余额
    case GetLibraAccountBalance(String)
    /// 获取Libra账户交易记录(地址、币名、请求类型（空：全部；0：转出；1：转入）、偏移量、数量)
    case GetLibraTransactions(String, String, String, Int, Int)
    /// 发送Libra交易
    case SendLibraTransaction(String)
    /// 获取Libra稳定币列表
    case GetLibraTokenList
    
    /// 获取Violas账户余额（钱包地址,代币地址（逗号分隔））
    case GetViolasAccountBalance(String, String)
    /// 获取Violas账户Sequence Number
    case GetViolasAccountSequenceNumber(String)
    /// 获取Violas账户交易记录（地址、币名、请求类型（空：全部；0：转出；1：转入）、偏移量、数量）
    case GetViolasTransactions(String, String, String, Int, Int)
    /// 发送Violas交易
    case SendViolasTransaction(String)
    /// 获取代币
    case GetViolasTokenList
    
    /// 查询映射信息
    case GetMappingInfo(String)
    /// 获取当前已开启映射币（钱包地址）
    case GetMappingTokenList(String)
    /// 获取映射交易记录（地址、偏移量、数量、类型（0：violas，1：Libra，2：BTC）
    case GetMappingTransactions(String, Int, Int, String)
    
    /// 扫码登录
    case SubmitScanLoginData(String, String)
    /// 获取Violas账户信息（临时）
    case GetViolasAccountInfo(String)
    /// 获取BTC价格
    case GetBTCPrice
    /// 获取Violas链资产价格（地址）
    case GetViolasPrice(String)
    /// 获取Libra链资产价格（地址）
    case GetLibraPrice(String)
    /// 激活Violas（临时）
    case ActiveViolasAccount(String)
    /// 激活Libra（临时）
    case ActiveLibraAccount(String)
    
    
    //交易所
    /// 获取兑换交易记录
    case ExchangeTransactions(String, Int, Int)
    /// 获取资金池交易记录
    case AssetsPoolTransactions(String, Int, Int)
    /// 获取交易支持稳定币
    case MarketSupportTokens
    /// 获取我的通证
    case MarketMineTokens(String)
}
extension mainRequest:TargetType {
    var baseURL: URL {
        switch self {
        case .GetBTCBalance(_),
             .GetBTCTransactionHistory(_, _, _),
             .GetBTCUnspentUTXO(_),
             .SendBTCTransaction(_):
            return URL(string:"https://tchain.api.btc.com/v3")!
        //https://tbtc1.trezor.io/api/
        case .TrezorBTCBalance(_),
             .TrezorBTCUnspentUTXO(_),
             .TrezorBTCTransactions(_, _, _),
             .TrezorBTCPushTransaction:
            return URL(string:"https://tbtc1.trezor.io/api")!
            
        case .GetLibraTransactions(_, _, _, _, _),
             .GetLibraTokenList,
             .GetBTCPrice,
             .GetViolasPrice(_),
             .GetLibraPrice(_),
             .ActiveLibraAccount(_),
             .ActiveViolasAccount(_):
            if PUBLISH_VERSION == true {
                return URL(string:"https://api.violas.io/1.0")!
            } else {
                return URL(string:"https://api4.violas.io/1.0")!
            }
        case .GetViolasAccountBalance(_, _),
             .GetViolasAccountSequenceNumber(_),
             .GetViolasTransactions(_, _, _, _, _),
             .GetViolasTokenList,
             .GetMappingInfo(_),
             .GetMappingTokenList(_),
             .GetMappingTransactions(_, _, _, _),
             .SubmitScanLoginData(_, _):
            if PUBLISH_VERSION == true {
                return URL(string:"https://api.violas.io/1.0")!
            } else {
                return URL(string:"https://api4.violas.io/1.0")!
            }
        // 交易所
        case .ExchangeTransactions(_, _, _),
             .AssetsPoolTransactions(_, _, _),
             .MarketSupportTokens,
             .MarketMineTokens(_):
            if PUBLISH_VERSION == true {
                return URL(string:"https://api.violas.io/1.0")!
            } else {
                return URL(string:"https://api4.violas.io/1.0")!
            }
        case .GetViolasAccountInfo(_),
             .SendViolasTransaction(_):
            //            // 对内
            //            return URL(string:"https://ab.testnet.violas.io")!
            //            // 对外
            ////            return URL(string:"https://ac.testnet.violas.io")!
            if PUBLISH_VERSION == true {
                //对外
                return URL(string:"https://ac.testnet.violas.io")!
            } else {
                //对内
                return URL(string:"https://ab.testnet.violas.io")!
            }
        case .GetLibraAccountBalance(_),
             .SendLibraTransaction(_):
            return URL(string:"https://client.testnet.libra.org")!
        }
    }
    var path: String {
        switch self {
        case .GetBTCBalance(let address):
            return "/address/\(address)"
        case .GetBTCTransactionHistory(let address, _, _):
            return "/address/\(address)/tx"
        case .GetBTCUnspentUTXO(let address):
            return "/address/\(address)/unspent"
        case .SendBTCTransaction(_):
            return "/tools/tx-publish"
            
        case .TrezorBTCBalance(let address):
            return "/v2/address/\(address)"
        case .TrezorBTCUnspentUTXO(let address):
            return "/v2/utxo/\(address)"
        case .TrezorBTCTransactions(let address, _, _):
            return "/v2/address/\(address)"
        case .TrezorBTCPushTransaction(let signature):
            return "/v2/sendtx/\(signature)"
        case .GetLibraAccountBalance(_):
            return ""
        case .GetLibraTransactions(_, _, _, _, _):
            return "/libra/transaction"
        case .SendLibraTransaction(_):
            return ""
        case .GetLibraTokenList:
            return "/libra/currency"
        case .GetViolasAccountBalance(_, _):
            return "/violas/balance"
        case .GetViolasAccountSequenceNumber(_):
            return "/violas/seqnum"
        case .GetViolasTransactions(_, _, _, _, _):
            return "/violas/transaction"
        case .SendViolasTransaction(_):
            return ""
        case .GetViolasTokenList:
            return "/violas/currency"
        case .GetMappingInfo(_):
            return "/crosschain/info"
        case .GetMappingTokenList(_):
            return "/crosschain/modules"
        case .GetMappingTransactions(_, _, _, _):
            return "/crosschain/transactions"
        case .SubmitScanLoginData(_, _):
            return "/violas/singin"
        case .GetViolasAccountInfo(_):
            return ""
        case .GetBTCPrice:
            return "/violas/value/btc"
        case .GetViolasPrice(_):
            return "/violas/value/violas"
        case .GetLibraPrice(_):
            return "/violas/value/libra"
        case .ActiveLibraAccount(_):
            return "/libra/mint"
        case .ActiveViolasAccount(_):
            return "/violas/mint"
        case .ExchangeTransactions(_, _, _):
            return "/market/exchange/transaction"
        case .AssetsPoolTransactions(_, _, _):
            return "/market/pool/transaction"
        case .MarketSupportTokens:
            return "/market/currency/violas"
        case .MarketMineTokens(_):
            return "/market/pool/info"
        }
    }
    var method: Moya.Method {
        switch self {
        case .SendLibraTransaction(_),
             .SendViolasTransaction(_),
             .SendBTCTransaction(_),
             .SubmitScanLoginData(_, _),
             .GetLibraAccountBalance(_),
             .GetViolasAccountInfo(_):
            return .post
        case .GetBTCBalance(_),
             .GetBTCTransactionHistory(_, _, _),
             .GetBTCUnspentUTXO(_),
             
             .TrezorBTCBalance(_),
             .TrezorBTCUnspentUTXO(_),
             .TrezorBTCTransactions(_, _, _),
             .TrezorBTCPushTransaction(_),
             
             .GetLibraTransactions(_, _, _, _, _),
             .GetViolasAccountBalance(_, _),
             .GetViolasAccountSequenceNumber(_),
             .GetViolasTransactions(_, _, _, _, _),
             .GetMappingInfo(_),
             .GetMappingTokenList(_),
             .GetMappingTransactions(_, _, _, _),
             .GetViolasTokenList,
             .GetLibraTokenList,
             .GetBTCPrice,
             .GetViolasPrice(_),
             .GetLibraPrice(_),
             .ActiveViolasAccount(_),
             .ActiveLibraAccount(_),
             .ExchangeTransactions(_, _, _),
             .AssetsPoolTransactions(_, _, _),
             .MarketSupportTokens,
             .MarketMineTokens(_):
            return .get
        }
    }
    public var validate: Bool {
        return false
    }
    var sampleData: Data {
        switch self {
        case .GetLibraTransactions(_, _, _, _, _):
            return "{\"code\":2000,\"message\":\"ok\",\"data\":[{\"version\":1,\"address\":\"f053480d94d09a00f77fec9975463bfd109ebeb0915d62822702f453cc87c809\",\"value\":100,\"sequence_number\":1,\"expiration_time\":1572771944},{\"version\":2,\"address\":\"address\",\"value\":100,\"sequence_number\":2,\"expiration_time\":1572771224}]}".data(using: String.Encoding.utf8)!
        default:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    var task: Task {
        switch self {
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
            
        case .TrezorBTCBalance(_):
            return .requestPlain
        case .TrezorBTCUnspentUTXO(_):
            return .requestPlain
        case .TrezorBTCTransactions(_, let page, let pageSize):
            return .requestParameters(parameters: ["page": page,
                                                   "pageSize": pageSize,
                                                   "details":"txs"],
                                      encoding: URLEncoding.queryString)
        case .TrezorBTCPushTransaction(_):
            return .requestPlain
            
        case .GetLibraAccountBalance(let address):
            return .requestParameters(parameters: ["jsonrpc":"2.0",
                                                   "method":"get_account_state",
                                                   "id":"123",
                                                   "params":["\(address)"]],
                                      encoding: JSONEncoding.default)
        case .GetLibraTransactions(let address, let currency, let type, let offset, let limit):
            return .requestParameters(parameters: ["addr": address,
                                                   "currency": currency,
                                                   "flows": type,
                                                   "limit": limit,
                                                   "offset":offset],
                                      encoding: URLEncoding.queryString)
        case .SendLibraTransaction(let signature):
            return .requestParameters(parameters: ["jsonrpc":"2.0",
                                                   "method":"submit",
                                                   "id":"123",
                                                   "params":["\(signature)"]],
                                      encoding: JSONEncoding.default)
        case .GetLibraTokenList:
            return .requestPlain
        case .GetViolasAccountBalance(let address, let modules):
            return .requestParameters(parameters: ["addr": address,
                                                   "modu": modules],
                                      encoding: URLEncoding.queryString)
        case .GetViolasAccountSequenceNumber(let address):
            return .requestParameters(parameters: ["addr": address],
                                      encoding: URLEncoding.queryString)
        case .GetViolasTransactions(let address, let currency, let type, let offset, let limit):
            //            if type.isEmpty == true {
            //                return .requestParameters(parameters: ["addr": address,
            //                                                       "currency": currency,
            //                                                       "limit": limit,
            //                                                       "offset":offset],
            //                                          encoding: URLEncoding.queryString)
            //            } else {
            return .requestParameters(parameters: ["addr": address,
                                                   "currency": currency,
                                                   "flows": type,
                                                   "limit": limit,
                                                   "offset":offset],
                                      encoding: URLEncoding.queryString)
        //            }
        case .SendViolasTransaction(let signature):
            return .requestParameters(parameters: ["jsonrpc":"2.0",
                                                   "method":"submit",
                                                   "id":"123",
                                                   "params":["\(signature)"]],
                                      encoding: JSONEncoding.default)
        case .GetViolasTokenList:
            return .requestPlain
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
        case .GetViolasAccountInfo(let address):
            return .requestParameters(parameters: ["jsonrpc":"2.0",
                                                   "method":"get_account_state",
                                                   "id":"123",
                                                   "params":["\(address)"]],
                                      encoding: JSONEncoding.default)
        case .GetBTCPrice:
            return .requestPlain
        case .GetViolasPrice(let address):
            return .requestParameters(parameters: ["address":address],
                                      encoding: URLEncoding.queryString)
        case .GetLibraPrice(let address):
            return .requestParameters(parameters: ["address":address],
                                      encoding: URLEncoding.queryString)
        case .ActiveLibraAccount(let authKey):
            let index = authKey.index(authKey.startIndex, offsetBy: 32)
            let address = authKey.suffix(from: index)
            let authPrefix = authKey.prefix(upTo: index)
            return .requestParameters(parameters: ["address": address,
                                                   "auth_key_perfix": authPrefix,
                                                   "currency":"LBR"],
                                      encoding: URLEncoding.queryString)
        case .ActiveViolasAccount(let authKey):
            let index = authKey.index(authKey.startIndex, offsetBy: 32)
            let address = authKey.suffix(from: index)
            let authPrefix = authKey.prefix(upTo: index)
            return .requestParameters(parameters: ["address": address,
                                                   "auth_key_perfix": authPrefix,
                                                   "currency":"LBR"],
                                      encoding: URLEncoding.queryString)
        case .ExchangeTransactions(let address, let offset, let limit):
            return .requestParameters(parameters: ["address": address,
                                                   "limit": limit,
                                                   "offset":offset],
                                      encoding: URLEncoding.queryString)
        case .AssetsPoolTransactions(let address, let offset, let limit):
            return .requestParameters(parameters: ["address": address,
                                                   "limit": limit,
                                                   "offset":offset],
                                      encoding: URLEncoding.queryString)
            
        case .MarketSupportTokens:
            return .requestPlain
        case .MarketMineTokens(let address):
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
