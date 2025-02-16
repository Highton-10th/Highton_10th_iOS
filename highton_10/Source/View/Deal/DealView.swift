//
//  DealView.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

struct DealView: View {
    @StateObject var viewModel = DealViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.rootStrong.ignoresSafeArea()
                
                VStack {
                    NavigationBar(
                        title: "거래",
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
                    ScrollView {
                        VStack {
                            chipView
                            
                            InputTextField(
                                text: $viewModel.searchText,
                                placeholder: "상품 제목, 유저, 아티스트로 검색하기",
                                status: .normal,
                                leadingView: { AnyView(
                                    Image("search")
                                        .foregroundStyle(Color.contentAdditive)
                                ) }
                            )
                            
                            ForEach(viewModel.dealList.indices, id: \.self) { index in
                                NavigationLink(destination: DealInfoView()) {
                                    row(for: index)
                                }
                                .buttonStyle(BounceAnimationRoundedButtonStyle(radius: .radius16))
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func row(for index: Int) -> some View {
        HStack(spacing: 8) {
            AsyncImage(
                url: URL(string: viewModel.dealList[index].imageURL)
            ) { image in
                image
                    .resizable()
            } placeholder: {
                Rectangle()
                    .foregroundStyle(Color.gray)
            }
            .cornerRadius(.radius12)
            .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.dealList[index].location)
                    .foregroundStyle(Color.contentAssistive)
                    .font(.highFootnote.font)
                    .multilineTextAlignment(.leading)
                
                Text(viewModel.dealList[index].title)
                    .foregroundStyle(Color.contentBase)
                    .font(.highBody.font)
                    .multilineTextAlignment(.leading)
                
                Text(viewModel.dealList[index].price)
                    .foregroundStyle(Color.contentAdditive)
                    .font(.highFootnote.font)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 4)
            
            Spacer()
            
            Image("chevron_right")
                .foregroundStyle(Color.contentAssistive)
                .frame(width: 24, height: 24)
        }
        .padding(.vertical, 10)
        .background(Color.fillStatic)
        .padding(.horizontal, 16)
        .cornerRadius(.radius16)
    }
    private var chipView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.chipArray, id: \.self) { text in
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
    }
}

#Preview {
    DealView()
}
