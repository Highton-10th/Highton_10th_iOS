//
//  GroupPurchaseInfoViewModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

class GroupPurchaseInfoViewModel: ObservableObject {
    @Published var userInfo: GroupPurchaseInfoModel = GroupPurchaseInfoModel(
            header: GroupPurchaseHeaderModel(
                profileImage: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/XoC/image/w0gDroK5Q9vJacqEG4ZUm-N0nrk.jpg",
                nickname: "이수성"
            ),
            foot: GroupPurchaseFootModel(
                title: "뉴진스 [How Sweet] 미니 앨범 공동 구매",
                description: "",
                percent: 54,
                startDate: "1월 17일 시작",
                endDate: "2월 27일까지"
            ),
            participationPeople: 25,
            relate: GroupPurchaseRelateModel(
                profileImage: "https://image.blip.kr/v1/file/cd473853f6c3158ed224566211257c7b",
                nickname: "뉴진스 (NJZ)"
            ),
            items: [
                GroupPurchaseItems(imageURL: "https://news.nateimg.co.kr/orgImg/nn/2022/08/02/202208021812149410_1.jpg", nickname: "'How Sweet' Standard 버전 (하니 에디션)"),
                GroupPurchaseItems(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyg7uLUGvTKc4gMxuZLe3_1ypd6w5pYnUYFQ&s", nickname: "'How Sweet' Standard 버전 (민지 에디션)"),
                GroupPurchaseItems(imageURL: "https://image.xportsnews.com/contents/images/upload/article/2022/0812/mb_1660263097608033.jpg", nickname: "'How Sweet' Standard 버전 (다니엘 에디션)"),
                GroupPurchaseItems(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3VeMqNRf7z8XFvWeH5C1A5G5A20IzvHn37g&s", nickname: "'How Sweet' Standard 버전 (해린 에디션)"),
                GroupPurchaseItems(imageURL: "https://image.xportsnews.com/contents/images/upload/article/2023/1115/mb_1700038184683700.jpg", nickname: "'How Sweet' Standard 버전 (혜인 에디션)")
            ]
        )
    
    @Published var info: [GroupPurchasePriceModel] = [
        GroupPurchasePriceModel(profileImage: "https://news.nateimg.co.kr/orgImg/nn/2022/08/02/202208021812149410_1.jpg", nickname: "'How Sweet' 하니 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyg7uLUGvTKc4gMxuZLe3_1ypd6w5pYnUYFQ&s", nickname: "'How Sweet' 민지 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://image.xportsnews.com/contents/images/upload/article/2022/0812/mb_1660263097608033.jpg", nickname: "'How Sweet' 다니엘 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3VeMqNRf7z8XFvWeH5C1A5G5A20IzvHn37g&s", nickname: "'How Sweet' 해린 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://image.xportsnews.com/contents/images/upload/article/2023/1115/mb_1700038184683700.jpg", nickname: "'How Sweet' 혜인 에디션", price: "16,200원", check: false)
    ]
    
    @Published var imageUrl = "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/njz_thumbnail.png"
}

struct GroupPurchasePriceModel {
    let profileImage: String
    let nickname: String
    let price: String
    var check: Bool
}
