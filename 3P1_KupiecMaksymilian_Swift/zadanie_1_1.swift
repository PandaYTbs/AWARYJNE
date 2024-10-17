import Foundation

print("Liczby z zakresu <-22;22):")
for i in -22..<22 {
    print(i)
}

print("\nMalejąco co piątą liczbę z zakresu (-15;55>:")
for i in stride(from: 55, through: -15, by: -5) {  //Pętla stride iteruje malejąco
    print(i, terminator: " ")
}
print()

print("\nMalejąco liczby z zakresu <10;40> bez przedziału (15;25):")
for i in (10...40).reversed() {
    if i < 15 || i > 25 {
        print(i, terminator: " ")
    }
}
print()

print("\nLiczby nieparzyste z przedziału <-40;40) bez przedziału <3;30>:")
for i in -40..<40 {
    if i % 2 != 0 && (i < 3 || i >= 30) { //"i % 2 != 0" sprawdza, czy liczba jest nieparzysta
        print(i, terminator: " ")
    }
}
print()

print("\nLiczby parzyste z przedziału <-20;20) bez przedziału (5;10):")
for i in -20..<20 {
    if i % 2 == 0 && (i <= 5 || i >= 10) { // "i % 2 == 0" sprawdza, czy liczba jest parzysta
        print(i, terminator: " ")
    }
}
print()

print("\nLiczby podzielne przez 7 z przedziału <-100;41) bez przedziału (-28;14):")
for i in -100..<41 {
    if i % 7 == 0 && (i < -28 || i > 14) {  // "i % 7 == 0 sprawdza, czy liczba jest podzielna przez 7"
        print(i, terminator: " ")
    }
}
print("\n")