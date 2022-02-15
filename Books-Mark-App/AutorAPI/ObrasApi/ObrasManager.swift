//
//  ObrasManager.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/7/22.
//

import Foundation

protocol BookManagerDelegate3 {
    //funcion actualizacion de photo del dia
    func didUpdatePhotoDay(_ BooksManager: BooksCateManager3, photoDay: BookCategoryModel3)
}
struct BooksCateManager3 {
        let obrasBook = "https://openlibrary.org/authors"
        var delegate: BookManagerDelegate3?
    func fetchBook(idAutor: String) {
        let urlString = "\(obrasBook)/\(idAutor)/works.json?offset=50" /// en este caso seran por ID de autor    OL23919A   //OL31727A
       perfomRequest(urlString: urlString)}
    func perfomRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error)
                in
                if error != nil{
                    print(error)
                    return
                }
                if let bookData = data {
                    if  let bookDay = self.parseJSON(bookDayData: bookData) {
                        delegate?.didUpdatePhotoDay(self, photoDay: bookDay)
            }}}
            task.resume()
        }}
    func parseJSON(bookDayData: Data) -> BookCategoryModel3? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BookCategoryData3.self, from: bookDayData)
            
            let tituloApi = decodedData.entries[0].title
            
            let tituloLibro2 = decodedData.entries[1].title
            let tituloLibro3 = decodedData.entries[2].title
            let tituloLibro4 = decodedData.entries[3].title
            let tituloLibro5 = decodedData.entries[4].title
            let tituloLibro6 = decodedData.entries[5].title
            let tituloLibro7 = decodedData.entries[6].title
            let tituloLibro8 = decodedData.entries[7].title
            let tituloLibro9 = decodedData.entries[8].title
            let tituloLibro10 = decodedData.entries[9].title
            
            let booksInformation = BookCategoryModel3(textTitle: tituloApi, textTitle2: tituloLibro2, textTitle3: tituloLibro3, textTitle4: tituloLibro4, textTitle5: tituloLibro5, textTitle6: tituloLibro6, textTitle7: tituloLibro7, textTitle8: tituloLibro8, textTitle9: tituloLibro9, textTitle10: tituloLibro10)
            return booksInformation
        } catch {
            print(error)
            return nil
        }}}
