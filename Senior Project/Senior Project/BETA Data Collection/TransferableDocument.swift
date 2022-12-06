//
//  TransferableDocument.swift
//  Senior Project
//
//  Created by Michał Cieslik on 12/5/22.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct TransferableDocument: FileDocument, Transferable {

    @available(iOS 16.0, *)
    static var transferRepresentation: some TransferRepresentation
  {
      DataRepresentation(exportedContentType: .text) { log in
          log.convertToData()
      }
  }

  // tell the system to support only text
  static var readableContentTypes: [UTType] = [.text]

  // by default the document is empty
  var text = ""

  // this initializer creates a empty document
  init(initialText: String = "") {
      text = initialText
  }

  // this initializer loads data that has been saved previously
  init(configuration: ReadConfiguration) throws {
      if let data = configuration.file.regularFileContents {
          text = String(decoding: data, as: UTF8.self)
      }
  }

  // this will be called when the system wants to write the data to disk
  func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
      let data = Data(text.utf8)
      return FileWrapper(regularFileWithContents: data)
  }

  func convertToData() -> Data
  {
      return text.data(using: .ascii) ?? Data()
  }
}
