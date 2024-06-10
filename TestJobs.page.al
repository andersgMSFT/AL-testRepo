page 50100 TestJobs
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestJob;
    CardPageId = TestJobCard;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    Editable = true;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    Editable = true;
                }

                field(AdditionalNotes; Rec."Additional Notes")
                {
                    ApplicationArea = All;
                    Caption = 'Additional Notes';
                    Editable = true;
                }
            }
        }
    }
}