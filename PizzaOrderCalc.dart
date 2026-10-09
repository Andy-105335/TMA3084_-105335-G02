import 'dart:io';

void main() {
  // 2. Display prices
  print('====================================');
  print('       WELCOME TO PIZZA PALACE      ');
  print('====================================');
  print('Prices:');
  print('  [S] Small  - \$5 USD');
  print('  [M] Medium - \$7 USD');
  print('  [L] Large  - \$10 USD');
  print('====================================\n');

  // 5. Implement a while loop to allow continuous ordering / validation
  while (true) {
    // Prompt for Pizza Size
    stdout.write('Select pizza size (Small/Medium/Large) or type "Exit" to quit: ');
    String? sizeInput = stdin.readLineSync()?.trim();

    if (sizeInput == null || sizeInput.toLowerCase() == 'exit') {
      print('Thank you! Goodbye.');
      break;
    }

    // Input Validation for Size
    String normalizedSize = sizeInput.toLowerCase();
    int pricePerPizza = 0;

    // 4. Use a switch statement to determine price per pizza
    switch (normalizedSize) {
      case 's':
      case 'small':
        pricePerPizza = 5;
        break;
      case 'm':
      case 'medium':
        pricePerPizza = 7;
        break;
      case 'l':
      case 'large':
        pricePerPizza = 10;
        break;
      default:
        print('Error: Invalid pizza size selected. Please try again.\n');
        continue; // Restart the loop for valid input
    }

    // Prompt for Quantity with Validation Loop
    int? quantity;
    while (quantity == null || quantity <= 0) {
      stdout.write('Enter quantity (positive integer): ');
      String? qtyInput = stdin.readLineSync()?.trim();

      quantity = int.tryParse(qtyInput ?? '');
      if (quantity == null || quantity <= 0) {
        print('Invalid quantity. Please enter a positive number.');
      }
    }

    // 4. Calculate and print total payment
    int totalCost = pricePerPizza * quantity;
    print('\n------------------------------------');
    print('Order Details:');
    print('  Size: ${sizeInput.toUpperCase()}');
    print('  Quantity: $quantity');
    print('  Total Payment: \$$totalCost USD');
    print('------------------------------------\n');

    // Prompt user whether to place another order
    stdout.write('Would you like to place another order? (y/n): ');
    String? continueChoice = stdin.readLineSync()?.trim().toLowerCase();
    if (continueChoice != 'y' && continueChoice != 'yes') {
      print('Thank you for ordering with us!');
      break;
    }
    print('');
  }
}