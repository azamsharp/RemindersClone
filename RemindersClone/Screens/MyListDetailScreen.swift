//
//  MyListDetailScreen.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/22/24.
//

import SwiftUI
import SwiftData

struct MyListDetailScreen: View {
    
    let myList: MyList
    @Query private var reminders: [Reminder]
    
    @State private var title: String = ""
    @State private var isNewReminderPresented: Bool = false
    
    @State private var selectedReminder: Reminder?
    @State private var showReminderEditScreen: Bool = false
     
    @Environment(\.modelContext) private var context
     
    init(myList: MyList) {
        
        self.myList = myList
        
        let listId = myList.persistentModelID
        
        let predicate = #Predicate<Reminder> { reminder in
            reminder.list?.persistentModelID == listId
            && !reminder.isCompleted
        }
        
        _reminders = Query(filter: predicate)
    }
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }
    
    private func saveReminder() {
        let reminder = Reminder(title: title)
        myList.reminders?.append(reminder)
    }
    
    private func isReminderSelected(_ reminder: Reminder) -> Bool {
        reminder.persistentModelID == selectedReminder?.persistentModelID
    }
    
    private func deleteReminder(_ indexSet: IndexSet) {
        guard let index = indexSet.last else { return }
        guard let reminder = myList.reminders?[index] else { return }
        
        context.delete(reminder)
    }
    
    var body: some View {
        VStack {
              
            ReminderListView(reminders: reminders)
            
            Spacer()
            Button(action: {
                isNewReminderPresented = true
            }, label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }.alert("New Reminder", isPresented: $isNewReminderPresented) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) { }
            Button("Done") {
                if isFormValid {
                    saveReminder()
                    title = ""
                }
            }
        }
        .navigationTitle(myList.name)
        .sheet(isPresented: $showReminderEditScreen, content: {
            if let selectedReminder {
                NavigationStack {
                    ReminderEditScreen(reminder: selectedReminder)
                }
            }
        })
    }
}

struct MyListDetailScreenContainer: View {
    
    @Query private var myLists: [MyList]
    
    var body: some View {
        MyListDetailScreen(myList: myLists[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListDetailScreenContainer()
    }.modelContainer(previewContainer)
}
