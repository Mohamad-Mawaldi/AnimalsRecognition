//
//  ContentView.swift
//  AnimalsRecognition
//
//  Created by mohamad on 2023-10-17.
//

import SwiftUI

struct ContentView: View {
    
    @State var animalType = "Click one of the alternatives to identify the animal"
    @State var certaintyPercentage = ""

    let domodel = DoModel()
    
    func displayRecognitionResult(from recognitionOutput: MobileNetOutput?) {
        if (recognitionOutput != nil) {
            animalType = recognitionOutput!.classLabel
            certaintyPercentage = String(recognitionOutput!.classLabelProbs[recognitionOutput!.classLabel]!)
        }
    }
    
    var body: some View {
        VStack(spacing: 100) {
            
            HStack{
                
                VStack(spacing: 20) {
                    Image("cat")
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        let output = domodel.doImage(from: UIImage(named: "cat")!)
                        displayRecognitionResult(from: output)
                    }) {
                        Text("Identify animal")
                    }
                }

                Spacer()
    
                VStack(spacing: 20) {
                    Image("seal")
                        .resizable()
                        .scaledToFit()
                    
                    Button(action: {
                        let output = domodel.doImage(from: UIImage(named: "seal")!)
                        displayRecognitionResult(from: output)
                        
                    }) {
                        Text("Identify animal")
                    }
                }
            }
                        
            VStack(spacing: 20) {
                Text(animalType)
                Text(certaintyPercentage)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
