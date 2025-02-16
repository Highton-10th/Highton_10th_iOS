//
//  FundingInfoViewModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

class FundingInfoViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedChip: String = ""
    @Published var index = [
        "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/njz_thumbnail.png",
        "https://img1.newsis.com/2020/11/02/NISI20201102_0000628280_web.jpg",
        "https://i.namu.wiki/i/uTOUQlVJMoG0ZKOG41TzVZda6_nToQLTsuQg_03fCSiUmDGEOxltUMMuH-QVahgp-nfKFdyK86TtX_xED9gXd0EusPf00P4c5EDitI_O2Xc16HHksihiUTAlR14o8IDPQenRCrqZ9cQeN_2ZCqFJvUVbgVg-UMiUwAU0Ed2WGtE.webp"
    ]
    @Published var userInfo: GroupPurchaseInfoModel = GroupPurchaseInfoModel(
        header: GroupPurchaseHeaderModel(
            profileImage: "https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/342911573_1246401089572340_8548309984084430088_n.jpg?stp=dst-jpg_s150x150_tt6&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=108&_nc_oc=Q6cZ2AEnR3viFANEffRbuYKdTlMEjbS_Sl5ZcsEQRJSuWSBXMIVG6HB5QaVHsbt7qi7A24c&_nc_ohc=QpiCjMgQMw0Q7kNvgHUYEHL&_nc_gid=899a585ee6a24b77aeffda11e3aa6438&edm=APoiHPcBAAAA&ccb=7-5&oh=00_AYDBnwBm697kSj1Nrboi-_H50s7hq_7iLzNGs_bkOFerMA&oe=67B6D7A3&_nc_sid=22de04",
            nickname: "holideez"
        ),
        foot: GroupPurchaseFootModel(
            title: "SONGS TO BRING YOU HOME 추가 공연 펀딩",
            description: "2025년 검정치마 단독 공연의 5월 추가 공연을 위한 펀딩입니다.",
            percent: 55,
            startDate: "39,700,000원",
            endDate: "72,500,000원"
        ),
        participationPeople: 1725,
        relate: GroupPurchaseRelateModel(
            profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIrlxGUMVNqTFn1vNcKKxEzCbT9zFlz32Pfg&s",
            nickname: "holideez"
        ),
        items: [] // JSON에 items 정보가 없어서 빈 배열로 둡니다.
    )
    
    @Published var info: [GroupPurchasePriceModel] = [
        GroupPurchasePriceModel(profileImage: "https://news.nateimg.co.kr/orgImg/nn/2022/08/02/202208021812149410_1.jpg", nickname: "'How Sweet' 하니 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyg7uLUGvTKc4gMxuZLe3_1ypd6w5pYnUYFQ&s", nickname: "'How Sweet' 민지 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://image.xportsnews.com/contents/images/upload/article/2022/0812/mb_1660263097608033.jpg", nickname: "'How Sweet' 다니엘 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3VeMqNRf7z8XFvWeH5C1A5G5A20IzvHn37g&s", nickname: "'How Sweet' 해린 에디션", price: "16,200원", check: false),
        GroupPurchasePriceModel(profileImage: "https://image.xportsnews.com/contents/images/upload/article/2023/1115/mb_1700038184683700.jpg", nickname: "'How Sweet' 혜인 에디션", price: "16,200원", check: false)
    ]
    
    @Published var imageUrl = "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/njz_thumbnail.png"
    @Published var fundingInfo: [GroupPurchaseInfoModel] = [
        GroupPurchaseInfoModel(
            header: GroupPurchaseHeaderModel(
                profileImage: "https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/342911573_1246401089572340_8548309984084430088_n.jpg?stp=dst-jpg_s150x150_tt6&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=108&_nc_oc=Q6cZ2AEnR3viFANEffRbuYKdTlMEjbS_Sl5ZcsEQRJSuWSBXMIVG6HB5QaVHsbt7qi7A24c&_nc_ohc=QpiCjMgQMw0Q7kNvgHUYEHL&_nc_gid=899a585ee6a24b77aeffda11e3aa6438&edm=APoiHPcBAAAA&ccb=7-5&oh=00_AYDBnwBm697kSj1Nrboi-_H50s7hq_7iLzNGs_bkOFerMA&oe=67B6D7A3&_nc_sid=22de04",
                nickname: "holideez"
            ),
            foot: GroupPurchaseFootModel(
                title: "SONGS TO BRING YOU HOME 추가 공연 펀딩",
                description: "2025년 검정치마 단독 공연의 5월 추가 공연을 위한 펀딩입니다.",
                percent: 55,
                startDate: "39,700,000원",
                endDate: "72,500,000원"
            ),
            participationPeople: 1725,
            relate: GroupPurchaseRelateModel(
                profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIrlxGUMVNqTFn1vNcKKxEzCbT9zFlz32Pfg&s",
                nickname: "holideez"
            ),
            items: [] // JSON에 items 정보가 없어서 빈 배열로 둡니다.
        ),
        GroupPurchaseInfoModel(
            header: GroupPurchaseHeaderModel(
                profileImage: "https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-19/342911573_1246401089572340_8548309984084430088_n.jpg?stp=dst-jpg_s150x150_tt6&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=108&_nc_oc=Q6cZ2AEnR3viFANEffRbuYKdTlMEjbS_Sl5ZcsEQRJSuWSBXMIVG6HB5QaVHsbt7qi7A24c&_nc_ohc=QpiCjMgQMw0Q7kNvgHUYEHL&_nc_gid=899a585ee6a24b77aeffda11e3aa6438&edm=APoiHPcBAAAA&ccb=7-5&oh=00_AYDBnwBm697kSj1Nrboi-_H50s7hq_7iLzNGs_bkOFerMA&oe=67B6D7A3&_nc_sid=22de04",
                nickname: "검정치마"
            ),
            foot: GroupPurchaseFootModel(
                title: "SONGS TO BRING YOU HOME 공연 펀딩",
                description: "2025년 검정치마 단독 공연의 5월 공연을 위한 펀딩입니다.",
                percent: 90,
                startDate: "68,500,000원",
                endDate: "72,500,000원"
            ),
            participationPeople: 2157,
            relate: GroupPurchaseRelateModel(
                profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIrlxGUMVNqTFn1vNcKKxEzCbT9zFlz32Pfg&s",
                nickname: "검정치마"
            ),
            items: [] // JSON에 items 정보가 없어서 빈 배열로 둡니다.
        ),
        GroupPurchaseInfoModel(
            header: GroupPurchaseHeaderModel(
                profileImage: "https://i.namu.wiki/i/N0GR43Z989bhaVfHiOPYuRKXRj7kmOM9ICQLyDqrXqDikaZMvF3WRS1NhXa1l_Lsf7hWyNKWNJFoIfc1fkEbEw.webp",
                nickname: "태연"
            ),
            foot: GroupPurchaseFootModel(
                title: "TAEYEON CONCERT - The TENSE",
                description: "서울 공연을 시작으로 아시아 투어를 하기 위한 펀딩입니다",
                percent: 42,
                startDate: "35,200,000원",
                endDate: "80,120,000원"
            ),
            participationPeople: 1241,
            relate: GroupPurchaseRelateModel(
                profileImage: "https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2025/01/15/b0cd9498-4cca-43ee-b26d-38fd2ee9e066.jpg",
                nickname: "태연"
            ),
            items: [] // JSON에 items 정보가 없어서 빈 배열로 둡니다.
        )
    ]
}
