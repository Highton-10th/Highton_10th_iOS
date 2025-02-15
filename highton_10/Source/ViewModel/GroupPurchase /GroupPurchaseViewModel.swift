//
//  GroupPurchaseViewModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

class GroupPurchaseViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var groupPurchaseList: [String] = ["뉴진스", "최시훈"]
    @Published var selectedChip: String = ""
    @Published var imageUrl: String = "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/1739635965649_Thumbnail(1).png"
    
    
}
