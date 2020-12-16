//
//  ActiveModuleNetworkManager.swift
//  LibraWallet
//
//  Created by wangyingdong on 2020/11/24.
//  Copyright © 2020 palliums. All rights reserved.
//

import UIKit
import Moya
import Localize_Swift

let ActiveModuleProvide = MoyaProvider<ActiveModuleRequest>()
//let mainProvide = MoyaProvider<mainRequest>(stubClosure: MoyaProvider.immediatelyStub)
enum ActiveModuleRequest {
    /// 获取Libra账户信息（钱包地址，手机号区域，手机号）
    case secureCode(String, String, String)
    /// 获取Libra账户信息（钱包地址，手机号区域，手机号，验证码，邀请地址）
    case verifyMobilePhone(String, String, String, String, String)
    /// 是否是新账户（钱包地址）
    case isNewWallet(String)
}
extension ActiveModuleRequest: TargetType {
    var baseURL: URL {
        switch self {
        case .secureCode(_, _, _),
             .verifyMobilePhone(_, _, _, _, _),
             .isNewWallet(_):
            if PUBLISH_VERSION == true {
                return URL(string:"https://api.violas.io")!
            } else {
                return URL(string:"https://api4.violas.io")!
            }
        }
    }
    var path: String {
        switch self {
        case .secureCode(_, _, _):
            return "/1.0/violas/verify_code"
        case .verifyMobilePhone(_, _, _, _, _):
            return "/violas/1.0/incentive/mobile/verify"
        case .isNewWallet(_):
            return "/violas/1.0/incentive/check/verified"
        }
    }
    var method: Moya.Method {
        switch self {
        case .secureCode(_, _, _),
             .verifyMobilePhone(_, _, _, _, _):
            return .post
        case .isNewWallet(_):
            return .get
        }
    }
    public var validate: Bool {
        return false
    }
    var sampleData: Data {
        switch self {
        default:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    var task: Task {
        switch self {
        case .secureCode(let address, let phoneArea, let phoneNumber):
            return .requestParameters(parameters: ["address": address,
                                                   "phone_local_number": phoneArea,
                                                   "receiver": phoneNumber],
                                      encoding: JSONEncoding.default)
        case .verifyMobilePhone(let address, let phoneArea, let phoneNumber, let secureCode, let invitedAddress):
            return .requestParameters(parameters: ["wallet_address": address,
                                                   "local_number": phoneArea,
                                                   "mobile_number": phoneNumber,
                                                   "verify_code":secureCode,
                                                   "inviter_address":invitedAddress],
                                      encoding: JSONEncoding.default)
        case .isNewWallet(let address):
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
