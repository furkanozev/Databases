unit uD_Connection;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TD_Connection = class(TDataModule)
    DBConnection: TADOConnection;
    QryUser: TADOQuery;
    DataSource1: TDataSource;
    QryUserrecordno: TAutoIncField;
    QryUserusername: TStringField;
    QryUseruserpass: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  D_Connection: TD_Connection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
