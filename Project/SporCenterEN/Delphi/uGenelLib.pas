unit uGenelLib;

interface

  uses SysUtils, Vcl.Forms, Classes, Winapi.Windows;

  procedure MesajAbort(const ASart:Boolean; AMesaj:String);

implementation

procedure MesajAbort(const ASart:Boolean; AMesaj:String);
begin
  if ASart then
  begin
    Application.MessageBox(PChar(AMesaj), 'Uyarý', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2 + MB_SYSTEMMODAL);
    Abort;
  end;
end;

end.
