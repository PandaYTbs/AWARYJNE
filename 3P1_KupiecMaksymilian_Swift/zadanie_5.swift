import Foundation

//  Funkcja 1 Filtrowanie 
func filterInts(from array: [Any]) -> [Int] { //Funkcja filtruje elementy typu Int z tablicy zawierającej typu Any.
    return array.compactMap { $0 as? Int }
}

func handleFilterInts() { // wprowadzenie danych przez użytkownika i wywołuje funkcję filterInts do filtrowania tablicy.
    print("Podaj tablicę z elementami typu Any (oddzielone spacją):")
    if let input = readLine() {
        let mixedArray = input.split(separator: " ").map { element -> Any in
            if let intElement = Int(element) {
                return intElement
            } else {
                return String(element)
            }
        }
        
        let intArray = filterInts(from: mixedArray) //Wywołuje funkcję filterInts,  zwraca tablicę tylko z liczbami całkowitymi.
        print("Tablica po wycięciu elementów niebędących Int: \(intArray)")
    }
}

//  Funkcja 2 Rotacja 
func rotateRight(array: inout [Int], times: Int) {
    for iteration in 1...times {
        if let last = array.popLast() {
            array.insert(last, at: 0)
        }
        print("Iteracja \(iteration): \(array)")
    }
}

func rotateLeft(array: inout [Int], times: Int) {
    for iteration in 1...times {
        let first = array.removeFirst()
        array.append(first)
        print("Iteracja \(iteration): \(array)")
    }
}

func handleRotation() {
    print("Podaj elementy tablicy, oddzielone spacją:") //Użytkownik podaje tablicę i kierunek rotacji (R,L) i liczbe
    if let input = readLine() {
        var array = input.split(separator: " ").compactMap { Int($0) }
        
        while true {
            print("Podaj kierunek rotacji (R/L) i ilość iteracji, lub 'k' aby zakończyć:")
            if let command = readLine() {
                if command.lowercased() == "k" {
                    break
                } else if command.count > 1, let rotations = Int(command.dropFirst()) {
                    let direction = command.first!
                    
                    print("Tablica wejściowa: \(array)")
                    if direction == "R" {
                        rotateRight(array: &array, times: rotations)
                    } else if direction == "L" {
                        rotateLeft(array: &array, times: rotations)
                    } else {
                        print("Błędny kierunek, wpisz 'R' lub 'L'.")
                    }
                } else {
                    print("Błędny format, spróbuj ponownie.")
                }
            }
        }
    }
}

// Funkcja 3 Mnożenie macierzy
func multiplyMatrices(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]]? {
    let rowsA = matrixA.count
    let colsA = matrixA[0].count
    let rowsB = matrixB.count
    let colsB = matrixB[0].count

    guard colsA == rowsB else {
        print("Nie można pomnożyć macierzy: złe wymiary.")
        return nil //Zwraca wynik jeśli mnożenie jest możliwe, lub nil jeśli są złe wymiary.
    }

    var result = Array(repeating: Array(repeating: 0, count: colsB), count: rowsA)

    for i in 0..<rowsA {
        for j in 0..<colsB {
            for k in 0..<colsA {
                result[i][j] += matrixA[i][k] * matrixB[k][j]
            }
        }
    }

    return result
}

func handleMatrixMultiplication() { // proces wprowadzania dwóch macierzy przez użytkownika i wywołuje funkcję multiplyMatrices
    print("Podaj macierz A (oddziel wiersze '|' i liczby spacją):") // oddzielone znakiem "|""
    if let inputA = readLine() {
        let matrixA = inputA.split(separator: "|").map { $0.split(separator: " ").compactMap { Int($0) } }

        print("Podaj macierz B (oddziel wiersze '|' i liczby spacją):")
        if let inputB = readLine() {
            let matrixB = inputB.split(separator: "|").map { $0.split(separator: " ").compactMap { Int($0) } }

            if let result = multiplyMatrices(matrixA, matrixB) {
                print("Wynik mnożenia macierzy:")
                for row in result {
                    print(row)
                }
            }
        }
    }
}

// MARK: - Program główny z menu
while true {
    print("""
    Wybierz operację:
    1. Filtrowanie tylko elementów typu Int
    2. Rotacja tablicy
    3. Mnożenie macierzy
    k. Zakończ program
    """)
    
    if let choice = readLine() {
        switch choice {
        case "1":
            handleFilterInts()
        case "2":
            handleRotation()
        case "3":
            handleMatrixMultiplication()
        case "k":
            print("Koniec programu.")
            exit(0)
        default:
            print("Błędny wybór, spróbuj ponownie.")
        }
    }
}
