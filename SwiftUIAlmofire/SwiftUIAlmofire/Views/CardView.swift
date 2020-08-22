//
//  CardView.swift
//  SwiftUIAlmofire
//
//  Created by Satish Sharma on 20/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: View CardView
struct CardView: View {
    
    var name: String
    var url: String
    

    var body: some View {
        
        HStack {
            AnimatedImage(url: URL(string: url)!)
                      .resizable()
                      .frame(width: 60, height: 60)
                      .clipShape(Circle())
                      .shadow(radius: 20)
                      
            VStack(alignment: .leading) {
                Text(name).fontWeight(.heavy)
            }
        }
       
    }
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
