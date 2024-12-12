//
//  AutofillView.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/12/24.
//

import SwiftUI

struct AutofillView: View {
    
    var questions: [String]
    
    private var savedDatas: [SavedResponse] {
        checkWithPersonalData()
    }
    
    @Binding var isPresenting: Bool
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("คุณเคยกรอกข้อมูลดังนี้แล้ว")
                    .font(.title)
                    .fontWeight(.bold)
                
                ForEach(savedDatas, id: \.self) { data in
                    
                    HStack {
                        VStack(alignment: .leading, spacing: -5) {
                            Text(data.q)
                                .font(.title2)
                                .foregroundStyle(.white.opacity(0.5))
                            Spacer()
                            Text(data.a)
                                .font(.title2)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                    }
                    .padding(30)
                    .frame(width: .infinity, height: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 15.0)
                        .fill(autoElementBackground)
                        .stroke(blue, lineWidth: 0.25)
                    )
                }
                Spacer()
                Text("อนุญาตเพื่อกรอกโดยอัตโนมัติ")
                Button("อนุญาต") {
                    isPresenting = false
                }
                .buttonStyle(NextButtonStyle())
            }
            .padding()
            .frame(width: .infinity, height: .infinity)
            .background(lightCream.opacity(0.25))
        }
    }
    
    private func checkWithPersonalData() -> [SavedResponse] {
        var matchedDatas: [SavedResponse] = []
        for question in questions {
            if let matchedData = personalData.first(where: { $0.q == question}) {
                matchedDatas.append(matchedData)
            }
        }
        return matchedDatas
    }
}

#Preview {
    struct Preview: View {
        @State private var showAutofillView: Bool = true
        @State private var canbeAutofilledData: [String] = [
            "ชื่อ สกุล", "อายุ", "เพศ", "สาขาวิชา"
        ]
        var body: some View {
            AutofillView(questions: canbeAutofilledData, isPresenting: $showAutofillView)
        }
    }

    return Preview()
}
