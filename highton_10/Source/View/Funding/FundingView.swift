//
//  FundingView.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

struct FundingView: View {
    @StateObject var viewModel = FundingViewModel()
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
                        .padding(.bottom, 60)
                    }
                }
            }
        }
    }
    
    private var navigationBar: some View {
        NavigationBar(
            title: "펀딩",
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
                ForEach(viewModel.fundingList, id: \.self) { text in
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
            placeholder: "펀딩 제목, 유저, 아티스트로 검색하기",
            status: .normal,
            leadingView: { AnyView(
                Image("search")
                    .foregroundStyle(Color.contentAdditive)
            ) }
        )
    }
    
    private var groupPurchaseList: some View {
        ForEach(viewModel.fundingInfo.indices, id: \.self) { text in
            groupPurchaseItem(for: text)
                .padding(.vertical, 4)
        }
    }
    
    private func groupPurchaseItem(for text: Int) -> some View {
        NavigationLink(destination: FundingInfoView()) {
            VStack {
                FeedHeader(profileImage: viewModel.fundingInfo[text].header.profileImage, name: viewModel.fundingInfo[text].header.nickname, title: "인증된 유저")
                groupPurchaseImage(for: text)
                FeedFoot(title: viewModel.fundingInfo[text].foot.title, description: viewModel.fundingInfo[text].foot.description, percent: viewModel.fundingInfo[text].foot.percent, startDate: viewModel.fundingInfo[text].foot.startDate, endDate: viewModel.fundingInfo[text].foot.endDate)
            }
            .padding(.vertical, 4)
            .background(Color.fillInteractive)
            .cornerRadius(.radius16)
            .padding(.horizontal, 16)
        }
        .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius16))
    }

    private func groupPurchaseImage(for text: Int) -> some View {
        AsyncImage(
            url: URL(string: viewModel.fundingInfo[text].relate.profileImage)
        ) { image in
            image
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 338, height: 220)
                .clipped()
                .scaledToFill()
        } placeholder: {
            Rectangle()
                .frame(width: 338, height: 220)
                .foregroundStyle(Color.gray)
            
        }
        .cornerRadius(.radius12)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    GroupPurchaseView()
}


#Preview {
    FundingView()
}
