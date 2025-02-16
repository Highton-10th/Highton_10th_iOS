//
//  DealInfoModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import Foundation

struct DealInfoModel: Hashable {
    let header: DealInfoHeaderModel
    let foot: DealInfoFootModel
    let participationPeople: Int
    let relate: DealInfoRelateModel
    let items: [DealInfoItems]
}

struct DealInfoHeaderModel: Hashable { // 인증된 유저
    let profileImage: String
    let nickname: String
}

struct DealInfoFootModel: Hashable {
    let title: String
    let description: String
    let percent: Int
    let startDate: String
    let endDate: String
}

struct DealInfoRelateModel: Hashable { // 관련 아티스트
    let profileImage: String
    let nickname: String
}

struct DealInfoItems: Hashable { // 공동 구매 물품
    let imageURL: String
    let nickname: String
}
