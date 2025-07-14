import 'package:ecommerce_app/features/shipping%20address/models/address.dart';

class AddressRepository {
  List<Address> getAddreses() {
    return [
      Address(
        id: '1',
        label: 'Home',
        fullAddress: '123 Main Street, Apt 4B',
        city: 'New York',
        state: 'NY',
        zipCode: '10001',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'Office',
        fullAddress: '324 Besiness Ave, Suite 200',
        city: 'New York',
        state: 'NY',
        zipCode: '10002',

        type: AddressType.office,
      ),
    ];
  }

  Address? getDefaultAddress() {
    return getAddreses().firstWhere(
      (address) => address.isDefault,
      orElse: () => getAddreses().first,
    );
  }
}
