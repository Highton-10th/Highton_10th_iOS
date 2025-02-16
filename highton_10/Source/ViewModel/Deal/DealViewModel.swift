//
//  DealViewModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

class DealViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedChip: String = ""
    @Published var chipArray = ["전체", "뉴진스", "혁오", "The 1975", "검정치마", "시이나 링고", "데이식스", "창모", "릴러말즈"]
    @Published var dealInfo: DealListRow = DealListRow(
        title: "시이나 링고 무죄 모라토리엄 팔아요",
        price: "277,000원",
        location: "경기도 화성시 ⋅ 1일 전",
        artist: "시이나 링고",
        imageURL: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/53H5/image/-77PFqPUIpC6kVzVNzAHnJWhD4M.png"
    )

    @Published var dealList: [DealListRow] = [
        DealListRow(
            title: "아이브 앨범 + 포토북 팔아요",
            price: "71,600원",
            location: "광주광역시 ⋅ 오늘",
            artist: "아이브",
            imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt7vhcyd_Xy8IuEtVc6g5nBPDsHsvvPwxACA&s"
        ),
        DealListRow(
            title: "아이유 스마트톡 그립톡 거치대 팝니다",
            price: "8,000원",
            location: "전라남도 전주시 ⋅ 1일 전",
            artist: "아이유",
            imageURL: "https://media.bunjang.co.kr/product/310676787_1_1738036313_w1200.jpg?crop=0"
        ),
        DealListRow(
            title: "시이나 링고 무죄 모라토리엄 팔아요",
            price: "277,000원",
            location: "경기도 화성시 ⋅ 1일 전",
            artist: "277,000원",
            imageURL: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/53H5/image/-77PFqPUIpC6kVzVNzAHnJWhD4M.png"
        ),
        DealListRow(
            title: "허각 폰케이스 팔아요",
            price: "14,000",
            location: "전라남도 전주시 ⋅ 오늘",
            artist: "허각",
            imageURL: "https://i.namu.wiki/i/2697sSxspHWS77hrKuHtZ9A40UecyP5o4HNrs2HljMuNzdmmehJQzlMXo-krOqbB-7ERdt7JYWQxkLR8ky7_cw.webp"
        ),
        DealListRow(
            title: "포터 로빈슨 피지컬 팝니당",
            price: "20,000원",
            location: "서울 가좌동 ⋅ 오늘",
            artist: "포터 로빈슨",
            imageURL: "https://www.billboard.com/wp-content/uploads/media/porter-robinson-peace-sign-june-2017-billboard-1548.jpg"
        ),
        DealListRow(
            title: "로이킴 각종 스티커팩 판매합니다",
            price: "11,000원",
            location: "전라남도 목포시 ⋅ 오늘",
            artist: "로이킴",
            imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Ot9WX4x8rYyeMlyQPyORlzrmSoW8O3b0-Q&s"
        )
    ]
    
}
