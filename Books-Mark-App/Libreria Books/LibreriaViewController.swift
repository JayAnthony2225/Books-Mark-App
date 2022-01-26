//
//  LibreriaViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/22/22.
//

import UIKit

class LibreriaViewController : UIViewController {
    
    var bookTableView : UITableView?
    var backButton : UIButton?
    var holaLabel : UILabel?
    var nombreLabel : UILabel?
    var masPolular : UILabel?
    var collectionBook : UIImageView? //UICollectionView?
    var backgroundBook : UIImageView?
    var librosButton : UIButton?
    var categoriasButton :UIButton?
    var autoresButton : UIButton?
    
    var dataSource : BookObject?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var darkBlueTextColor = UIColor(displayP3Red: 27/255, green: 38/255, blue: 44/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 15/255, green: 76/255, blue: 117/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 50/255, green: 130/255, blue: 184/255, alpha: 1)
    var whiteTextColor = UIColor(displayP3Red: 187/255, green: 225/255, blue: 250/255, alpha: 1)
    
  // NUEVA VARIABLE
    
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
        view.backgroundColor = darkBlueTextColor
        
        initUI()
    }
    
    func initUI(){
        
        // INIT COLLECTION
        
        libreriaCollectionView.delegate = self
        libreriaCollectionView.dataSource = self
        view.addSubview(libreriaCollectionView)
        //libreriaCollectionView.addAnchorsWithMargin(20)
        libreriaCollectionView.addAnchorsAndSize(width: width , height: height / 4, left: 10, top: 150, right: 10, bottom: 350)
        
        
    //INIT ELEMENTOS
        
        bookTableView = UITableView(frame: CGRect(x: 10, y: 400, width: width - 20, height: height/2))
        bookTableView?.backgroundColor = darkBlueTextColor
        bookTableView?.delegate = self
        bookTableView?.dataSource = self
        view.addSubview(bookTableView!)
        
        getData()
        
                                                        //x 0 , y 0
        backgroundBook = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
        backgroundBook?.image = UIImage(named:"backImage1")
        backgroundBook?.layer.masksToBounds = true
        backgroundBook?.contentMode = .scaleAspectFill
        backgroundBook?.layer.cornerRadius = 15
        view.addSubview(backgroundBook!)
        
        
        holaLabel =  UILabel(frame: CGRect(x: 35, y: 30, width: width/4, height: height/8))
        holaLabel?.backgroundColor = .clear
        holaLabel?.text = "Hola"
        holaLabel?.font = UIFont(name: "Helvetica Bold", size: 26)
        holaLabel?.textColor = lightBTextColor
        view.addSubview(holaLabel!)
        
        nombreLabel =  UILabel(frame: CGRect(x: 35, y: 50, width: width/4, height: height/8))
        nombreLabel?.backgroundColor = .clear
        nombreLabel?.text = "Marco!"
        nombreLabel?.font = UIFont(name: "Helvetica Bold", size: 26)
        nombreLabel?.textColor = darkBlueTextColor
        view.addSubview(nombreLabel!)
        
        collectionBook = UIImageView (frame: CGRect(x: 0, y: 160, width: width, height: height/16))
        collectionBook?.backgroundColor = .black
        collectionBook?.image = UIImage(named: "backImage2")//aqui le asigno la imagen segun sea el nombre en assets
        collectionBook?.contentMode = .scaleAspectFill // para hacer que encaje la imagen en el image box
        collectionBook?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        collectionBook?.layer.cornerRadius = 10
        view.addSubview(collectionBook!)
        
        masPolular =  UILabel(frame: CGRect(x: 45, y: 160, width: 200, height: 40))
        masPolular?.backgroundColor = .clear
        masPolular?.text = "Más populares"
        masPolular?.font = UIFont(name: "Helvetica Bold", size: 22)
        masPolular?.textColor = blueTextColor
        view.addSubview(masPolular!)
        
        
        backButton = UIButton(frame: CGRect(x: 330, y: 50, width: 35, height: 35))
        backButton?.setImage(UIImage(named: "logOut"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
    }
    
    func getData(){
//MARK: Categoria Drama --------------
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
    
    }
    
    
        @objc func backAction(){
        print("back action")
        dismiss(animated:true )}

    
}

extension LibreriaViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.bookCategorias?[section].librosInfo?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let libroCell = dataSource?.bookCategorias?[indexPath.section].librosInfo?[indexPath.row]
        let bookCell = bookTableViewCell(book: libroCell!)
        return bookCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height / 6
    }
 }

extension LibreriaViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let vista = UIView()
    vista.backgroundColor = darkBlueTextColor
    
    let etiqueta = UILabel(frame: CGRect(x: 120, y: 15, width: 200, height: 30))
        etiqueta.text = dataSource?.bookCategorias?[section].categoriaName ?? ""
        etiqueta.font = .boldSystemFont(ofSize: 20)
        etiqueta.textColor = whiteTextColor
        vista.addSubview(etiqueta)
        
        return vista
    }
    //--------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Estoy en la seccion \(indexPath.section) en la celda \(indexPath.row)")
        
        let book = dataSource?.bookCategorias?[indexPath.section].librosInfo?[indexPath.row]
        // aqui jalo la informacion de detailViewController
            
        
        let vistaBook = DetailBookViewController()
        vistaBook.libro = book
        
        vistaBook.modalPresentationStyle = .fullScreen
        present(vistaBook, animated: true, completion: nil)
    }
    
    ///Numero de secciones que vamos a usar
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.bookCategorias?.count ?? 0
    }
    
}
    
    extension LibreriaViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        
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
          
        }

    }
    
    
