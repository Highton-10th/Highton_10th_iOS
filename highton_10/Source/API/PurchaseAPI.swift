//
//  PurchaseAPI.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import Foundation
import Moya

public enum PurchaseAPI {
    case getPurchaseList(search: String)
    case purchaseRegister(param: PurchaseRegisterRequest)
    case purchaseView(id: String)
}

extension PurchaseAPI: TargetType {
    public var baseURL: URL {
        return URL(string: api)!
    }

    public var path: String {
        switch self {
        case .getPurchaseList:
            return "/purchase/list"
        case .purchaseRegister:
            return "/purchase/register"
        case .purchaseView(let id):
            return "/purchase/view/\(id)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .purchaseRegister:
            return .post
        case .getPurchaseList, .purchaseView:
            return .get
        }
    }

    public var sampleData: Data {
        return "{}".data(using: .utf8)!
    }

    public var task: Task {
        switch self {
        case .purchaseRegister(let param):
            return .requestJSONEncodable(param)
        case .getPurchaseList(let search):
            return .requestParameters(parameters: ["title": search, "user": search, "artist": search], encoding: URLEncoding.queryString)
        case .purchaseView(let id):
               return .requestParameters(parameters: ["id": id], encoding: URLEncoding.queryString)
        }
    }

    public var headers: [String: String]? {
        [
            "Content-Type": "application/json"
        ]
    }
}
