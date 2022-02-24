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
    var recomendados : UILabel?
    var collectionBook : UIImageView? //UICollectionView?
    var collectionBook2 : UIImageView?
    var findBook : UIImageView?
    var findLabel : UILabel?
    var backgroundBook : UIImageView?
    var librosButton : UIButton?
    var categoriasButton :UIButton?
    var autoresButton : UIButton?
    var buscarAutor : UIButton?
    var buscarAutor1 : UIButton?
    var buscarCategoria : UIButton?
    var buscarLibrosXautor : UIButton?
    
    var dataSource : BookObject?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
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
        view.backgroundColor = .nightBlue
        
        initUI()
    }
    func initUI(){
        getData()
    //MARK: Init Libreria Collection View ____
        libreriaCollectionView.delegate = self
        libreriaCollectionView.dataSource = self
        view.addSubview(libreriaCollectionView)
        //libreriaCollectionView.addAnchorsWithMargin(20)                   //4                    //150                200
        libreriaCollectionView.addAnchorsAndSize(width: width , height: height / 7, left: 10, top: 170, right: 10, bottom: 50)
    //MARK: Init Elementos de vista         ____
        bookTableView = UITableView(frame: CGRect(x: 10, y: 480, width: width - 20, height: height/2))
        bookTableView?.backgroundColor = .nightBlue
        bookTableView?.delegate = self
        bookTableView?.dataSource = self
        view.addSubview(bookTableView!)
                                                        //x 0 , y 0                         // 8
        backgroundBook = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/7))
        backgroundBook?.image = UIImage(named:"backImage1")
        backgroundBook?.layer.masksToBounds = true
        backgroundBook?.contentMode = .scaleAspectFill
        backgroundBook?.layer.cornerRadius = 15
        view.addSubview(backgroundBook!)
        
        holaLabel =  UILabel(frame: CGRect(x: 35, y: 30, width: width/4, height: height/8))
        holaLabel?.backgroundColor = .clear
        holaLabel?.text = "Hello"
        holaLabel?.font = UIFont(name: "Helvetica Bold", size: 24)
        holaLabel?.textColor = .seaBlue
        view.addSubview(holaLabel!)
        
        nombreLabel =  UILabel(frame: CGRect(x: 35, y: 50, width: width/4, height: height/8))
        nombreLabel?.backgroundColor = .clear
        nombreLabel?.text = "Marco!"
        nombreLabel?.font = UIFont(name: "Helvetica Bold", size: 24)
        nombreLabel?.textColor = .nightBlue
        view.addSubview(nombreLabel!)
        
