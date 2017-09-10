//
//  BanksData.swift
//  Space Bank
//
//  Created by Tanya Tomchuk on 08/09/2017.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import Foundation

final class NetworkManager {
    let banksDataURL = "http://pub.prostream.ru/partners.json"
    
    static let shared = NetworkManager()
    
    var banks = [BanksData]()
    
    func getBanks(completionHandler: @escaping (_ banks: [BanksData]) -> Void) {
        
        let request = URLRequest(url: URL(string: banksDataURL)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request, completionHandler:  { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            //Parsing
            if let data = data {
                let banks = self.parseJsonBanks(data)
                completionHandler(banks)
                
                // Тут проверила что статус 200 - все ок
                let response = response as? HTTPURLResponse
                let code = response?.statusCode
                print(code ?? "Can not define response code")
            }
            
        })
        task.resume()
    }
    
    func parseJsonBanks(_ data: Data) -> [BanksData] {
        var newBanks:[BanksData] = []
        do {
            if let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
            
            //Pars JSON Data
            let banks = jsonResult["items"] as? [[String: Any]]
            for jsonBank in banks! {
                let bank = BanksData()
                print("\(jsonBank)")
                bank.name = (jsonBank["title"] as? String)!
                bank.address = (jsonBank["address"]  as? String)!
                bank.schedule = (jsonBank["schedule"] as? String)!
                
                newBanks.append(bank)
            }
            }
        } catch {
            print(error)
        }
        return newBanks
    }
}
