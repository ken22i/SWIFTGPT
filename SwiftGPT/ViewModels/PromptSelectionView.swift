//
//  PromptSelectionView.swift
//  SwiftGPT
//
//  Created by 訪客使用者 on 2024/5/27.
//

import SwiftUI

struct PromptSelectionView: View {
    @ObservedObject var viewModel: GPTViewModel
    @State private var newPrompt: String = ""

    var body: some View {
        VStack {
            TextField("Enter new prompt", text: $newPrompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Set Prompt") {
                viewModel.prompt = newPrompt
                newPrompt = ""
            }
            .padding()
        }
    }
}

