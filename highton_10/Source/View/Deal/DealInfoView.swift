//
//  DealInfoView.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

struct DealInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = DealInfoViewModel()
    @State var isPresent: Bool = false
    @State var isChatViewPresent: Bool = false
    @State var check: Bool = false
    @State var text: String = ""
    @State var show: Bool = false
    @State var spacing: CGFloat = 540

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.rootStrong.ignoresSafeArea()
                
                NavigationBarWhite(
                    title: "거래 보기",
                    leadingView: {
                        AnyView(
                            Button {
                                dismiss()
                            } label: {
                                Image("arrow_back_ios")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(Color.contentAssistive)
                            }
                        )
                    }, trailingPrimaryView:  {
                        AnyView(
                            Image("ios_share")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.contentAssistive)
                        )
                    }, trailingSecondView: {
                        AnyView(
                            Image("more_vert")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color.contentAssistive)
                        )
                    }
                    
                )
                .padding(.top, 62)
                .background(.clear)
                .zIndex(1)
                
                ScrollView {
                    VStack {
                        AsyncImage(
                            url: URL(string: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/53H5/image/-77PFqPUIpC6kVzVNzAHnJWhD4M.png")
                        ) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .overlay {
                                    Color.dimRegular
                                }
                        } placeholder: {
                            Rectangle()
                                .foregroundStyle(Color.gray)
                        }
                        .frame(width: 402, height: 402)
                    }
                    FeedHeader(
                        profileImage: "https://i.namu.wiki/i/xZr2dbPytysrk0LuNJPUWzVZFTWCdgiv82icZ9g4WF90bAHrtwj63y0gymihzqCNb5gW9YS15a0dgl96jnHyMA.webp",
                        name: "시이나 링고",
                        title: "인증된 유저"
                    )
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.dealInfo.location)
                            .foregroundStyle(Color.contentAssistive)
                            .font(.highFootnote.font)
                            .multilineTextAlignment(.leading)
                        
                        Text(viewModel.dealInfo.title)
                            .foregroundStyle(Color.contentBase)
                            .font(.highSubhead.font)
                            .multilineTextAlignment(.leading)
                        
                        Text(viewModel.dealInfo.price)
                            .foregroundStyle(Color.contentAdditive)
                            .font(.highFootnote.font)
                            .multilineTextAlignment(.leading)
                    }
                    
                    FeedHeader(profileImage: "https://i.namu.wiki/i/UlWo5dsly3hO44GEN4_2HLGnmExmFD6gXrgXOQfd-hZz5XnO3wWO_Zt0c305jyByqLx_1fubQXpLQ1TC4okLeV4uso_QPqd-hEvNrwHZHbUa3JZfWGt2Tm8ErTR0pPEbrrb4VDicAcSgmhS-KZm0waHbqE41TqzZDmre0xgYHFI.webp", name: "시이나 링고", title: "관련 아티스트")
                    
                    HighDivider(type: .wide)
                    
                    HStack {
                        Text("거래 희망 장소")
                            .font(.highCallout.font)
                            .foregroundStyle(Color.contentAdditive)
                        
                        Spacer()
                        
                        Text("경기도 화성시 반송동 동탄중앙로 220")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAssistive)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationBarBackButtonHidden(true)
            .background(Color.rootStrong)
            .ignoresSafeArea(.all)
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.fillStatic)
                    .frame(height: 70)
                    .frame(maxWidth: .infinity)
                
                VStack {
                    HStack {
                        Text("가격 제안 불가")
                            .font(.highFootnote.font)
                            .foregroundStyle(Color.contentAssistive)
                        Spacer()
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    
                    HStack {
                        Text("277,000원")
                            .font(.highSubhead.font)
                            .foregroundStyle(Color.contentBase)
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 2)
                    .padding(.bottom, 22)
                    
                    HStack {
                        Rectangle()
                            .foregroundStyle(Color.fillRegular)
                            .overlay {
                                Image("favorite")
                                    .foregroundStyle(Color.contentDisabled)
                            }
                            .cornerRadius(.radius12)
                            .frame(width: 56, height: 56)
                        
                        
                        ActionButton(label: "채팅하기", type: .primary) {
                            isPresent = true
                        }
                    }
                    .background(Color.fillStatic)
                }
                .padding(.horizontal, 16)
                
            }
            .padding(.bottom, 70)
        }
        .sheet(isPresented: $isPresent) {
            ScrollView {
                VStack {
                    HStack {
                        Button {
                            isPresent = false
                            dismiss()
                        } label: {
                            Image("close")
                                .foregroundStyle(Color.contentAssistive)
                        }
                        
                        Text("오지후")
                            .font(.highHeadline.font)
                            .foregroundStyle(Color.contentBase)
                            .padding(.leading, 8)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 13)
                    HStack(spacing: 8) {
                        AsyncImage(
                            url: URL(string: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/53H5/image/-77PFqPUIpC6kVzVNzAHnJWhD4M.png")
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
                            Text("경기도 화성시 ⋅ 1일 전")
                                .foregroundStyle(Color.contentAssistive)
                                .font(.highFootnote.font)
                                .multilineTextAlignment(.leading)
                            
                            Text("시이나 링고 무죄 모라토리엄 팔아요")
                                .foregroundStyle(Color.contentBase)
                                .font(.highBody.font)
                                .multilineTextAlignment(.leading)
                            
                            Text("277,000원")
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
                    
                    ZStack(alignment: .bottom) {
                        if show {
                            HStack {
                                Spacer()
                                
                                Text("안녕하세요 이 제품 너무 사고 싶어요ㅠㅠ")
                                    .font(.highParagraphSmall.font)
                                    .foregroundStyle(Color.contentElevated)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(Color.brandStrong)
                                    .cornerRadius(.half)
                            }
                            .padding(.horizontal, 16)
                        }
                        
                    }
                    Spacer()
                        .frame(height: spacing)
                    InputTextField(text: $text, placeholder: "메시지를 입력해 주세요", status: .normal, leadingView: { AnyView(Image("add").foregroundStyle(Color.contentAssistive))}, trailingView: {
                        AnyView(
                            Button {
                                show = true
                                spacing = 48
                                text = ""
                            } label: {
                                Image("send")
                                    .foregroundStyle(Color.contentAssistive)
                            }
                        )
                    }
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
            }
            .background(Color.fillStatic)
        }
        .background(Color.fillStatic)

    }
}
