//
//  PurchaseViewResponse.swift
//  highton_10
//
//  Created by 서지완 on 2/16/25.
//

import Foundation

public struct PurchaseViewResponse: Codable {
    public let id: Int
    public let title: String
    public let currentAmount: Int
    public let thumbnail: String
    public let dueDate: String
    public let startDate: String
    public let requestUserId: Int
    public let artistId: Int
    public let artist: ArtistView
    public let items: [Item]
    public let participants: [String]
    public let requestUser: RequestUser
    public let percent: Int
}

public struct ArtistView: Codable {
    public let id: Int
    public let name: String
}

public struct Item: Codable {
    public let id: Int
    public let name: String
    public let amount: Int
    public let image: String
}

public struct RequestUser: Codable {
    public let id: Int
    public let phone: String
    public let name: String
    public let createdAt: String
    public let updatedAt: String
    public let profile: String?
}
