//
//  WithdrawalView.swift
//  hometerview
//
//  Created by 김혜리 on 2022/08/14.
//

import SwiftUI

struct WithdrawalView: View {
    @State private var firstDetail = false
    @State private var secondDetail = false
    @State private var thirdDetail = false

    var body: some View {
        Text("회원 탈퇴 전 아래의 내용을 꼭 확인해 주세요.")
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.vertical, 16)
            .padding(.horizontal, 42)
            .font(.pretendard(size: 12, weight: .regular))
            .foregroundColor(.colorStyle(.red500))
        VStack(alignment: .leading, spacing: 8) {
            Button {
                firstDetail.toggle()
            } label: {
                HStack(alignment: .top) {
                    firstDetail ? Image("icon_selected_circle") : Image("icon_circle")
                    
                    Text("회원 탈퇴 시 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구가 불가능합니다. 다만 법령에 의하여 보관해야 하는 경우 또는 회사 내부 정책에 의하여 보관해야 하는 정보는 탈퇴 후에도 일정 기간 보관됩니다. 자세한 사항은 개인정보처리방침에서 확인하실 수 있습니다.")
                        .font(.pretendard(size: 12, weight: .regular))
                        .foregroundColor(.colorStyle(.gray900))
                        .multilineTextAlignment(.leading)
                }
            }

            Button {
              secondDetail.toggle()
            } label: {
                HStack(alignment: .top) {
                    secondDetail ? Image("icon_selected_circle") : Image("icon_circle")

                    Text("회원 탈퇴 후 재가입하더라도 탈퇴 전의 회원 정보 및 서비스 이용 기록은 복구되지 않습니다.")
                        .font(.pretendard(size: 12, weight: .regular))
                        .foregroundColor(.colorStyle(.gray900))
                        .multilineTextAlignment(.leading)
                }
            }

            Button {
              thirdDetail.toggle()
            } label: {
                HStack(alignment: .top) {
                    thirdDetail ? Image("icon_selected_circle") : Image("icon_circle")

                    Text("회원을 탈퇴하더라도 집터뷰 서비스에 기록한 리뷰, 댓글 등의 게시물은 삭제되지 않습니다. 회원을 퇄퇴하면, 개인정보가 삭제되며 게시물을 수정하거나 삭제할 수 없으니게시물 삭제가 필요한 회원은 게시물 삭제 후 탈퇴 신청하시기 바랍니다.")
                        .font(.pretendard(size: 12, weight: .regular))
                        .foregroundColor(.colorStyle(.gray900))
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .padding(.horizontal, 14)
        
        Spacer()
        
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 50)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(firstDetail && secondDetail && thirdDetail ? .colorStyle(.blue300) : .colorStyle(.gray200))
                .padding(.all, 14)
                .overlay(
                    Text("탈퇴하기")
                        .font(.pretendard(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                )
        }
        .navigationTitle("회원탈퇴")
    }
}

struct WithdrawalView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawalView()
    }
}
