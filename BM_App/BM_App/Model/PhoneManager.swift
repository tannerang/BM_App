import Foundation
//import CoreLocation


protocol PhoneManagerDelegate {
    func didUpdatePhone1(_ phoneManager: PhoneManager, phone: PhoneModel)
    func didUpdatePhone2(_ phoneManager: PhoneManager, phone: PhoneModel)
    func didUpdatePhone3(_ phoneManager: PhoneManager, phone: PhoneModel)
    func didUpdatePhone4(_ phoneManager: PhoneManager, phone: PhoneModel)
    func didUpdatePhone5(_ phoneManager: PhoneManager, phone: PhoneModel)
    
    func didFailWithError(error: Error)
}



struct PhoneManager {
    
    var delegate: PhoneManagerDelegate?
    
    func fetchPhone(cityName: String){
        
        let urlString = "https://www.backmarket.com/bm/product/\(cityName)/best_offers?format=json"
        performRequest(with: urlString)
        print(urlString)
    }
    
    func performRequest(with urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let phone1 = self.parseJSON1(safeData) {
                        self.delegate?.didUpdatePhone1(self, phone: phone1)
                    }
                    if let phone2 = self.parseJSON2(safeData) {
                        self.delegate?.didUpdatePhone2(self, phone: phone2)
                    }
                    if let phone3 = self.parseJSON3(safeData) {
                        self.delegate?.didUpdatePhone3(self, phone: phone3)
                    }
                    if let phone4 = self.parseJSON4(safeData) {
                        self.delegate?.didUpdatePhone4(self, phone: phone4)
                    }
                    if let phone5 = self.parseJSON5(safeData) {
                        self.delegate?.didUpdatePhone5(self, phone: phone5)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON1(_ phoneData: Data) -> PhoneModel? {
        
        let decoder = JSONDecoder()
        
        do {
            //try:因為decoder會throws報錯
            let decodedData = try decoder.decode([PhoneData].self, from: phoneData)
            let id = decodedData[0].id
            let temp = decodedData[0].price_with_currency
            let name = decodedData[0].merchant.company
            let gradelevel = decodedData[0].grade
            print(id)
            print(temp)
            print(name)
            let phone1 = PhoneModel(conditionID: id, grade: gradelevel, company: name, price: temp)
            return phone1
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    func parseJSON2(_ phoneData: Data) -> PhoneModel? {
        
        let decoder = JSONDecoder()
        
        do {
            //try:因為decoder會throws報錯
            let decodedData = try decoder.decode([PhoneData].self, from: phoneData)
            let id = decodedData[1].id
            let temp = decodedData[1].price_with_currency
            let name = decodedData[1].merchant.company
            let gradelevel = decodedData[1].grade
            print(id)
            print(temp)
            print(name)
            let phone2 = PhoneModel(conditionID: id, grade: gradelevel, company: name, price: temp)
            return phone2
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    func parseJSON3(_ phoneData: Data) -> PhoneModel? {
        
        let decoder = JSONDecoder()
        
        do {
            //try:因為decoder會throws報錯
            let decodedData = try decoder.decode([PhoneData].self, from: phoneData)
            let id = decodedData[2].id
            let temp = decodedData[2].price_with_currency
            let name = decodedData[2].merchant.company
            let gradelevel = decodedData[2].grade
            print(id)
            print(temp)
            print(name)
            let phone3 = PhoneModel(conditionID: id, grade: gradelevel, company: name, price: temp)
            return phone3
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    func parseJSON4(_ phoneData: Data) -> PhoneModel? {
        
        let decoder = JSONDecoder()
        
        do {
            //try:因為decoder會throws報錯
            let decodedData = try decoder.decode([PhoneData].self, from: phoneData)
            let id = decodedData[3].id
            let temp = decodedData[3].price_with_currency
            let name = decodedData[3].merchant.company
            let gradelevel = decodedData[3].grade
            print(id)
            print(temp)
            print(name)
            let phone4 = PhoneModel(conditionID: id, grade: gradelevel, company: name, price: temp)
            return phone4
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    func parseJSON5(_ phoneData: Data) -> PhoneModel? {
        
        let decoder = JSONDecoder()
        
        do {
            //try:因為decoder會throws報錯
            let decodedData = try decoder.decode([PhoneData].self, from: phoneData)
            let id = decodedData[4].id
            let temp = decodedData[4].price_with_currency
            let name = decodedData[4].merchant.company
            let gradelevel = decodedData[4].grade
            print(id)
            print(temp)
            print(name)
            let phone5 = PhoneModel(conditionID: id, grade: gradelevel, company: name, price: temp)
            return phone5
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


/* func handle(data: Data?, response: URLResponse?, error: Error?){
 if error != nil{
 print("Error!")
 return
 }
 
 if let safeData = data{
 let dataString = String(data: safeData, encoding: .utf8)
 print(dataString)
 }
 }*/

