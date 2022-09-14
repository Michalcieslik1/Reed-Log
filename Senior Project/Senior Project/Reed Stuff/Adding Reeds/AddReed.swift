//
//  AddReed.swift
//  Senior Project
//
//  Created by Michał Cieslik on 9/13/22.
//

import SwiftUI

struct AddReed: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State var targetReedBox: String = ""
    @State var errorPopUpVisible: Bool = false
    @State var message: String = ""
    @State var title: String = ""
    @State var button: String = ""
    var stages = ["Blank", "Scraped Reed", "In Use", "Destroyed"]
    
    @State private var name: String = ""
    @State private var reedStage = 0
    
    @State private var caneType: String = ""
    @State private var caneDiameter: String = ""
    @State private var caneGouge: String = ""
    @State private var caneShape: String = ""
    
    @State var bottomLeft: Double = 0.0
    @State var bottomRight: Double = 0.0
    @State var leftL: Double = 0.0
    @State var leftM: Double = 0.0
    @State var leftR: Double = 0.0
    @State var rightL: Double = 0.0
    @State var rightM: Double = 0.0
    @State var rightR: Double = 0.0
    
    @State private var stapleType: String = ""
    @State private var stapleID: String = ""
    @State private var tieLength: String = ""
    @State private var threadColor: Color = .white
    
    @State private var userInputNote: String = ""
    
    var body: some View {
        ZStack{
            VStack{
                Form{
                    Section(header: Text("General")){
                        Picker("Reed Box", selection: $targetReedBox){
                            Text("Reed Boxes") //TODO: Choosing a reedbox for a reed
                        }
                        Picker("Reed Stage", selection: $reedStage){
                            Text("Blank").tag(0)
                            Text("Scraped Reed").tag(1)
                            Text("In Use").tag(2)
                            Text("Destroyed").tag(3)
                        }
                    }
                    Section(header: Text("Cane")){
                        TextField("Type", text: $caneType)
                        TextField("Diameter",text: $caneDiameter)
                            .keyboardType(.numberPad)
                        TextField("Gouge", text: $caneGouge)
                        TextField("Shape", text: $caneShape)
                        
                        ZStack{
                            Image("Cane Diagram")
                                .resizable()
                                .aspectRatio(CGSize(width:4, height: 3), contentMode: .fit)
                            HStack{
                                TextField("0", value: $bottomLeft, formatter: NumberFormatter())
                                    .textFieldStyle(.roundedBorder)
                                    .multilineTextAlignment(.center)
                                    .padding(15)
                                    .offset(x: -10)
                                VStack{
                                    TextField("0", value: $leftL, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: 25)
                                    TextField("0", value: $leftM, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                    TextField("0", value: $leftR, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: -25)
                                }
                                VStack{
                                    TextField("0", value: $rightL, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: 25)
                                    TextField("0", value: $rightM, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                    TextField("0", value: $rightR, formatter: NumberFormatter())
                                        .textFieldStyle(.roundedBorder)
                                        .multilineTextAlignment(.center)
                                        .padding(15)
                                        .offset(y: -25)
                                }
                                TextField("0", value: $bottomRight, formatter: NumberFormatter())
                                    .textFieldStyle(.roundedBorder)
                                    .multilineTextAlignment(.center)
                                    .padding(15)
                                    .offset(x: 10)
                            }
                        }
                    }
                    Section(header: Text("Tying Information")){
                        TextField("Staple Type", text: $stapleType)
                        TextField("Staple Number", text: $stapleID)
                        TextField("Tie Length", text: $tieLength)
                            .keyboardType(.numberPad)
                        ColorPicker("Thread Color", selection: $threadColor)
                    }
                }
                Button("Add Reed"){
                    addReed()
                    dismiss()
                }.buttonStyle(BorderedButtonStyle.bordered)
            }
            //Alert(title: Text(title), message:Text(message), dismissButton: .default(Text(button)))
            //Popup(show: $errorPopUpVisible, title: title, message: message, buttonText: button)
            //TODO: Alert
        }
        .navigationTitle("Add Reed")
    }
    
    func addReed(){
        guard let diameter = Double(caneDiameter) else{
            title = "Incorrect Input"
            message = "Diameter can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return
        }
        guard let tieLen = Double(tieLength) else{
            title = "Incorrect Input"
            message = "Tie Length can only be a number"
            button = "Ok"
            errorPopUpVisible.toggle()
            return
        }
        let newReed = Reed(context: moc)
        
        newReed.stapleID = stapleID
        newReed.id = UUID()
        newReed.date = Date.now
        newReed.reedStage = Int16(exactly: reedStage)!
        newReed.caneType = caneType
        newReed.caneDiameter = diameter
        newReed.caneGouge = Double(caneGouge)!
        newReed.caneShape = caneShape
        newReed.stapleType = stapleType
        newReed.threadColor = "TODO" //TODO: Colors to hex and vice versa
        newReed.tieLength = tieLen
        
        try? moc.save()
    }
}

struct AddReed_Previews: PreviewProvider {
    static var previews: some View {
        AddReed()
            //.environmentObject()
            
    }
}
