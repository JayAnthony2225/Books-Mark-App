//
//  BookManager.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/5/22.
//
import Foundation

protocol BookManagerDelegate {
    //funcion actualizacion de photo del dia
    func didUpdatePhotoDay(_ BooksManager: BooksCateManager, photoDay: BookCategoryModel)
}

struct BooksCateManager {
    // variable de Url - Api de la Nasa
      let openBook = "https://openlibrary.org/subjects"
    var delegate: BookManagerDelegate?
    
    func fetchBook(categoria: String) {
        let urlString = "\(openBook)/\(categoria).json"
       perfomRequest(urlString: urlString)
    }
    
    func perfomRequest(urlString: String) {
        // Hacemos los 4 pasos
        
        //1.Crear un URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            //3. Darle la session una tarea
            let task = session.dataTask(with: url) {(data, response, error)
                in
                if error != nil{
                    print(error)
                    return
                }
                if let bookData = data {
                    if  let bookDay = self.parseJSON(bookDayData: bookData) {
                        delegate?.didUpdatePhotoDay(self, photoDay: bookDay)
                        
                    }
                }
            }
            //4. empezar la tarea
            task.resume()
        }
    }
    
    
    
    func parseJSON(bookDayData: Data) -> BookCategoryModel? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(BookCategoryData.self, from: bookDayData)
            
        
            let nombreApi = decodedData.name
            let tituloLibro1 = decodedData.works[0].title
            let tituloLibro2 = decodedData.works[1].title
            let tituloLibro3 = decodedData.works[2].title
            let tituloLibro4 = decodedData.works[3].title
            let tituloLibro5 = decodedData.works[4].title
            let tituloLibro6 = decodedData.works[5].title
            let tituloLibro7 = decodedData.works[6].title
            let tituloLibro8 = decodedData.works[7].title
            let tituloLibro9 = decodedData.works[8].title
            let tituloLibro10 = decodedData.works[9].title
            
            let booksInformation = BookCategoryModel(name: nombreApi, title1: tituloLibro1, title2: tituloLibro2, title3: tituloLibro3, title4: tituloLibro4, title5: tituloLibro5, title6: tituloLibro6, title7: tituloLibro7, title8: tituloLibro8, title9: tituloLibro9, title10: tituloLibro10)
                
            print(decodedData.name)
            print(decodedData.works[0].title)
            print(decodedData.works[2].title)
            print(decodedData.works[3].title)
            print(decodedData.works[4].title)
            
            return booksInformation
            
            
           // print(decodedData.explanation)
           // print(tittleApi)
           
           // print(decodedData.url)
            
            
        } catch {
            print(error)
            return nil
        }
    }
   
}
