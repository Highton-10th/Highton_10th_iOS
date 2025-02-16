//
//  GroupPurchaseInfoModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import Foundation

struct GroupPurchaseInfoModel: Hashable {
    let header: GroupPurchaseHeaderModel
    let foot: GroupPurchaseFootModel
    let participationPeople: Int
    let relate: GroupPurchaseRelateModel
    let items: [GroupPurchaseItems]
}

struct GroupPurchaseHeaderModel: Hashable { // 인증된 유저
    let profileImage: String
    let nickname: String
}

struct GroupPurchaseFootModel: Hashable {
    let title: String
    let description: String
    let percent: Int
    let startDate: String
    let endDate: String
}

struct GroupPurchaseRelateModel: Hashable { // 관련 아티스트
    let profileImage: String
    let nickname: String
}

struct GroupPurchaseItems: Hashable { // 공동 구매 물품
    let imageURL: String
    let nickname: String
}
