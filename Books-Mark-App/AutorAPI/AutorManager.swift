//
//  AutorManager.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/6/22.
//

import Foundation

protocol BookManagerDelegate2 {
    //funcion actualizacion de photo del dia
    func didUpdatePhotoDay2(_ BooksManager: BooksCateManager2, photoDay: BookCategoryModel2)
}

struct BooksCateManager2 {
    
        let openBook  = "https://openlibrary.org/authors"
    var delegate: BookManagerDelegate2?
    
    func fetchBook2(idAutor: String) {
        let urlString = "\(openBook)/\(idAutor).json" /// en este caso seran por ID de autor    OL23919A   //OL31727A
      ///  let urlString = "\(openBook)/\(categoria)/works.json" ///OL23919A   //OL31727A
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
                    if  let bookDay = self.parseJSON(bookDayData2: bookData) {
                        delegate?.didUpdatePhotoDay2(self, photoDay: bookDay)
                        
                    }
                }
            }
            //4. empezar la tarea
            task.resume()
        }
    }
    func parseJSON(bookDayData2: Data) -> BookCategoryModel2? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(BookCategoryData2.self, from: bookDayData2)
            
            let nombreApi = decodedData.personal_name
            let diaNacimiento = decodedData.birth_date
            let idAutor = decodedData.key
            let bioAutor = decodedData.bio
            let wikiAutor = decodedData.wikipedia
            
            let booksInformation = BookCategoryModel2(textPersonal_name: nombreApi, textBirth_date: diaNacimiento, textKey: idAutor, textBio: bioAutor, textWikipedia: wikiAutor)
            
    
            
            return booksInformation
            
        } catch {
            print(error)
            return nil
        }
    }
   
}
