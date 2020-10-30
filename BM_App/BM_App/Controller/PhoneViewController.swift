import UIKit
import CoreLocation

class PhoneViewController: UIViewController {
    
    @IBOutlet weak var priceLabel1: UILabel!
    @IBOutlet weak var companyLabel1: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var companyLabel2: UILabel!
    @IBOutlet weak var companyLabel3: UILabel!
    @IBOutlet weak var companyLabel4: UILabel!
    @IBOutlet weak var companyLabel5: UILabel!
    @IBOutlet weak var priceLabel2: UILabel!
    @IBOutlet weak var priceLabel3: UILabel!
    @IBOutlet weak var priceLabel4: UILabel!
    @IBOutlet weak var priceLabel5: UILabel!
    
    var phoneManager = PhoneManager()
//    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        locationManager.delegate = self
//
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()
//
        //常忘記打這行！有了這行和下面那行，就能應用Delegate
        phoneManager.delegate = self
        searchTextField.delegate = self
        
    }
    
//    @IBAction func locationPressed(_ sender: UIButton) {
//        locationManager.requestLocation()
//
//
//
//    }
}

//MARK: - UITextFieldDelegate

extension PhoneViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print("pressed")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true}
        else{
            textField.placeholder = "Type Something"
            return false
        }
        //用在當使用者點選其他地方時是否需要endediting
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let phoneID = searchTextField.text{
            phoneManager.fetchPhone(cityName: phoneID)
        }
        searchTextField.text = ""
    }
    
}

//MARK: - PhoneManagerDelegate

extension PhoneViewController: PhoneManagerDelegate {

    //有了這行和上面那行，就能應用Delegate
    func didUpdatePhone1(_ phoneManager: PhoneManager, phone: PhoneModel) {
        DispatchQueue.main.async {
            self.priceLabel1.text = phone.price
            self.companyLabel1.text = phone.company
//            self.conditionImageView.image = UIImage(systemName: phone.conditionName)

        }
    }
    
    func didUpdatePhone2(_ phoneManager: PhoneManager, phone: PhoneModel) {
        DispatchQueue.main.async {
            self.priceLabel2.text = phone.price
            self.companyLabel2.text = phone.company
//            self.conditionImageView.image = UIImage(systemName: phone.conditionName)

        }
    }

    func didUpdatePhone3(_ phoneManager: PhoneManager, phone: PhoneModel) {
        DispatchQueue.main.async {
            self.priceLabel3.text = phone.price
            self.companyLabel3.text = phone.company
//            self.conditionImageView.image = UIImage(systemName: phone.conditionName)

        }
    }

    func didUpdatePhone4(_ phoneManager: PhoneManager, phone: PhoneModel) {
        DispatchQueue.main.async {
            self.priceLabel4.text = phone.price
            self.companyLabel4.text = phone.company
//            self.conditionImageView.image = UIImage(systemName: phone.conditionName)

        }
    }
    
    func didUpdatePhone5(_ phoneManager: PhoneManager, phone: PhoneModel) {
        DispatchQueue.main.async {
            self.priceLabel5.text = phone.price
            self.companyLabel5.text = phone.company
//            self.conditionImageView.image = UIImage(systemName: phone.conditionName)

        }
    }
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate
//
//extension PhoneViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last{
//            locationManager.stopUpdatingLocation()
//            let lat = location.coordinate.latitude
//            let lon = location.coordinate.longitude
//            phoneManager.fetchWeather(latitude: lat, longitude: lon)
//        }
//        print("got location")
//        print([locations])
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("error2")
//    }
//}
