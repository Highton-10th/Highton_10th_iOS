//
//  PurchaseRegisterRequest.swift
//  highton_10
//
//  Created by 서지완 on 2/15/25.
//

import Foundation

public struct PurchaseRegisterRequest: Codable {
    var artistId: Int
    var title: String
    var description: String
    var thumbnail: String
    var dueDate: String
    var itemList: [String]

    public init(artistId: Int, title: String, description: String, thumbnail: String, dueDate: String, itemList: [String]) {
        self.artistId = artistId
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.dueDate = dueDate
        self.itemList = itemList
    }
}
