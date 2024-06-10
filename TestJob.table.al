table 50100 TestJob
{
    fields
    {
        field(1; "Id"; Guid)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(3; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; "Additional Notes"; Blob)
        {
            Caption = 'Additional Notes';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Id")
        {
            Clustered = true;
        }
    }
}