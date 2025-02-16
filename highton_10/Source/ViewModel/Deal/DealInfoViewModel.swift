//
//  DealInfoViewModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

class DealInfoViewModel: ObservableObject {
    @Published var imageUrl = "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/1739635965649_Thumbnail(1).png"
    @Published var dealInfo: DealListRow = DealListRow(
        title: "시이나 링고 무죄 모라토리엄 팔아요",
        price: "277,000원",
        location: "경기도 화성시 ⋅ 1일 전",
        artist: "시이나 링고",
        imageURL: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/53H5/image/-77PFqPUIpC6kVzVNzAHnJWhD4M.png"
    )
    @Published var userInfo: DealInfoModel = DealInfoModel(
        header:
            DealInfoHeaderModel(
                profileImage: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/1739635965649_Thumbnail(1).png",
                nickname: "닉네임"
            ),
        foot: DealInfoFootModel(
            title: "제목",
            description: "내용",
            percent: 50,
            startDate: "1월 17일 시작",
            endDate: "2월 27일까지"
        ),
        participationPeople: 25,
        relate:
            DealInfoRelateModel(
                profileImage: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/1739635965649_Thumbnail(1).png",
                nickname: "nickname"
            )
        ,
        items: [
            DealInfoItems(
                imageURL: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/1739635965649_Thumbnail(1).png",
                nickname: "nickname"
            )
        ]
    )
    
    @Published var chat: [String] = []
}
