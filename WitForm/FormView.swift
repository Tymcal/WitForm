//
//  FormView.swift
//  WitForm
//
//  Created by Teema Khawjit on 12/11/24.
//

import SwiftUI

struct FormView: View {
    
    private var user: User {
        testUser
    }
    
    private var surveyForm: SurveyForm {
        testSurvey
    }
    private var questions: [Question] {
        surveyForm.questions
    }
    
    @State private var savedData: [SavedResponse] = personalData
    
    private var matchedData: [String] {
        var canbeAutofilledData: [String] = []
        for question in questions {
            if let ques = savedData.first(where: { $0.q == question.title }) {
                canbeAutofilledData.append(ques.q)
            }
        }
//        print(canbeAutofilledData)
        return canbeAutofilledData
    }
    
    private var manualQuestions: [Question] {
        let matchedSet = Set(matchedData)
        return questions.filter { question in
            !matchedSet.contains(question.title)
        }
    }
    
    private var autoQuestions: [Question] {
        let matchedSet = Set(matchedData)
        return questions.filter { question in
            matchedSet.contains(question.title)
        }
    }
    
    @State private var responses: [UUID: Response] = [:]
    
    @State private var userDatas: UserData = UserData(stuid: "")
    
    @State private var isPresenting: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(manualQuestions) { question in
                        VStack(alignment: .leading) {
                            Text(question.title)
                            switch question.type {
                            case .text:
                                TextField("Enter here", text: Binding(
                                    get: {
                                        responses[question.id]?.answer as? String ?? ""
                                    },
                                    set: { newValue in
                                        responses[question.id] = Response(id: question.id, answer: newValue)
                                    }
                                ))
                                .textFieldStyle(AnsTextFieldStyle())
                                
                            case .toggle:
                                Toggle(isOn: Binding(
                                    get: {
                                        (responses[question.id]?.answer as? Bool) ?? false
                                    },
                                    set: { newValue in
                                        responses[question.id] = Response(id: question.id, answer: newValue)
                                    }
                                )) {
                                    Text("Agree?")
                                }
                                
                            case .picker:
                                if let options = question.options {
                                    Picker("Select an option", selection: Binding(
                                        get: {
                                            responses[question.id]?.answer as? String ?? options.first ?? ""
                                        },
                                        set: { newValue in
                                            responses[question.id] = Response(id: question.id, answer: newValue)
                                        }
                                    )) {
                                        ForEach(options, id: \.self) { option in
                                            Text(option)
                                                .font(.K)
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                Button("Submit") {
                    handleSubmit()
                }
                .buttonStyle(NextButtonStyle())
                .padding()
            }
            .navigationTitle(surveyForm.title.replacingOccurrences(of: "\n", with: ""))
            .frame(width: .infinity, height: .infinity)
            .background(lightCream.opacity(0.25))
            .fullScreenCover(isPresented: $isPresenting, onDismiss: onDismiss) {
                AutofillView(questions: autoQuestions, userDatas: $userDatas, isPresenting: $isPresenting)
            }
            .onAppear {
                if matchedData != [] {
                    isPresenting = true
                }
            }
        }
    }
    
    func onDismiss() {
        
    }
    
    private func handleSubmit() {
        
        // Mark that the data sending to server belongs to USER
        userDatas.stuid = user.stuid
        // Process all responses
        for question in questions {
            if let response = responses[question.id]?.answer {
                print("\(question.title): \(response)")
                userDatas.responses.append(Response(id: question.id, answer: response))
                savedData.append(SavedResponse(q: question.title, a: response as! String))
            } else {
                print("\(question.title): No response")
                userDatas.responses.append(Response(id: question.id, answer: "-"))
                savedData.append(SavedResponse(q: question.title, a: "-"))
            }
        }
        print(userDatas)
    }
}

struct AnsTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.bottom, 5)
            .fontWeight(.light)
            .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(blue),
                    alignment: .bottom
                )
//            .frame(height: 50)
    }
}

#Preview {
    FormView()
        .font(.K)
}
