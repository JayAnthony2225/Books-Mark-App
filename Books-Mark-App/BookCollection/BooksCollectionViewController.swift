//
//  BooksCollectionViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/25/22.
//ver1
/*
import UIKit

class BooksCollectionViewController: UIViewController {

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var dataSource : BookObject?
    
    
    var libreriaCollectionView : UICollectionView = {
        
        let bookLayout = UICollectionViewFlowLayout()
        bookLayout.scrollDirection = .horizontal
        bookLayout.minimumLineSpacing = 20
        bookLayout.minimumInteritemSpacing = 20
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: bookLayout)
        collection.register(BooksCollectionCell.self, forCellWithReuseIdentifier: "bookcell")
        collection.isPagingEnabled = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear // esto es el frame de el collection , .RED
        collection.showsVerticalScrollIndicator = true
        collection.showsHorizontalScrollIndicator = true
        return collection
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear //green - esto es toda la pantalla
        initUI()
        getData()
    }
    
    
    func initUI(){
        
        libreriaCollectionView.delegate = self
        libreriaCollectionView.dataSource = self
        view.addSubview(libreriaCollectionView)
        //libreriaCollectionView.addAnchorsWithMargin(20)
       libreriaCollectionView.addAnchorsAndSize(width: nil, height: height / 4, left: 0, top: 150, right: 20, bottom: 200)
        
    }
    
    
    func getData(){
        
        let libroCohello = Libro(tituloLibro: "El alquimista", autor: "Paulo Coelho", category: "Drama", precio: 350.00, rate: "4estrellas", portadaImage: "alquimistaImage", descripcion: "libro recomendado para lecturas de autosuperacion", autorFoto: "coelhoFoto", autorInfo: "Es uno de los escritores y novelistas más leídos del mundo con más de 320 millones de libros vendidos.")
        let cienSoledad = Libro(tituloLibro: "Cien años de soledad", autor: "Garcia Marquez", category: "Drama", precio: 590.0, rate: "5estrellas", portadaImage: "cienImage", descripcion: "best seller de Gacia Marquez", autorFoto: "marquezFoto", autorInfo: "Reconocido principalmente por sus novelas y cuentos, muere el 17 de abril de 2014, Ciudad de México")
        let casaEspiritus = Libro(tituloLibro: "La casa de los espiritus", autor: "Isabel Allende", category: "Drama", precio: 370.0 , rate: "5estrellas", portadaImage: "espiritusImage", descripcion: "Unos de los titulos mas galardonados de Isabel ", autorFoto: "isabelFoto", autorInfo: "Escritora chilena con nacionalidad estadounidense, Premio Nacional de Literatura de su país en 2010.")
        let once = Libro(tituloLibro: "Once minutos", autor: "Paulo Coelho", category: "Drama", precio: 350.0, rate: "4estrellas", portadaImage: "onceImage", descripcion: "Relata la vida de Maria en una aldea remota de Brasil",autorFoto: "coelhoFoto", autorInfo: "Es uno de los escritores y novelistas más leídos del mundo con más de 320 millones de libros vendidos en más de 170 países, traducidos a 83 lenguas.")
       
        let dramaBooks = Categoria(categoriaName: "High Rated", librosInfo: [libroCohello, cienSoledad, casaEspiritus, once])
//MARK: Categoria Terror --------------
        let baldor = Libro(tituloLibro: "Algebra de Baldor", autor: "Baldor", category: "Terror", precio: 700.0, rate: "nuevo", portadaImage: "baldorImage", descripcion: "libro para aprender algebra", autorFoto: "baldorFoto", autorInfo: "Aurelio Baldor fue Matemático, profesor, escritor y abogado cubano, autor del libro Álgebra de Baldor, ​ publicado en 1941")
        let control = Libro(tituloLibro: "Ing. control Moderno", autor: "K. Ogata", category: "Terror", precio: 300.0, rate: "nuevo", portadaImage: "ogataImage", descripcion: "Introduccion a los sistemas de control", autorFoto: "ogataFoto", autorInfo: "Katsuhiko Ogata es un profesor de ingeniería que nació en Tokio, Japón; el 6 de enero de 1925.")
        
        let terrorBooks = Categoria(categoriaName: "Just added", librosInfo: [baldor, control])
        
//MARK: Categoria Historica Ficcion --------------
        let bodega = Libro(tituloLibro: "La Bodega", autor: "Noah Gordon", category: "Ficcion Historica", precio: 600.0, rate: "5estrellas", portadaImage: "bodegaImage", descripcion: "La carta de amor de Godon a España y su vides", autorFoto: "noahFoto", autorInfo: "Escritor estadounidense de novelas que se han convertido en superventas. Nacimiento: 11 de noviembre de 1926, Worcester, Massachusetts")
        let medico = Libro(tituloLibro: "El Medico", autor: "Noah Gordon", category: "Ficcion Historica", precio: 750.0, rate: "5estrellas", portadaImage: "medicoImage", descripcion: "Dramatica historia de la formacion de un erudito Medico",autorFoto: "noahFoto", autorInfo: "Escritor estadounidense de novelas que se han convertido en superventas. Nacimiento: 11 de noviembre de 1926, Worcester, Massachusetts")
        let comite = Libro(tituloLibro: "El comite de la muerte", autor: "Noah Gordon", category: "Ficcion Historica", precio: 500.0, rate: "nuevo", portadaImage: "comiteImage", descripcion: "Tres medicos compiten para ser el mejor",autorFoto: "noahFoto", autorInfo: "Escritor estadounidense de novelas que se han convertido en superventas. Nacimiento: 11 de noviembre de 1926, Worcester, Massachusetts")
        
        let historicobooks = Categoria(categoriaName: "Best Seller", librosInfo: [bodega, medico, comite])
//MARK: Book Obj data Source --------------
        let populares = BookObject(bookCategorias: [historicobooks, terrorBooks, dramaBooks], cateTitle: "Populares categoria title")
        
        dataSource = populares
 
 //       inventarioCollectionView.reloadData()
    }
}


extension BooksCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.bookCategorias?[section].librosInfo?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bookCell = libreriaCollectionView.dequeueReusableCell(withReuseIdentifier: "bookcell", for: indexPath) as! BooksCollectionCell
        
        let libro = dataSource?.bookCategorias?[indexPath.section].librosInfo?[indexPath.item]
        
       bookCell.setData(libro: libro!)
        return bookCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: width / 2 - 40, height: height / 4)
      //  return ((indexPath.item % 2) != 0) ? CGSize(width: width / 2 - 40, height: height / 4) : CGSize(width: width / 2 - 40, height: height / 5)
    }

}
*/


