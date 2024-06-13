//
//  AddMyListScreen.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/20/24.
//

import SwiftUI

struct AddMyListScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var color: Color = .blue
    @State private var listName: String = ""
    
    var myList: MyList? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(color)
            
            TextField("List name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 44)
            
            ColorPickerView(selectedColor: $color)
        }
        .onAppear(perform: {
            if let myList {
                listName = myList.name
                color = Color(hex: myList.colorCode)
            }
        })
        .navigationTitle(myList == nil ? "New List": "Edit List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    
                    if let myList {
                        myList.name = listName
                        myList.colorCode = color.toHex() ?? ""
                    } else {
                        guard let hex = color.toHex() else { return }
                        let myList = MyList(name: listName, colorCode: hex)
                        context.insert(myList)
                    }
                   
                    dismiss() 
                }
            }
        }
    }
}

#Preview { @MainActor in
    NavigationStack {
        AddMyListScreen()
    }.modelContainer(previewContainer)
}
