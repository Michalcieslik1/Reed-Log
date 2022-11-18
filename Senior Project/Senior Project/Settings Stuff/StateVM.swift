//
//  StateVM.swift
//  Senior Project
//
//  Created by Michał Cieslik on 11/15/22.
//

import Foundation
import CoreData
import SwiftUI

class StateVM: NSObject, ObservableObject, NSFetchedResultsControllerDelegate{
    private (set) var context: NSManagedObjectContext
    @Published var state = AppState()
    
    private let noteFetchedResultsController: NSFetchedResultsController<AppState>
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        noteFetchedResultsController = NSFetchedResultsController(fetchRequest: AppState.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        noteFetchedResultsController.delegate = self
        
        do{
            try noteFetchedResultsController.performFetch()
            guard let states = noteFetchedResultsController.fetchedObjects else {
                return
            }
            
            if states.count == 0 {
                state = AppState(context: context)
                state.destroyedReeds = ReedBox(context: context)
                state.destroyedReeds?.hidden = true
                state.standardReed = Reed(context: context)
                state.standardReed?.id = UUID()
                state.standardReed?.reedBox = state.destroyedReeds
            } else{
                self.state = states[0]
            }
            print(self.state)
        } catch {
            print(error)
        }
        
        //if state == nil{
            
        //}
    }
}
