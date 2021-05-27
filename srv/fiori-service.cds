annotate AdminService.Authors with
@(
    Capabilities.InsertRestrictions : {Insertable : true},
    Capabilities.UpdateRestrictions : {Updateable : true},
    Capabilities.DeleteRestrictions : {Deletable : true}
);

annotate AdminService.Authors with {
    ID           @title : '{i18n>AuthorID}';
    name         @title : '{i18n>AuthorName}';
    dateOfBirth  @title : '{i18n>DOB}';
    dateOfDeath  @title : '{i18n>DOD}';
    placeOfBirth @title : '{i18n>POB}';
    placeOfDeath @title : '{i18n>POD}';
}

annotate AdminService.Authors with
@(UI : {
    SelectionFields : [
        ID,
        dateOfBirth,
        placeOfBirth
    ],
    LineItem        : [
        {
            Value : ID,
            Label : '{i18n>AuthorID}'
        },
        {
            Value : name,
            Label : '{i18n>AuthorName}'
        },
        {
            Value : dateOfBirth,
            Label : '{i18n>DOB}'
        },
        {
            Value : dateOfDeath,
            Label : '{i18n>DOD}'
        },
        {
            Value : placeOfBirth,
            Label : '{i18n>POB}'
        },
        {
            Value : placeOfDeath,
            Label : '{i18n>POD}'
        }
    ]
});

annotate AdminService.Authors with
@(UI : {
    HeaderInfo          : {
        TypeName       : 'Author',
        TypeNamePlural : 'Authors',
        Title          : {Value : ID},
        Description    : {Value : name}
    },
    Facets              : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>General}',
            Target : '@UI.FieldGroup#General'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>BookList}',
            Target : 'books/@UI.LineItem'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Admin}',
            Target : '@UI.FieldGroup#Admin'
        }
    ],
    FieldGroup #General : {Data : [
        {Value : dateOfBirth},
        {Value : dateOfDeath},
        {Value : placeOfBirth},
        {Value : placeOfDeath}
    ]},
    FieldGroup #Admin   : {Data : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
    ]}
});

annotate AdminService.Books with
@(
    Capabilities.InsertRestrictions : {Insertable : true},
    Capabilities.UpdateRestrictions : {Updateable : true},
    Capabilities.DeleteRestrictions : {Deletable : true}
);

annotate AdminService.Books with {
    ID        @title : '{i18n>BookID}';
    title     @title : '{i18n>Title}';
    descr     @title : '{i18n>Desc}'  @UI.MultiLineText;
    author_ID @title : '{i18n>AuthorID}';
    genre_ID  @title : '{i18n>GenreID}';
    stock     @title : '{i18n>Stock}';
    price     @title : '{i18n>Price}';
    currency  @title : '{i18n>Currency}';
}

annotate AdminService.Books with
@(UI : {
    LineItem        : [
        {
            Value : ID,
            Label : '{i18n>BookID}'
        },
        {
            Value : title,
            Label : '{i18n>Title}'
        },
        {
            Value : author_ID,
            Label : '{i18n>Author}'
        },
        {
            Value : genre_ID,
            Label : '{i18n>Genre}'
        },
        {
            Value : stock,
            Label : '{i18n>Stock}'
        },
        {
            Value : price,
            Label : '{i18n>Price}'
        },
        {
            Value : currency.symbol,
            Label : ' '
        },
    ]
});