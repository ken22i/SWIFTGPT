//
//  ContentView.swift
//  SwiftGPT
//
//  Created by mbabicz on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = GPTViewModel()
    @State private var gptLogo: UIImage? // 用於存儲 GPT 的 logo 圖片
    @State private var personIcon: UIImage? // 用於存儲 person icon 圖片
    @State private var showImagePicker: Bool = false // 用於控制是否顯示圖片選擇器
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary // 選擇圖片的來源

    var body: some View {
        NavigationView {
            TabView {
                ChatGPTView().tabItem {
                    Label("CHAT BOT", systemImage: "ellipses.bubble")
                }
                DalleView().tabItem {
                    Label("DALL-E 2", systemImage: "paintbrush")
                }
                PromptSelectionView(viewModel: viewModel).tabItem {
                    Label("Set Prompt", systemImage: "text.cursor")
                }
                VStack {
                    // 用戶圖片上傳按鈕
                    Button(action: {
                        imagePickerSourceType = .photoLibrary
                        showImagePicker = true
                    }) {
                        Text("Upload Image")
                    }
                    .padding()

                    // GPT logo 圖片選擇器
                    // GPT logo 圖片選擇器
                    if let gptLogo = gptLogo {
                        Image(uiImage: gptLogo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    Button(action: {
                        imagePickerSourceType = .photoLibrary
                        showImagePicker = true
                    }) {
                        Text("Change GPT Logo")
                    }
                    .padding()

                    // person icon 圖片選擇器
                    if let personIcon = personIcon {
                        Image(uiImage: personIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    Button(action: {
                        imagePickerSourceType = .photoLibrary
                        showImagePicker = true
                    }) {
                        Text("Change Person Icon")
                    }
                    .padding()
                }
                .tabItem {
                    Label("Upload & Change", systemImage: "square.and.arrow.up")
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: imagePickerSourceType, selectedImage: imagePickerSourceType == .photoLibrary ? $gptLogo : $personIcon)
        }
        .environmentObject(viewModel)
    }
}



