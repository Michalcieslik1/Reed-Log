//
//  Centered.swift
//  Senior Project
//
//  Created by Michał Cieslik on 10/1/22.
//

import Foundation
import SwiftUI

extension View{
    func centerHorizontally() -> some View{
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
}
