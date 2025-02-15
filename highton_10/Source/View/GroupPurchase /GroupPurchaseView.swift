//
//  GroupPurchaseView.swift
//  highton_10
//
//  Created by 최시훈 on 2/15/25.
//

import SwiftUI

struct GroupPurchaseView: View {
    
    @StateObject var viewModel = GroupPurchaseViewModel()
    var body: some View {
        VStack {
            NavigationBar(
                title: "공동구매",
                trailingPrimaryView: {
                    AnyView(
                        Button {
                            // 작성하기 뷰 이동
                        } label: {
                            Image("add")
                                .foregroundStyle(.assistive)
                        }
                    )
                }
            )
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.groupPurchaseList, id: \.self) { text in
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
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.leading, 13)
                
                InputTextField(
                    text: $viewModel.searchText,
                    placeholder: "공동구매 제목, 유저, 아티스트로 검색하기",
                    status: .normal,
                    leadingView: { AnyView(Image("search")) }
                )
                
                ForEach(viewModel.groupPurchaseList, id: \.self) { text in
                    Button {
                        
                    } label: {
                        VStack {
                            FeedHeader(profileImage: "", name: "최시훈", title: "인증된 유저")
                            FeedBody(imageURL: "")
                            FeedFoot(title: "title", description: "description", percent: 50, startDate: "1월 17일 시작", endDate: "2월 27일까지")
                        }
                        .padding(.vertical, 4)
                        .background(Color.fillInteractive)
                        .cornerRadius(.radius16)
                        .padding(.horizontal, 16)
                    }
                    .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius16))
                }
            }
        }
    }
}

#Preview {
    GroupPurchaseView()
}