//MARK: Populares Label and View                                                        // 16
        collectionBook = UIImageView (frame: CGRect(x: 10, y: 130, width: width - 20, height: height/22))
        collectionBook?.backgroundColor = .black
        collectionBook?.image = UIImage(named: "backImage2")//aqui le asigno la imagen segun sea el nombre en assets
        collectionBook?.contentMode = .scaleAspectFill // para hacer que encaje la imagen en el image box
        collectionBook?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        collectionBook?.layer.cornerRadius = 10
        view.addSubview(collectionBook!)
        
        masPolular =  UILabel(frame: CGRect(x: 30, y: 132, width: 200, height: 40))
        masPolular?.backgroundColor = .clear
        masPolular?.text = "New & Trending:"
        masPolular?.font = UIFont(name: "Helvetica Bold", size: 19)
        masPolular?.textColor = .seaBlue
        view.addSubview(masPolular!)
        
        //MARK: Buscar por  Label and View                                                        // 16
        findBook = UIImageView (frame: CGRect(x: 10, y: 370,  width: width - 20, height: height/22))
        findBook?.backgroundColor = .black
        findBook?.image = UIImage(named: "backImage1")//aqui le asigno la imagen segun sea el nombre en assets
        findBook?.contentMode = .scaleAspectFill // para hacer que encaje la imagen en el image box
        findBook?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        findBook?.layer.cornerRadius = 10
        view.addSubview(findBook!)
                
        findLabel =  UILabel(frame: CGRect(x: 35, y: 370, width: 200, height: 40))
        findLabel?.backgroundColor = .clear
        findLabel?.text = "Search:"
        findLabel?.font = UIFont(name: "Helvetica Bold", size: 19)
        findLabel?.textColor = .seaBlue
        view.addSubview(findLabel!)
        
 //MARK: Recomendados Label and Back Image                                                         // was 16
        collectionBook2 = UIImageView (frame: CGRect(x: 10, y: 475, width: width - 20, height: height/22))
        collectionBook2?.backgroundColor = .black
        collectionBook2?.image = UIImage(named: "backImage2")//aqui le asigno la imagen segun sea el nombre en assets
        collectionBook2?.contentMode = .scaleAspectFill // para hacer que encaje la imagen en el image box
        collectionBook2?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        collectionBook2?.layer.cornerRadius = 10
        view.addSubview(collectionBook2!)
            
        recomendados =  UILabel(frame: CGRect(x: 35, y: 477, width: 200, height: 40))
        recomendados?.backgroundColor = .clear
        recomendados?.text = "Hack your life: "
        recomendados?.font = UIFont(name: "Helvetica Bold", size: 19)
        recomendados?.textColor = .seaBlue
            view.addSubview(recomendados!)
        
        //--------------- Boton LOG OUT ---------------
        backButton = UIButton(frame: CGRect(x: 330, y: 50, width: 35, height: 35))
        backButton?.setImage(UIImage(named: "logOut"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        //Search  Buttons
        buscarAutor1 = UIButton(frame: CGRect(x: 10, y: 420, width: width / 4, height: 30))
        buscarAutor1?.backgroundColor = .nightBlue
        buscarAutor1?.layer.cornerRadius = 10
        buscarAutor1?.setTitle("Authors", for: .normal)
        buscarAutor1?.layer.borderColor = UIColor.white.cgColor
        buscarAutor1?.layer.borderWidth = 1
        buscarAutor1?.addTarget(self, action: #selector(autorFinder), for: .touchUpInside)
        view.addSubview(buscarAutor1!)
        
        buscarCategoria = UIButton(frame: CGRect(x: 118, y: 420, width: width / 3, height: 30))
        buscarCategoria?.backgroundColor = .nightBlue
        buscarCategoria?.layer.cornerRadius = 10
        buscarCategoria?.setTitle("By Category", for: .normal)
        buscarCategoria?.layer.borderColor = UIColor.white.cgColor
        buscarCategoria?.layer.borderWidth = 1
        buscarCategoria?.addTarget(self, action: #selector(categoryFinder), for: .touchUpInside)
        view.addSubview(buscarCategoria!)
        
        buscarLibrosXautor = UIButton(frame: CGRect(x: 260, y: 420, width: width / 3, height: 30))
        buscarLibrosXautor?.backgroundColor = .nightBlue
        buscarLibrosXautor?.layer.cornerRadius = 10
        buscarLibrosXautor?.setTitle("By Author ID", for: .normal)
        buscarLibrosXautor?.layer.borderColor = UIColor.white.cgColor
        buscarLibrosXautor?.layer.borderWidth = 1
        buscarLibrosXautor?.addTarget(self, action: #selector(bookByAutor), for: .touchUpInside)
        view.addSubview(buscarLibrosXautor!)
    }
    func getData(){
//MARK: Categoria Drama --------------
        let libroCohello = Libro(tituloLibro: "El alquimista", autor: "Paulo Coelho", category: "Drama", precio: 350.00, rate: "4estrellas", portadaImage: "alquimistaImage", descripcion: "libro recomendado para lecturas de autosuperacion", autorFoto: "coelhoFoto", autorInfo: "Es uno de los escritores y novelistas más leídos del mundo con más de 320 millones de libros vendidos.")
        let cienSoledad = Libro(tituloLibro: "Cien años de soledad", autor: "Garcia Marquez", category: "Drama", precio: 590.0, rate: "5estrellas", portadaImage: "cienImage", descripcion: "best seller de Gacia Marquez", autorFoto: "marquezFoto", autorInfo: "Reconocido principalmente por sus novelas y cuentos, muere el 17 de abril de 2014, Ciudad de México")
        let casaEspiritus = Libro(tituloLibro: "La casa de los espiritus", autor: "Isabel Allende", category: "Drama", precio: 370.0 , rate: "5estrellas", portadaImage: "espiritusImage", descripcion: "Unos de los titulos mas galardonados de Isabel ", autorFoto: "isabelFoto", autorInfo: "Escritora chilena con nacionalidad estadounidense, Premio Nacional de Literatura de su país en 2010.")
        let once = Libro(tituloLibro: "Once minutos", autor: "Paulo Coelho", category: "Drama", precio: 350.0, rate: "4estrellas", portadaImage: "onceImage", descripcion: "Relata la vida de Maria en una aldea remota de Brasil",autorFoto: "coelhoFoto", autorInfo: "Es uno de los escritores y novelistas más leídos del mundo con más de 320 millones de libros vendidos en más de 170 países, traducidos a 83 lenguas.")
        let bodega = Libro(tituloLibro: "La Bodega", autor: "Noah Gordon", category: "Ficcion Historica", precio: 600.0, rate: "5estrellas", portadaImage: "bodegaImage", descripcion: "La carta de amor de Godon a España y su vides", autorFoto: "noahFoto", autorInfo: "Escritor estadounidense de novelas que se han convertido en superventas. Nacimiento: 11 de noviembre de 1926, Worcester, Massachusetts")
        let medico = Libro(tituloLibro: "El Medico", autor: "Noah Gordon", category: "Ficcion Historica", precio: 750.0, rate: "5estrellas", portadaImage: "medicoImage", descripcion: "Dramatica historia de la formacion de un erudito Medico",autorFoto: "noahFoto", autorInfo: "Escritor estadounidense de novelas que se han convertido en superventas. Nacimiento: 11 de noviembre de 1926, Worcester, Massachusetts")
        let comite = Libro(tituloLibro: "El comite de la muerte", autor: "Noah Gordon", category: "Ficcion Historica", precio: 500.0, rate: "nuevo", portadaImage: "comiteImage", descripcion: "Tres medicos compiten para ser el mejor",autorFoto: "noahFoto", autorInfo: "Escritor estadounidense de novelas que se han convertido en superventas. Nacimiento: 11 de noviembre de 1926, Worcester, Massachusetts")
       
        let dramaBooks = Categoria(categoriaName: "High Rated", librosInfo: [medico, casaEspiritus, comite, bodega, libroCohello, cienSoledad, once])
//MARK: Categoria Terror --------------
        let baldor = Libro(tituloLibro: "Algebra de Baldor", autor: "Baldor", category: "Terror", precio: 700.0, rate: "nuevo", portadaImage: "baldorImage", descripcion: "libro para aprender algebra", autorFoto: "baldorFoto", autorInfo: "Aurelio Baldor fue Matemático, profesor, escritor y abogado cubano, autor del libro Álgebra de Baldor, ​ publicado en 1941")
        let control = Libro(tituloLibro: "Ing. control Moderno", autor: "K. Ogata", category: "Terror", precio: 300.0, rate: "nuevo", portadaImage: "ogataImage", descripcion: "Introduccion a los sistemas de control", autorFoto: "ogataFoto", autorInfo: "Katsuhiko Ogata es un profesor de ingeniería que nació en Tokio, Japón; el 6 de enero de 1925.")
        
        let terrorBooks = Categoria(categoriaName: "Just added", librosInfo: [baldor, control])
//MARK: Book Obj data Source --------------
        let populares = BookObject(bookCategorias: [dramaBooks, terrorBooks], cateTitle: "Populares categoria title")
        
        dataSource = populares
    }
//MARK: Funcion para regresar del view
        @objc func backAction(){
        print("back action")
        dismiss(animated:true )}
    
    @objc func autorFinder(){
        //Esta funcion cambia el alpha del color y va al principio para que haga el efecto de cambiar al precionar
        buscarAutor1?.backgroundColor = .seaBlue
        buscarAutor1?.alpha = 0.5
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             self.buscarAutor1?.alpha = 1.0
             self.buscarAutor1?.backgroundColor = .nightBlue
         }
            print("presentando buscador de autor View")
            let libreriaOption = AutorController()
            libreriaOption.modalPresentationStyle = .popover
            present(libreriaOption, animated: true,completion:
                        {
                        print("Presentando View de Autor finder") })}

    @objc func bookByAutor(){
        //Esta funcion cambia el alpha del color y va al principio para que haga el efecto de cambiar al precionar
        buscarAutor1?.backgroundColor = .seaBlue
        buscarAutor1?.alpha = 0.5
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             self.buscarAutor1?.alpha = 1.0
             self.buscarAutor1?.backgroundColor = .nightBlue
         }
            print("presentando buscador de autor View")
            let libreriaOption = obrasViewController()
            libreriaOption.modalPresentationStyle = .popover
            present(libreriaOption, animated: true,completion:
                        {
                        print("Presentando View de Autor finder") })}
        //MARK: Ir a View de busqueda por categoria
        @objc func categoryFinder(){
            //Esta funcion cambia el alpha del color y va al principio para que haga el efecto de cambiar al precionar
            buscarCategoria?.backgroundColor = .seaBlue
                buscarCategoria?.alpha = 0.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                 self.buscarCategoria?.alpha = 1.0
                    self.buscarCategoria?.backgroundColor = .nightBlue
             }
                print("presentando otro View")
                let libreriaOption = planetasViewController()
                libreriaOption.modalPresentationStyle = .popover
                present(libreriaOption, animated: true,completion:
                            {
                            print("Presentando View de Registro") })}
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
// Esta es una extension para el delegado de la libreria view controller
extension LibreriaViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let vista = UIView()
        vista.backgroundColor = .nightBlue
    
    let etiqueta = UILabel(frame: CGRect(x: 120, y: 15, width: 200, height: 30))
        etiqueta.text = dataSource?.bookCategorias?[section].categoriaName ?? ""
        etiqueta.font = .boldSystemFont(ofSize: 20)
        etiqueta.textColor = .red//lo pondre limpio, no quiero que se vea// esta etiqueta es la que se muestra en el encabezado de los nombres de categorias best seller , just added o hight rated
       // vista.addSubview(etiqueta)
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
    
    
