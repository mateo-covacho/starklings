// structs3.cairo
// Structs contain data, but can also have logic. In this exercise we have
// defined the Package struct and we want to test some logic attached to it.
// Make the code compile and the tests pass!

#[derive(Copy, Drop)]
struct Package {
    sender_country: felt252,
    recipient_country: felt252,
    weight_in_grams: u32,
}

trait PackageTrait {
    fn new(sender_country: felt252, recipient_country: felt252, weight_in_grams: u32) -> Package;
    fn is_international(self: @Package) -> bool;
    fn get_fees(self: @Package, cents_per_gram: u32) -> u32;
}

impl PackageImpl of PackageTrait {
    fn new(sender_country: felt252, recipient_country: felt252, weight_in_grams: u32) -> Package {
        Package { sender_country, recipient_country, weight_in_grams, }
    }

    fn is_international(self: @Package) -> bool {
        *self.sender_country != *self.recipient_country
    }

    fn get_fees(self: @Package, cents_per_gram: u32) -> u32 {
        *self.weight_in_grams * cents_per_gram
    }
}

#[cfg(test)]
mod tests {
    use super::{Package, PackageTrait};

    #[test]
    fn calculate_fee() {
        let sender_country = 'Spain';
        let recipient_country = 'Spain';

        let package = Package::new(sender_country, recipient_country, 1500);

        let cents_per_gram = 3;

        let fee = package.get_fees(cents_per_gram);

        assert(fee == 4500, 'Fee should be 4500');
    }

    #[test]
    fn is_international() {
        let sender_country = 'Spain';
        let recipient_country = 'Spain';

        let domestic_package = Package::new(sender_country, recipient_country, 1000);

        assert(!domestic_package.is_international(), 'Should not be international');

        let sender_country2 = 'Spain';
        let recipient_country2 = 'Portugal';

        let international_package = Package::new(sender_country2, recipient_country2, 1000);

        assert(international_package.is_international(), 'Should be international');
    }
}

