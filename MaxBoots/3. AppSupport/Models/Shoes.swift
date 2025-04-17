import Foundation

struct Shoes: Identifiable, Codable, Equatable {
    let id: Int
    let image: String
    let name: String
    let description: String
    let isCool: Bool
    var bought: Bool
}

struct Shop: Identifiable, Codable, Equatable {
    let id: Int
    let image: String
    let background: String
    let name: String
    let description: String
    let shoes: [Shoes]
}

extension Shoes {
    static let initialShoes: Shoes = Shoes(
        id: 0,
        image: "",
        name: "",
        description: "",
        isCool: false,
        bought: false
    )
}

extension Shop {
    static let сhineseShop = Shop(
        id: 1,
        image: "shop3",
        background: "back3",
        name: "Китайский обувной #1",
        description: "Супружеская пара китайцев выглядит вполне дружелюбно",
        shoes: .сhineseShoes
    )
    
    static let secondShop = Shop(
        id: 2,
        image: "shop2",
        background: "back2",
        name: "Обувной секонд-хенд",
        description: "Пришёл по наводке знакомого, тут можно откопать бриллиант",
        shoes: .secondShoes
    )
    
    static let trustedShop = Shop(
        id: 3,
        image: "shop1",
        background: "back1",
        name: "Магазин вызывает доверие",
        description: "Магазин выглядит очень прилично, продавец встречает с широкой улыбкой",
        shoes: .trustedShopShoes
    )
}

extension Array where Element == Shoes {
    static var сhineseShoes: [Shoes] {
        [
            Shoes(
                id: 1,
                image: "сhinese1",
                name: "Raddidas",
                description: "К сожалению, эти кроссовки оказались подделкой и подошвы остались на асфальте, спустя несколько метров по пути домой.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 2,
                image: "сhinese2",
                name: "Guma",
                description: "Эти 'кроссовки' оказались настолько гибкими, что могли завязываться узлом. Идеально, если ты мечтал ходить босиком, но стеснялся признаться.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 3,
                image: "сhinese3",
                name: "Guuzi",
                description: "Буква 'G' отвалилась ещё в магазине, но продавец сказал, что это 'эксклюзивная версия'.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 4,
                image: "сhinese4",
                name: "Nikke",
                description: "Надпись 'Just glue it' на подошве оказалась пророческой — пришлось склеивать их после каждого шага.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 5,
                image: "сhinese5",
                name: "Balansaga",
                description: "Левая подошва была на 2 см толще правой. Продавец настаивал, что это 'особая технология для йоги'.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 6,
                image: "сhinese6",
                name: "Burevestnik",
                description: "Оказались сделаны из сахарной ваты. Первый же дождь превратил их в кашу.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 7,
                image: "сhinese7",
                name: "Timberleik",
                description: "Ботинки, которые 'выдержат любую непогоду'... если непогода - это +25°C и легкий ветерок. Первый же дождь превратил их в аквапарк для ног.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 8,
                image: "сhinese8",
                name: "Air Socks",
                description: "Кроссовки, которые 'дышат'. Настолько, что через день от них остались только шнурки.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 9,
                image: "Caterpillar",
                name: "Caterpillar Original",
                description: "Не могу в это поверить! Чисто случайно в этом китайском магазине оказались оригинальные Caterpillar моего размера, урвал за 90 лари!",
                isCool: true,
                bought: false
            )
        ]
    }
}

extension Array where Element == Shoes {
    static var secondShoes: [Shoes] {
        [
            Shoes(
                id: 10,
                image: "second1",
                name: "Abibas",
                description: "Кроссовки с 'уникальной системой вентиляции' - дырки появились сами собой после первого же дня носки.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 11,
                image: "second2",
                name: "Ruma SuperFake",
                description: "Настолько 'супер', что начали разваливаться ещё до того, как ты успел их оплатить.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 12,
                image: "second3",
                name: "North Fake",
                description: "Куртка бы выдержала северный полюс, а эти ботинки не пережили даже росу на траве.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 13,
                image: "second4",
                name: "Reebak",
                description: "Буква 'a' - это не опечатка, а предупреждение Alert!. Подошва отвалилась при первом же прыжке.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 14,
                image: "second5",
                name: "Conversee",
                description: "Когда пытаешься вспомнить название бренда по памяти. Выглядят нормально, но цвет начал линять ещё в магазине.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 15,
                image: "second6",
                name: "Fila Stremium",
                description: "Премиум качество - значит в комплекте идёт тюбик суперклея для экстренного ремонта.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 16,
                image: "second7",
                name: "Vanz",
                description: "Шнурки оказались прочнее самой обуви. Теперь у тебя есть крутые шнурки... и ничего больше.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 17,
                image: "second8",
                name: "Skecherz",
                description: "Две подошвы оказались в правом кроссовке, контраст температуры для ног в дороге.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 18,
                image: "Columbia",
                name: "Columbia Original",
                description: "Настоящие Columbia! Владелец магазина клянётся, что они 'почти новые' - всего один предыдущий владелец (альпинист, покоривший Эверест).",
                isCool: true,
                bought: false
            )
        ]
    }
}

extension Array where Element == Shoes {
    static var trustedShopShoes: [Shoes] {
        [
            Shoes(
                id: 19,
                image: "trusted1",
                name: "Nike Pair",
                description: "Продавец клялся, что это лимитированная серия. Оказалось, лимитирована их прочность - развалились после 3 шагов.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 20,
                image: "trusted2",
                name: "Abulbas",
                description: "Три полоски есть, качество нет. После дождя осталась только одна полоска... и та кривая.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 21,
                image: "trusted3",
                name: "New Bounce",
                description: "Подошва действительно 'пружинила' - прямо в мусорное ведро, куда они и отправились после первого выхода.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 22,
                image: "trusted4",
                name: "Puma Future",
                description: "Будущее наступило - кроссовки разложились на молекулы быстрее, чем ты дошёл до дома.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 23,
                image: "trusted5",
                name: "Reebok Glassic",
                description: "Классика жанра: как и в 90-х, только теперь разваливаются в 90 раз быстрее.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 24,
                image: "trusted6",
                name: "Asics Gel-Kayano",
                description: "Гель вытек при первом же контакте с асфальтом. Теперь это просто Asics Kayano.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 25,
                image: "trusted7",
                name: "Timberland Stremium",
                description: "Премиум-версия означает, что они развалились с особым шиком и на 10% быстрее обычных.",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 26,
                image: "trusted8",
                name: "Vanz Old School",
                description: "Старая школа подделок. Полная аутентичность - разваливаются так же, как и 10 лет назад!",
                isCool: false,
                bought: false
            ),
            Shoes(
                id: 27,
                image: "skechersReal",
                name: "Skechers Original",
                description: "Невероятно, но факт - в этом магазине нашлась пара настоящих Skechers! Продавец сам в шоке, говорит, что они тут случайно оказались.",
                isCool: true,
                bought: false
            )
        ]
    }
}
