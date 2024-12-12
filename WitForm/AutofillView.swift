//
//  AutofillView.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/12/24.
//

import SwiftUI

struct AutofillView: View {
    @State private var savedData: [SavedResponse] = [
        SavedResponse(q: "ชื่อ สกุล", a: "สมชาย ใจดี"),
        SavedResponse(q: "มหาลัย", a: "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"),
        SavedResponse(q: "สาขาวิชา", a: "วิศวกรรมระบบไอโอทีและสารสนเทศ"),
    ]
    
    @Binding var showAutofillView: Bool
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("คุณเคยกรอกข้อมูลดังนี้แล้ว")
                    .font(.title)
                    .fontWeight(.bold)
                
                ForEach(savedData, id: \.self) { data in
                    
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
                    
                }
                .buttonStyle(NextButtonStyle())
            }
            .padding()
            .frame(width: .infinity, height: .infinity)
            .background(lightCream.opacity(0.25))
        }
    }
}

#Preview {
    struct Preview: View {
        @State private var showAutofillView: Bool = true
        var body: some View {
            AutofillView(showAutofillView: $showAutofillView)
        }
    }

    return Preview()
}
