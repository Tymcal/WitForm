//
//  ModelData.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/11/24.
//

import Foundation
import SwiftUI

struct User {
    var stuid: String
    var firstName: String
    var lastName: String
    var id: String { stuid }
}

struct Question: Identifiable {
    let id = UUID()
    let title: String
    let type: QuestionType
    var options: [String]? = nil
}

enum QuestionType {
    case text
    case toggle
    case picker
}

struct Response {
    var id: UUID
    var answer: Any? // Holds the response for each question
}

struct SavedResponse: Identifiable, Hashable {
    var q: String
    var a: String // Holds the response for each question
    var id: String { q }
}

struct UserData: Identifiable {
    var stuid: String
    var responses: [Response] = []
    var id: String { stuid }
}

var testUser: User {
    User(stuid: "65010490", firstName: "Teema", lastName: "Khawjit")
}

struct SurveyForm: Identifiable {
    var id = UUID()
    var title: String
    var questions: [Question]
    var owner: String
}

var testSurvey: SurveyForm {
    SurveyForm(title: "แบบสำรวจ\nความพึงพอใจ\nต่อแอปธนาคารต่างๆ",
               questions: [
                Question(title: "ชื่อ สกุล", type: .text),
                Question(title: "อีเมล", type: .text),
                Question(title: "เพศ", type: .text),
                Question(title: "สาขาวิชา", type: .text),
                Question(title: "Agree to terms?", type: .toggle),
                Question(title: "Select your preference", type: .picker, options: ["Option 1", "Option 2", "Option 3"])
               ],
               owner: testUser.stuid)
}
var testSurvey2: SurveyForm {
    SurveyForm(title: "แบบสำรวจ\nความพึงพอใจ\nต่อการใช้ตู้คาเฟ่อัตโนมัติ\nเต่าบิน",
               questions: [
                Question(title: "อาชีพ", type: .text),
                Question(title: "ทีี่อยู่", type: .text),
                Question(title: "เบอร์โทร", type: .text),
                Question(title: "Facebook", type: .text),
                Question(title: "Instagram", type: .text),
                Question(title: "LinkedIn", type: .text),
                Question(title: "ชอบเพลงไหน", type: .toggle),
                Question(title: "แอปซื้อของที่ชอบ", type: .picker, options: ["Shopee", "Lazada", "TikTok Shop"])
            ],
               owner: testUser.stuid)
}

var personalData: [SavedResponse] {
    [
        SavedResponse(q: "อีเมล", a: "65010490@kmitl.ac.th"),
        SavedResponse(q: "อายุ", a: "100"),
        SavedResponse(q: "ชื่อ สกุล", a: "สมชาย ใจดี"),
        SavedResponse(q: "มหาลัย", a: "สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง"),
        SavedResponse(q: "สาขาวิชา", a: "วิศวกรรมระบบไอโอทีและสารสนเทศ"),
        SavedResponse(q: "เพศ", a: "หญิง"),
        
    ]
}
