//
//  MotherTongueView.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 21.10.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import SwiftUI

struct NativeLanguageSelectView: View {
        
    @State private var selectedLanguage = Locale.current.localizedString(forLanguageCode: Locale.current.language.languageCode?.identifier ?? "en") ?? "Unknown"
    @State private var isPickerHidden = false
    
    let languages: [String] = Array(Set(Locale.availableIdentifiers
        .compactMap { identifier -> String? in
            let locale = Locale(identifier: identifier)
            if let languageCode = locale.language.languageCode?.identifier {
                return Locale(identifier: languageCode).localizedString(forLanguageCode: languageCode)
            }
            return nil
        })
    ).sorted()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "globe")
                .font(.system(size: 50.0))
                .imageScale(.large)
                .foregroundColor(.blue)
            
            Text("What is your native language?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("This allows us to offer translations for the words you choose to learn. Please note that translations for certain languages may be subject to availability.\n\nPrimary language can later be changed in settings")
                .padding()
            
                        
            Picker(selection: $selectedLanguage, label: Text(Locale.current.localizedString(forLanguageCode: selectedLanguage) ?? "Select")) {
                ForEach(languages, id: \.self) { language in
                    Text(Locale.current.localizedString(forLanguageCode: language) ?? language)
                        .tag(language)
                }
            }
            .labelsHidden()
            .pickerStyle(MenuPickerStyle())
            .onSubmit({
                print(selectedLanguage)
            })
            
            Spacer()
            
            Button(action: {
                print("Proceeded")
            }, label: {
                Text("Proceed")
                    .mainBottomButtonLabelStyle()
            })
            .mainBottomButtonStyle()
        }
    }
}
