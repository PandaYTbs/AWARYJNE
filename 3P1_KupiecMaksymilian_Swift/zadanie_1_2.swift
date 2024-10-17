import Foundation

print("Podaj liczbę:")
if let liczbaStr = readLine(), let liczba = Int(liczbaStr) {  // readLine to pobranie od użytkownika
    
    print("\na) " + String(repeating: "X", count: liczba)) // Funkcja String(repeating: "X", count: liczba) tworzy ciąg
    
    print("\nb)")
    for i in 0..<liczba {
        if i == 0 || i == liczba - 1 {
            print(String(repeating: "X", count: liczba))
        } else {
            print("X" + String(repeating: " ", count: liczba - 2) + "X")
        }
    }
    
print("\nc)")
for i in 0..<liczba {
    if i == liczba - 1 {
        print(String(repeating: "X", count: liczba))
    } else {
        let spaces = String(repeating: " ", count: liczba - i - 1)
        let xString = i > 0 ? String(repeating: " ", count: i - 1) + "X" : ""
        print(spaces + "X" + xString)
    }
}

    print("\nd)")
    for i in 1...liczba {
        for j in 1...i {
            print(j, terminator: "")
        }
        print()
    }

    print("\ne)")
    for i in 1...liczba {
        let spaces = String(repeating: " ", count: liczba - i)
        let numbers = (1...i).reversed().map { String($0) }.joined()
        print(spaces + numbers)
    }
    
    print("\nf) Silnia:")
    func silnia(_ n: Int) -> Int {
        return n == 0 ? 1 : n * silnia(n - 1)
    }
    print(silnia(liczba))

    print("\ng) Suma liczb parzystych od 0 do \(liczba):")
    let sumaParzystych = (0...liczba).filter { $0 % 2 == 0 }.reduce(0, +) //liczby parzyste za pomocą filter,  sumuje je używając reduce 
    print(sumaParzystych)

    print("\nh) Czy liczba \(liczba) jest pierwsza?")
    func czyPierwsza(_ n: Int) -> Bool {
        if n < 2 { return false } // Jeśli liczba jest mniejsza niż 2, zwraca false
        for i in 2..<n { // dzieli się bez reszty przez jakąkolwiek liczbę od 2 do n-1, to nie jest pierwsza.
            if n % i == 0 {
                return false
            }
        }
        return true
    }
    print(czyPierwsza(liczba) ? "Tak, liczba jest pierwsza." : "Nie, liczba nie jest pierwsza.")
    

    print("\ni) Tabliczka mnożenia dla \(liczba):")
    for i in 1...liczba {
        for j in 1...liczba {
            print(String(format: "%2d", i * j), terminator: " ")
        }
        print()
    }
}
