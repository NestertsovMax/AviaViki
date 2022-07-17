//
//  typeAircraftViewController.swift
//  aviaViki
//
//  Created by M1 on 16.07.2022.
//

import UIKit

class TypeAircraftViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    private var aviaCategories: [AviaCategory] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Воздушный Транспорт"
        tableView.delegate = self
        tableView.dataSource = self
        
        aviaCategories = [
            AviaCategory(name: "Самолеты", image: UIImage(named: "airplane")!, models: [
                AviaModel(name: "СУ-25", image: UIImage(named: "su25")!, description: "Су-25 («Грач», изделие «Т-8», по кодификации НАТО: Frogfoot — «лягушачья лапа») — советский штурмовик, бронированный дозвуковой военный самолёт."),
                AviaModel(name: "Миг-31", image: UIImage(named: "mig31")!, description: "МиГ-31 — советский и российский двухместный сверхзвуковой высотный всепогодный истребитель-перехватчик дальнего радиуса действия. Разработан в ОКБ-155 (ныне АО РСК «МиГ») на базе МиГ-25 в 1970-х годах. Первый советский боевой самолёт четвёртого поколения[2]."),
                AviaModel(name: "АН-12", image: UIImage(named: "an12")!, description: "Ан-12 (изделие «Т», по кодификации НАТО: Cub — «Новичок») — советский военно-транспортный самолёт. Разработан в АНТК имени О. К. Антонова в 1950-х годах."),
                AviaModel(name: "U-2", image: UIImage(named: "u2")!, description: "Lockheed U-2 (Локхид У-2) — американский высотный самолёт-разведчик. Неофициальное название модификации U-2R/TR-1 — «Dragon Lady». Один из старейших самолётов, до сих пор находящихся на вооружении в США.")
            ]),
            AviaCategory(name: "Вертолеты", image: UIImage(named: "helicopter")!, models: [
                AviaModel(name: "K-52", image: UIImage(named: "k52")!, description: "Ка-52 «Аллигатор» (изделие «800.06», по кодификации НАТО — Hokum B) — российский разведывательно-ударный вертолёт[4] нового поколения. Машина способна поражать бронированную и небронированную технику, живую силу и воздушные цели на поле боя. Представляет собой дальнейшее развитие вертолёта Ка-50 «Чёрная акула».До прекращения серийного производства Ка-50 в 2009 году в качестве специфики боевого применения Ка-52 предусматривалось выполнение им задач командирской машины армейской авиации, осуществляющей разведку местности, целеуказание и координацию действий группы боевых вертолётов. Помимо выполнения разведывательно-боевых функций, Ка-52 может выполнять роль учебно-тренировочной машины[5]."),
                AviaModel(name: "МИ-28", image: UIImage(named: "mi28")!, description: "Ми-28Н «Ночной охотник» (по кодификации НАТО: Havoc — «Опустошитель») — советский и российский ударный вертолёт производства ПАО «Роствертол», входящего в холдинг «Вертолёты России», предназначенный для поиска и уничтожения в условиях активного огневого противодействия танков и другой бронированной техники, а также малоскоростных воздушных целей и живой силы противника[5]."),
                AviaModel(name: "АН-64", image: UIImage(named: "an64")!, description: "«Апач»[К 1] (англ. Apache [əˈpæʧɪ], по названию одноимённого индейского племени), заводской индекс изготовителя — Hughes Model 77, общевойсковой индекс — AH-64 от Attack Helicopter)[5] — основной боевой вертолёт армии США с середины 1980-х годов.")
            ]),
            AviaCategory(name: "Воздушные шары", image: UIImage(named: "balloon")!, models: [
                AviaModel(name: "Воздушный шар", image: UIImage(named: "balloon")!, description: "Возду́шный шар — летательный аппарат (аэростат), в котором для полёта используют газ, который легче воздуха. Состоит из заполненной газом оболочки и прикреплённой к ней корзины или прицепной кабины. В отличие от дирижаблей, воздушные шары не имеют двигателей для самостоятельного горизонтального движения в воздухе. В зависимости от наполнения различают монгольфьеры (шары, наполненные нагретым воздухом), шарльеры (наполнены лёгким газом, как правило, водородом или гелием) и розьеры (воздушные суда, использующие одновременно газ и воздух, размещённые в отдельных оболочках)")
            ])
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowAircraftViewController" else { return }
        guard let destVC = segue.destination as? AircraftViewController else { return }
        guard let tableCell = sender as? UITableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: tableCell) else { return }
        destVC.models = aviaCategories[indexPath.row].models
        
    }
    
}

extension TypeAircraftViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TypeAircraftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aviaCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AircraftCellTableViewCell", for: indexPath) as! AircraftTableViewCell
        let category = aviaCategories[indexPath.row]
        cell.update(aircraft: category.name, image: category.image, count: category.models.count)
        return cell
    }
}
