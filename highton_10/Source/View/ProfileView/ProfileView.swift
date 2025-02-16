//
//  ProfileView.swift
//  highton_10
//
//  Created by 최시훈 on 2/16/25.
//

import SwiftUI

struct ProfileView: View {
    @State var isPresent: Bool = false
    @State var text: String = ""
    @State var show: Bool = false
    @State var spacing: CGFloat = 440
    
    var body: some View {
        ZStack {
            Color.rootStrong.ignoresSafeArea()
            
            VStack {
                NavigationBar(
                    title: "프로필",
                    trailingPrimaryView: {
                        AnyView(
                            Button {

                            } label: {
                                Image("settings")
                                    .foregroundStyle(Color.contentAssistive)
                            }
                        )
                    }
                )
                Image("name")
                    .padding(.vertical, 10)

                Image("Chating")
                    .padding(.vertical, 10)
                    .onTapGesture {
                        isPresent = true
                    }
                
               Image("artist")
                    .padding(.vertical, 10)
                
                Spacer()
            }
            .sheet(isPresented: $isPresent) {
                ScrollView {
                    VStack {
                        HStack {
                            Button {
                                isPresent = false
                            } label: {
                                Image("close")
                                    .foregroundStyle(Color.contentAssistive)
                            }
                            
                            Text("test1")
                                .font(.highHeadline.font)
                                .foregroundStyle(Color.contentBase)
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 13)
                        
                        VStack(spacing: 2) {
                            HStack {
                                Image("image")
                                    .clipShape(Circle())
                                
                                Text("대답")
                                    .font(.highParagraphSmall.font)
                                    .foregroundStyle(Color.contentElevated)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(Color.fillStrong)
                                    .cornerRadius(.half)
                                    .padding(.leading, 8)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            
                            HStack {
                                Spacer()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())

                                Text("되나요")
                                    .font(.highParagraphSmall.font)
                                    .foregroundStyle(Color.contentElevated)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(Color.fillStrong)
                                    .cornerRadius(.half)
                                    .padding(.leading, 8)

                                
                                Spacer()
                            }
                            .padding(.horizontal, 24)
                            
                        
                            
                            HStack {
                                Spacer()
                                    .clipShape(Circle())

                                
                                Text("슛")
                                    .font(.highParagraphSmall.font)
                                    .foregroundStyle(Color.contentElevated)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(Color.brandStrong)
                                    .cornerRadius(.half)
                            }
                            .padding(.horizontal, 16)
                            
                            HStack {
                                Image("image")
                                    .clipShape(Circle())

                                Text("Test1")
                                    .font(.highParagraphSmall.font)
                                    .foregroundStyle(Color.contentElevated)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 12)
                                    .background(Color.fillStrong)
                                    .cornerRadius(.half)
                                    .padding(.leading, 8)
                                Spacer()

                            }
                            .padding(.horizontal, 16)
                            
                            if show {
                                HStack {
                                    Spacer()
                                    
                                    Text("여러분 안녕하세요")
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
                                    spacing = spacing - 44
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
}
