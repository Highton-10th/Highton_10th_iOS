//
//  GroupPurchaseView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

import SwiftUI

struct GroupPurchaseView: View {
    @StateObject var viewModel = GroupPurchaseViewModel()
    @Namespace var image
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.rootStrong.ignoresSafeArea()
                VStack {
                    navigationBar
                    ScrollView {
                        VStack {
                            chipScrollView
                            searchField
                            groupPurchaseList
                        }
                    }
                }
            }
        }
    }
    
    private var navigationBar: some View {
        NavigationBar(
            title: "공동구매",
            trailingPrimaryView: {
                AnyView(
                    Button {
                        // 작성하기 뷰 이동
                    } label: {
                        Image("add")
                            .foregroundStyle(Color.contentAssistive)
                    }
                )
            }
        )
    }
    
    private var chipScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.groupPurchaseList, id: \.self) { text in
                    chipButton(for: text)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.leading, 13)
    }
    
    private func chipButton(for text: String) -> some View {
        Button {
            viewModel.searchText = text
            viewModel.selectedChip = text
        } label: {
            ChipView(
                text: text,
                selected: text == viewModel.selectedChip
            )
        }
        .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius8))
        .padding(.horizontal, 3)
    }
    
    private var searchField: some View {
        InputTextField(
            text: $viewModel.searchText,
            placeholder: "공동구매 제목, 유저, 아티스트로 검색하기",
            status: .normal,
            leadingView: { AnyView(
                Image("search")
                    .foregroundStyle(Color.contentAdditive)
            ) }
        )
    }
    
    private var groupPurchaseList: some View {
        ForEach(viewModel.groupPurchaseList, id: \.self) { text in
            groupPurchaseItem(for: text)
        }
    }
    
    private func groupPurchaseItem(for text: String) -> some View {
        NavigationLink(destination: GroupPurchaseInfoView()) {
            VStack {
                FeedHeader(profileImage: "", name: "최시훈", title: "인증된 유저")
                groupPurchaseImage
                FeedFoot(title: "title", description: "description", percent: 50, startDate: "1월 17일 시작", endDate: "2월 27일까지")
            }
            .padding(.vertical, 4)
            .background(Color.fillInteractive)
            .cornerRadius(.radius16)
            .padding(.horizontal, 16)
        }
        .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius16))
    }

    private var groupPurchaseImage: some View {
        AsyncImage(
            url: URL(string: viewModel.imageUrl)
        ) { image in
            image
                .resizable()
        } placeholder: {
            Rectangle()
                .foregroundStyle(Color.gray)
        }
        .cornerRadius(.radius12)
        .frame(width: 338, height: 220)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .matchedGeometryEffect(id: viewModel.imageUrl, in: image)
    }
}

#Preview {
    GroupPurchaseView()
}
