// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50101 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}
codeunit 50101 MySubscriber
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, 18, 'OnBeforeValidateEvent', 'Address', true, true)]
    local procedure CheckAddressLine(var Rec : Record Customer)
    begin
        //Message('tékk');
        if (StrPos(Rec.Address , '+') > 0) then begin
            Message('Cannot use a plus sign (+) in the addresss');
        end;
    end;
}

tableextension 50101 CustomerTable  extends Customer
{
    
    fields
    {
            
    }

    
}