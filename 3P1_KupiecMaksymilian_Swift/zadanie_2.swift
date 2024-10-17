import Foundation

// Zadanie 1
func sprawdzImie(imie: String) -> String {
    let imieDuzeLitery = imie.uppercased()
    
    // wyjątki
    let wyjatki = ["KUBA", "BARNABA"]
    
    if wyjatki.contains(imieDuzeLitery) {
        return "To imię męskie."
    } else if imieDuzeLitery.hasSuffix("A") {
        return "To imię kobiece."
    } else {
        return "To imię męskie."
    }
}

// Zadanie 2
func szyfrPlotkowy(slowo: String) -> String {
    var rzad1 = ""
    var rzad2 = ""
    
    for (index, litera) in slowo.enumerated() {
        if index % 2 == 0 {
            rzad1.append(litera)
        } else {
            rzad2.append(litera)
        }
    }
    
    return rzad1 + rzad2
}

//  Zadanie 3
func sprawdzPESEL(pesel: String) -> (poprawnosc: Bool, dataUrodzenia: String?, plec: String?) {
    guard pesel.count == 11, let _ = Int(pesel) else {
        return (false, nil, nil)
    }
    
    let cyfry = pesel.map { Int(String($0))! }
    
    // Sprawdzenie poprawności PESELu
    let wagi = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3]
    let sumaKontrolna = (0..<10).reduce(0) { $0 + (wagi[$1] * cyfry[$1]) } % 10
    let suma = (10 - sumaKontrolna) % 10
    if suma != cyfry[10] {
        return (false, nil, nil)
    }
    
    // Odczytanie daty i plci
    let rok = (cyfry[0] * 10 + cyfry[1])
    let miesiac = (cyfry[2] * 10 + cyfry[3])
    let dzien = (cyfry[4] * 10 + cyfry[5])
    
    var pelnyRok: Int
    if miesiac > 80 { // 1800-1899
        pelnyRok = 1800 + rok
    } else if miesiac > 60 { // 2200-2299
        pelnyRok = 2200 + rok
    } else if miesiac > 40 { // 2100-2199
        pelnyRok = 2100 + rok
    } else if miesiac > 20 { // 2000-2099
        pelnyRok = 2000 + rok
    } else { // 1900-1999
        pelnyRok = 1900 + rok
    }
    
    let prawdziwyMiesiac = miesiac % 20
    
    let dataUrodzenia = String(format: "%04d-%02d-%02d", pelnyRok, prawdziwyMiesiac, dzien)
    
    // Odczytanie plci
    let plec = cyfry[9] % 2 == 0 ? "K" : "M" //jeśli parzysta,  kobieta, jeśli nieparzysta chłop.
    
    return (true, dataUrodzenia, plec)
}

//  Funkcja  menu
func wyswietlMenu() {
    print("""
    Wybierz zadanie:
    1. Sprawdzenie imienia
    2. Szyfr płotkowy
    3. Sprawdzenie PESEL
    k. Koniec
    """)
}

//  Funkcja główna
func main() {
    var kontynuuj = true
    
    while kontynuuj {
        wyswietlMenu()
        if let wybor = readLine() {
            switch wybor {
            case "1":
                print("Podaj imię:")
                if let imie = readLine() {
                    let wynik = sprawdzImie(imie: imie)
                    print(wynik)
                }
                
            case "2":
                print("Podaj słowo do zaszyfrowania (szyfr płotkowy o dwóch rzędach):")
                if let slowo = readLine() {
                    let zaszyfrowaneSlowo = szyfrPlotkowy(slowo: slowo)
                    print("Zaszyfrowane słowo: \(zaszyfrowaneSlowo)")
                }
                
            case "3":
                print("Podaj numer PESEL:")
                if let pesel = readLine() {
                    let wynik = sprawdzPESEL(pesel: pesel)
                    if wynik.poprawnosc {
                        print("PESEL poprawny.")
                        print("Data urodzenia: \(wynik.dataUrodzenia!)")
                        print("Płeć: \(wynik.plec!)")
                    } else {
                        print("PESEL niepoprawny.")
                    }
                }
                
            case "k":
                kontynuuj = false
                print("Zakończono program.")
                
            default:
                print("Nieprawidłowy wybór. Spróbuj ponownie.")
            }
        }
    }
}

main()
