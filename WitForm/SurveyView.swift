//
//  SurveyView.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/11/24.
//

import SwiftUI

struct SurveyView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("ต้องการผู้เข้าร่วมการชิมไวน์ พร้อมทำความพึงพอใจต่อรสชาติ")
                        .font(.title)
                        .padding(30)
                    Spacer()
                    HStack(spacing: 0) {
                        Button {
                            
                        } label: {
                            Text("ข้าม")
                        }
                        .padding()
                        .frame(width: 175)
                        .foregroundStyle(darkCream)
                        .background(lightCream)
                        
                        Button {
                            
                        } label: {
                            Text("ทำเลย")
                        }
                        .padding()
                        .frame(width: 175)
                        .foregroundStyle(lightCream)
                        .background(purple)
                    }
                }
                .frame(width: 350, height: 550)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .shadow(color: .black.opacity(0.05), radius: 100, x: 0, y: 0)
            }
            .navigationTitle("แบบสำรวจ")
            .frame(width: width, height: height)
            .background(GradientBackground())
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    SurveyView()
}
