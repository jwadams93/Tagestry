//
//  ContentView.swift
//  Tagestry
//
//  Created by Jake Adams on 11/25/25.
//

import CoreData
import PhotosUI
import SwiftUI

struct PhotosView: View {

    @State var detail: Int? = nil

    var body: some View {
        ZStack {
            photoGrid
                .opacity(detail == nil ? 1 : 0)
            detailView
            Button("Add Photos", systemImage: "plus", action: addPhotos)
                .labelStyle(.iconOnly)
                .buttonBorderShape(.circle)
                .buttonStyle(.glass)
                .buttonSizing(.automatic)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .animation(.default, value: detail)
    }

    @ViewBuilder
    var detailView: some View {
        if let d = detail {
            Image(" \(d)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    detail = nil
                }
        }
    }
    
    func addPhotos() {
        
    }

    @ViewBuilder
    var photoGrid: some View {
        ScrollView {
            LazyVGrid(columns: [
                .init(.adaptive(minimum: 100, maximum: .infinity), spacing: 3)
            ]) {
                ForEach(1..<15) { ix in
                    Image(" \(ix)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: .infinity
                        )
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            detail = ix
                        }
                }
            }
        }
    }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)
        ],
        animation: .default
    )
    private var items: FetchedResults<Item>

    var body: some View {
        PhotosView().frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func addItem() {
        //        withAnimation {
        //            let newItem = Item(context: viewContext)
        //            newItem.timestamp = Date()
        //
        //            do {
        //                try viewContext.save()
        //            } catch {
        //                // Replace this implementation with code to handle the error appropriately.
        //                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        //                let nsError = error as NSError
        //                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        //            }
        //        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(
        \.managedObjectContext,
        PersistenceController.preview.container.viewContext
    )
}
