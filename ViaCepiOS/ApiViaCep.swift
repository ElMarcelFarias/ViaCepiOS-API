
import Foundation

class ApiViaCep{
    class func viaCepRequest(_ cep: String, _ complition: @escaping (CepModel) -> Void)  {
    guard let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") else { return }
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    return
                }
                do {
                    let cep = try JSONDecoder().decode(CepModel.self, from: data)
                    complition(cep)
                } catch {
                    
                }
                
                
            } else {
                print(error!.localizedDescription)
            }
            
        }
        task.resume()
    }
   
}


