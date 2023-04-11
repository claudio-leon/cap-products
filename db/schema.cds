namespace com.logali;

type Name             : String(50);

type Gender : String enum {
    male;
    female;
};

type Order {
    clientGender: Gender;
    status : Integer enum {
        submitted = 1;
        fulfiller = 2;
        shipped = 3;
        cancel = -1;
    };
    priority : String @assert.range enum {
        high;
        medium;
        low;
    };
};

/*
UUID
String LargeString
Binary LargeBinary
Boolean
Integer Integer64
Decimal
DateTime Timestamp
hana.
*/

type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

entity Products {
    key ID               : UUID;
        Name             : String not null;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID      : UUID;
        Name    : Products:Name;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};


entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReviews {
    key ID           : UUID;
        ToProduct_id : UUID;
        CreatedAt    : DateTime;
        Name         : String;
        Rating       : Integer;
        Comment      : String;
};

entity SalesData {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
};

type EmailsAddress_01 : many {
    kind  : String;
    email : String;
};

type EmailsAddress_02 {
    kind  : String;
    email : String;
};

entity Emails {
    email_01 :      EmailsAddress_01;
    email_02 : many EmailsAddress_02;
    email_03 : many {
        kind  : String;
        email : String;
    }
};

entity Car {
    key ID : UUID;
    name : String;
    virtual discount_1 : Decimal;
    @Core.Computed : false
    virtual discount_2 : Decimal;
};