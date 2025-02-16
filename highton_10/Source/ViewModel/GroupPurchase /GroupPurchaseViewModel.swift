//
//  GroupPurchaseViewModel.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

class GroupPurchaseViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var selectedChip: String = ""
    @Published var groupPurchaseList: [String] = ["전체", "뉴진스", "혁오", "The 1975", "검정치마", "시이나 링고", "데이식스", "창모", "릴러말즈"]
    @Published var index = [
        "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/njz_thumbnail.png",
        "https://img1.newsis.com/2020/11/02/NISI20201102_0000628280_web.jpg",
        "https://i.namu.wiki/i/uTOUQlVJMoG0ZKOG41TzVZda6_nToQLTsuQg_03fCSiUmDGEOxltUMMuH-QVahgp-nfKFdyK86TtX_xED9gXd0EusPf00P4c5EDitI_O2Xc16HHksihiUTAlR14o8IDPQenRCrqZ9cQeN_2ZCqFJvUVbgVg-UMiUwAU0Ed2WGtE.webp"
    ]
    @Published var groupPurchaseInfo: [GroupPurchaseInfoModel] = [
        GroupPurchaseInfoModel(
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
                profileImage: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/njz_all.svg",
                nickname: "뉴진스 (NJZ)"
            ),
            items: [
                GroupPurchaseItems(imageURL: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/hanni.svg", nickname: "'How Sweet' Standard 버전 (하니 에디션)"),
                GroupPurchaseItems(imageURL: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/minji.svg", nickname: "'How Sweet' Standard 버전 (민지 에디션)"),
                GroupPurchaseItems(imageURL: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/daniel.svg", nickname: "'How Sweet' Standard 버전 (다니엘 에디션)"),
                GroupPurchaseItems(imageURL: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/haerin.svg", nickname: "'How Sweet' Standard 버전 (해린 에디션)"),
                GroupPurchaseItems(imageURL: "https://gqvwqimiwieqzagknuun.supabase.co/storage/v1/object/public/images/uploads/hyein.svg", nickname: "'How Sweet' Standard 버전 (혜인 에디션)")
            ]
        ),
        GroupPurchaseInfoModel(
            header: GroupPurchaseHeaderModel(
                profileImage: "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/4SLMUQPZAT6PYPIBK22V44G6UI.jpg",
                nickname: "최시훈"
            ),
            foot: GroupPurchaseFootModel(
                title: "에스파 (aespa) 미니앨범 3집 [MY WORLD]",
                description: "",
                percent: 12,
                startDate: "2월 12일 시작",
                endDate: "2월 25일까지"
            ),
            participationPeople: 40,
            relate: GroupPurchaseRelateModel(
                profileImage: "https://img1.newsis.com/2020/11/02/NISI20201102_0000628280_web.jpg",
                nickname: "에스파 (Aespa)"
            ),
            items: [
                GroupPurchaseItems(imageURL: "https://09platform.com/web/product/big/202304/66b36918ea1d9b0ec1aa62b36dd5ed82.jpg", nickname: "Poister"),
                GroupPurchaseItems(imageURL: "https://i.namu.wiki/i/N0P5TbMbpc2spx_zCQlDip9WM-7ZoO1_lo2IT5qp2-Hmr0gHmrokOLwy2K1OdG4Xtc6wQEYv6vaavMMMGXaPxA.webp", nickname: "Spicy")
            ]
        ),
        GroupPurchaseInfoModel(
            header: GroupPurchaseHeaderModel(
                profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNgvIRiUOWcmb9hfnSTB2119A2Ge3v2MZQJA&s",
                nickname: "김유석"
            ),
            foot: GroupPurchaseFootModel(
                title: "엔믹스 (NMIXX) 싱글앨범 3집 A Midsummer NMIXX s Dream",
                description: "",
                percent: 12,
                startDate: "2월 8일 시작",
                endDate: "2월 20일까지"
            ),
            participationPeople: 80,
            relate: GroupPurchaseRelateModel(
                profileImage: "https://i.namu.wiki/i/uTOUQlVJMoG0ZKOG41TzVZda6_nToQLTsuQg_03fCSiUmDGEOxltUMMuH-QVahgp-nfKFdyK86TtX_xED9gXd0EusPf00P4c5EDitI_O2Xc16HHksihiUTAlR14o8IDPQenRCrqZ9cQeN_2ZCqFJvUVbgVg-UMiUwAU0Ed2WGtE.webp",
                nickname: "엔믹스 (NMIXX)"
            ),
            items: [
                GroupPurchaseItems(imageURL: "https://i.namu.wiki/i/J10eoDwVqMGEREmDrdYU8olintOoiPZfmSRyvN6eGktnj1ixHj-B0dqp7_EjaRScfU2KfYYfaTsNen7isI7kug.webp", nickname: "Fe3O4 STICK OUT"),
                GroupPurchaseItems(imageURL: "https://i.namu.wiki/i/uTOUQlVJMoG0ZKOG41TzVVmbk6qcWnTCSbxLc37aiBnYFgkrblwDd3t1DDOXt9dta4CWRotaePAbxYV2pWHeB1TH7J2Je8o9_qxTJNP3HNnJeR3bhm1hKgm5gHm68QeGOK4R5YHh-ei-KdRReNbyr-sUvsdS24aUjBIQ2qHuVtM.webp", nickname: "Fe3O4: BREAK"),
                GroupPurchaseItems(imageURL: "https://i.namu.wiki/i/uTOUQlVJMoG0ZKOG41TzVdLhesjtL9qFkzylXTvk1E1MW0La5HKDqJ2HDFJT3BwjN1hTUPCwYB00BC1aDsRu6b2YFZMENHdSo0V2l8w7OUjDXT6rpK17trLXLTrtrOhwvesdP_WZmameEQ7NNrQX_mYQc_PiQR__VaaJXwAsVM4.webp", nickname: "Sonar")
            ]
        )
    ]
}
