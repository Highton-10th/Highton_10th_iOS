//
//  PurchaseListResponse.swift
//  highton_10
//
//  Created by 서지완 on 2/16/25.
//

import Foundation

public struct PurchaseListResponse: Codable {
    public let id: Int
    public let title: String
    public let description: String
    public let currentAmount: Int
    public let thumbnail: String
    public let dueDate: String
    public let startDate: String
    public let requestUserId: Int
    public let artistId: Int
    public let artist: Artist
    public let percent: Int
}

public struct Artist: Codable {
    public let id: Int
    public let name: String
}
