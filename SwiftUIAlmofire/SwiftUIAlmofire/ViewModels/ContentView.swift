//
//  ContentView.swift
//  SwiftUIAlmofire
//
//  Created by Satish Sharma on 20/08/20.
//  Copyright © 2020 Satish Sharma. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

// MARK: ViewModel ContentView
struct ContentView: View {
    @ObservedObject var obs = Observer()
    
    var body: some View {
        NavigationView {
            List(obs.datas) { i in
                CardView(name: i.login, url: i.avatar_url)
                   }
                   .navigationBarTitle("SwiftUI : MVVM : Parser")
               }
    }
    
}

// MARK: View ContentView_Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Observer
class Observer: ObservableObject {
    @Published var datas = [CardModel]()
    
    init() {
        
        if !Connectivity.isConnectedToInternet() {
               print("internet is not available.")
               // do some tasks..
            return;
        }
        
        // MARK: Network Call
        //-----------------GET Call----------------------
        //pass model to the network call - get call
        NetworkManager(data: [:], url: nil, service: .orgs, method: .get, isJSONRequest: false).executeQuery(){

                  (result: Result<[CardModel],Error>) in
                  switch result{
                  case .success(let response):
                      print(response)
                      self.datas = response;
                  case .failure(let error):
                      print(error)
                    
            }
        }
        //-----------------------------------------------------
 

        
        //0 represant number of indexs
        //1 represant json data of each indexes
        /*
        AF.request("https://api.github.com/users/hadley/orgs", method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in

           // debugPrint("Response: \(response)")
                switch response.result {
                case .success:
                    print("Validation Successful")

                    let json = try! JSON(data: response.data!)
                    for i in json {
//                        print(i.0)
//                        print(i.1)
                        self.datas.append(CardModel(id: i.1["id"].intValue, name: i.1["login"].stringValue, url: i.1["avatar_url"].stringValue))
                    }

                case let .failure(error):
                    print(error)
                }
        }
 */
        
        //-----------------POST Call----------------------
        /*
        let body: [String : Any] = ["title": "foo",
        "body": "bar",
        "userId": 1]
               //pass model to the network call - get call
             NetworkManager(data: body, url: nil, service: .posts, method: .get).executeQuery(){
                         (result: Result<[CardModel],Error>) in
                         switch result{
                         case .success(let response):
                             print(response)
                             self.datas = response;
                         case .failure(let error):
                             print(error)
                         }
                   
               }
 
 */
        /*
        NetworkCall(data: ["email":"peter@klaven"], url: "https://api.github.com/", method: .post, isJSONRequest: false).executeQuery(){
            (result: Result<Post,Error>) in
            switch result{
            case .success(let post):
                print(post)
            case .failure(let error):
                print(error)
            }
        }
        */
        /*
        NetworkCall(data: ["username":"sahil.manchanda2@gmail.com"], headers: ["custom-header-key" : "custom-header-value"], url: "https://api.github.com/",  method: .post).executeQuery(){(result: Result<String,Error>) in
            switch result{
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }*/
        //---------------------------------------
        
    }
}

