page 50103 ApiTestJobs
{
    PageType = API;
    Caption = 'TestJobs';
    APIPublisher = 'andersg';
    APIGroup = 'DvTest';
    APIVersion = 'v2.0';
    EntityName = 'testJob';
    EntitySetName = 'testJobs';
    SourceTable = TestJob;
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                {
                    ApplicationArea = All;
                    Caption = 'Id';
                    Editable = true;
                }

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
                    Caption = 'Additional Notes Blob';
                    Editable = true;
                }

                field(AddNotesText; AddNotesText)
                {
                    ApplicationArea = All;
                    Caption = 'Additional Notes text';
                    Editable = true;
                    MultiLine = true;

                    trigger OnValidate()
                    var
                        lvOutStream: OutStream;
                    begin
                        Clear(Rec."Additional Notes");
                        Rec."Additional Notes".CreateOutStream(lvOutStream, TextEncoding::UTF8);
                        AddNotesText.Write(lvOutStream);
                        Rec.Modify(true);
                    end;
                }
            }
        }
    }

    var
        AddNotesText: BigText;

    trigger OnAfterGetCurrRecord()
    var
        lvJobPlanLine: Record "Job Planning Line";
        lvInStream: InStream;
    begin
        clear(AddNotesText);
        Rec.CalcFields("Additional notes");
        Rec."Additional Notes".CreateInStream(lvInStream, TextEncoding::UTF8);
        AddNotesText.Read(lvInStream);
    end;
}