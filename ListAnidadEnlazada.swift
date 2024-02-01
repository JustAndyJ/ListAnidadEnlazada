import Foundation

class Stock {
    var serialNumber: Int
    var next: Stock?

    init(serialNumber: Int) {
        self.serialNumber = serialNumber
        self.next = nil
    }
}

var cheese: Stock?

func callMenuStack() {
    var option = 0

    repeat {
        print("\n\nManager of stock:")
        print("1 - show products.")
        print("2 - add products.")
        print("3 - remove products.")
        print("4 - exit.")
        print("Type the option: ", terminator: "")

        if let input = readLine(), let inputOption = Int(input) {
            option = inputOption
        } else {
            print("Invalid input. Please enter a valid option.")
            option = 0
        }
    } while option < 0 || option > 4

    switch option {
    case 1: showStack()
    case 2: addElementStack()
    case 3: removeElementStack()
    case 4: break
    default: break
    }
}
/*
func addElementStack() {
  print("\nEnter the serial number for the new product: ", terminator: "")
  if let input = readLine(), let serialNumber = Int(input) {
    let newStock =  Stock(serialNumber: serialNumber)
    newStock.next = cheese
    cheese = newStock
    print("Product added successfully.")
  } else {
    print("Invalid input. Please enter a valid serial number.")
  }
  callMenuStack()
}

func showStack() {
  var current = cheese
  
  while let element = current {
    print("element: ", element.serialNumber)
    current = element.next
  }
  callMenuStack()
}
*/
func removeElementStack() {

    print("Enter the count of product for remove: ", terminator: "")
    if let input = readLine(), let count = Int(input) {
      
      for _ in 0..<count {
        if let removedStock = cheese {
          print("\nProduct with serial number \(removedStock.serialNumber) removed.")
          cheese = removedStock.next    
        } else {
          print("\nNo products to remove.")
          break
      }   
    }
  callMenuStack()
}
}
 

func showStack() {
    print("\nReport of products in stock")
    print("\nCHEESE:")

    var aux: Stock? = cheese

    while let currentStock = aux {
        print("\nSerial number: \(currentStock.serialNumber)")
        aux = currentStock.next
    }

    callMenuStack()
}

func addElementStack() {
    print("How much units of cheese do you want to add?: ", terminator: "")
  
    if let input = readLine(), let account = Int(input) {
        for _ in 0..<account {
          
            let unity = Stock(serialNumber: Int.random(in: 0..<1000))

            if cheese == nil {
                cheese = unity
                unity.next = nil
              
            } else {
                unity.next = cheese
                cheese = unity
            }
        }
    } else {
        print("Invalid input. Please enter a valid number.")
    }

    callMenuStack()
}
 
 

// Ejemplo de uso de las funciones
showStack()
addElementStack()