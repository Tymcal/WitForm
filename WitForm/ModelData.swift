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

var testQuestions: [Question] {
    [
        Question(title: "ชื่อ สกุล", type: .text),
        Question(title: "อีเมล", type: .text),
        Question(title: "เพศ", type: .text),
        Question(title: "สาขาวิชา", type: .text),
        Question(title: "Agree to terms?", type: .toggle),
        Question(title: "Select your preference", type: .picker, options: ["Option 1", "Option 2", "Option 3"])
    ]
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
