import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Checkout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping To',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            AddressCard(
              address: 'B-45 Hassan Ayaz',
              city: 'Islamabad, Pakistan',
              isSelected: true,
            ),
            AddressCard(
              address: 'I-14/3 Naoman Khan',
              city: 'Islamabad, India',
              isSelected: false,
            ),
            SizedBox(height: 20),
            Text(
              'Payment Methods',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            PaymentMethodCard(
              logo: 'https://www.google.com/search?q=hbl+logo&oq=hbl+logo&gs_lcrp=EgZjaHJvbWUyCQgAEEUYORiABDIHCAEQABiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDIHCAUQABiABDIHCAYQABiABDIJCAcQABgKGIAEMgcICBAAGIAEMgcICRAAGIAEqAIIsAIB&sourceid=chrome&ie=UTF-8#vhid=TfhZBR1Ytie-gM&vssid=l', // Placeholder for RBL Bank logo
              cardName: 'HBL Bank Credit Card',
              cardNumber: '5256 11** **** 2407',
              isSelected: true,
            ),
            PaymentMethodCard(
              logo: 'https://www.google.com/search?q=hbl+logo&oq=hbl+logo&gs_lcrp=EgZjaHJvbWUyCQgAEEUYORiABDIHCAEQABiABDIHCAIQABiABDIHCAMQABiABDIHCAQQABiABDIHCAUQABiABDIHCAYQABiABDIJCAcQABgKGIAEMgcICBAAGIAEMgcICRAAGIAEqAIIsAIB&sourceid=chrome&ie=UTF-8#vhid=TfhZBR1Ytie-gM&vssid=l', // Placeholder for Citi Bank logo
              cardName: 'UBL Bank Credit Card',
              cardNumber: '374245 11** **** 0126',
              isSelected: false,
            ),
            PaymentMethodCard(
              logo: 'https://via.placeholder.com/40', // Placeholder for Google Pay logo
              cardName: 'Google Pay',
              cardNumber: '017010010567',
              isSelected: false,
            ),
            SizedBox(height: 20),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total shipping'),
                  Text('Free'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal'),
                  Text('5400rs'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('5400rs', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final String address;
  final String city;
  final bool isSelected;

  AddressCard({
    required this.address,
    required this.city,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(Icons.location_on, color: Colors.green),
        title: Text(address),
        subtitle: Text(city),
        trailing: isSelected ? Icon(Icons.check_circle, color: Colors.green) : null,
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String logo;
  final String cardName;
  final String cardNumber;
  final bool isSelected;

  PaymentMethodCard({
    required this.logo,
    required this.cardName,
    required this.cardNumber,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Image.network(logo, width: 40, height: 40),
        title: Text(cardName),
        subtitle: Text(cardNumber),
        trailing: isSelected ? Icon(Icons.check_circle, color: Colors.green) : null,
      ),
    );
  }
}
