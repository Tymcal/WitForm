//
//  AutofillView.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/12/24.
//

import SwiftUI

struct AutofillView: View {
    
    var questions: [Question]
    
    private var savedDatas: [SavedResponse] {
        var matchedDatas: [SavedResponse] = []
        for question in questions {
            if let matchedData = personalData.first(where: { $0.q == question.title}) {
                matchedDatas.append(matchedData)
            }
        }
        return matchedDatas
    }
    
    @State private var responses: [UUID: Response] = [:]
    
    @Binding var userDatas: UserData
    @Binding var isPresenting: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("คุณเคยกรอกข้อมูลดังนี้แล้ว")
                    .font(.Ktitle)
                    .fontWeight(.bold)
                    .padding(.vertical)
                
                ForEach(savedDatas, id: \.self) { data in
                    
                    HStack {
                        VStack(alignment: .leading, spacing: -5) {
                            Text(data.q)
                                .foregroundStyle(.white.opacity(0.5))
                            Spacer()
                            Text(data.a)
                                .font(.Ktitle2)
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
                    .padding()
                    .foregroundStyle(.gray)
                Button("อนุญาต") {
                    allow()
                    isPresenting = false // back to the form page
                }
                .buttonStyle(NextButtonStyle())
            }
            .padding()
            .font(.K)
            .frame(width: .infinity, height: .infinity)
            .background(lightCream.opacity(0.25))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("ยกเลิก") {
                        isPresenting = false
                    }
                }
                
            }
        }
    }
    
    private func allow() {
        // Process all responses
        for question in questions {
            if let response = Response(id: question.id, answer: savedDatas.first(where: { $0.q == question.title })).answer {
                print("\(question.title): \(response)")
                userDatas.responses.append(Response(id: question.id, answer: response))
            } else {
                print("\(question.title): No response")
                userDatas.responses.append(Response(id: question.id, answer: "-"))
            }
        }
        print(userDatas)
    }
}

#Preview {
    struct Preview: View {
        @State private var showAutofillView: Bool = true
        private var canbeAutofilledData: [Question] = [
            Question(title: "อาชีพ", type: .text),
            Question(title: "ทีี่อยู่", type: .text),
            Question(title: "เบอร์โทร", type: .text),
            Question(title: "Facebook", type: .text),
        ]
        @State private var userDatas: UserData = UserData(stuid: "")
        var body: some View {
            AutofillView(questions: canbeAutofilledData, userDatas: $userDatas, isPresenting: $showAutofillView)
                .font(.K)
        }
    }

    return Preview()
}
