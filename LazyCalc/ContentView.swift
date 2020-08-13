//
//  ContentView.swift
//  LazyCalc
//
//  Created by Дмитрий on 10.07.2020.
//  Copyright © 2020 Дмитрий. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var textFeild1 = ""
    var result: String{
        get{
            if textFeild1 == ""{
                return ""
            }
            let textTrimming = textFeild1.trimmingCharacters(in: [" ", "\t", "\n", "\r"])
            if let number = Int(textTrimming){
                return String(number)
                
            }
            if let number = Double(textTrimming){
                return String(format:"%.2f", number)
                
            }
            if containsOperators(text: textTrimming){
                do {
                    try ObjC.catchException {
                        
                        let exp: NSExpression = NSExpression(format: textTrimming)
                        if let result =  exp.expressionValue(with:nil, context: nil) as? Double{
                            print(result)
                        }
                    }
                } catch {
                    print("Into the catch.....")
                    // Handle error here
                    return ""
                }
                let exp: NSExpression = NSExpression(format: textTrimming)
                if let result =  exp.expressionValue(with:nil, context: nil) as? Double{
                    return String(result)
                }
                
            }
            return ""
        }
        
    }
    
    enum Operators: String{
        case minus = "-"
        case plus = "+"
        case multiplication = "*"
        case division = "/"
        case function = ":"
        case leftBracket = "("
        case rightBracket = ")"
        
        static var allCases: [Operators] {
            return [.minus, .plus, .multiplication, .division, .function, .leftBracket, .rightBracket]
        }
    }
    
    func containsOperators(text: String) -> Bool{
        for op in Operators.allCases{
            if text.contains(op.rawValue){
                return true
            }
        }
        return false
    }
    
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                VStack{
                    TextField("Example 1", text: self.$textFeild1)
                        .foregroundColor(.white)
                        //.background(Color.white)
                        .font(.body)
                        .padding()
                        .padding(.top, 40)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                    Text("\(self.result)")
                        .foregroundColor(.green)
                        .frame(width: geo.size.width - 20, alignment: .trailing)
                        .padding(.trailing)
                        
                }
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
            .background(Color(red: 0.14, green: 0.15, blue: 0.17, opacity: 1))
            .blendMode(.normal)
            
        }
            .edgesIgnoringSafeArea(.all)
            .colorScheme(.dark)
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
