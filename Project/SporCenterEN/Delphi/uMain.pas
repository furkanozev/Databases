unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    QryMember: TADOQuery;
    DataSource1: TDataSource;
    QryMemberrecordno: TAutoIncField;
    QryMembercenterid: TIntegerField;
    QryMembermembername: TStringField;
    QryMembermembersurname: TStringField;
    QryMemberidnumber: TStringField;
    QryMemberphone: TStringField;
    QryMembergender: TStringField;
    QryMemberrecorddate: TDateTimeField;
    QryMemberbirthdate: TDateTimeField;
    QryMembermemberaddress: TStringField;
    QryMembermemberdestricption: TStringField;
    QryMemberbalance: TFMTBCDField;
    QryCenter: TADOQuery;
    DataSource2: TDataSource;
    QryCenterrecordno: TAutoIncField;
    QryCentercentername: TStringField;
    QryCenterphone: TStringField;
    QryCenterwebsite: TStringField;
    QryCentermail: TStringField;
    QryCenterpostacode: TStringField;
    QryCentertaxnumber: TStringField;
    QryCentercenteraddress: TStringField;
    QryCentercenterdestricption: TStringField;
    QryCentermembercount: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    DBMemo2: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    QryMembercentername: TStringField;
    QryMemberPaymentList: TADOQuery;
    DataSource3: TDataSource;
    QryMemberPaymentListmembername: TStringField;
    QryMemberPaymentListmembersurname: TStringField;
    QryMemberPaymentListrecorddate: TDateTimeField;
    QryMemberPaymentListdocumentnumber: TStringField;
    QryMemberPaymentListpaymenttype: TStringField;
    QryMemberPaymentListprocesstype: TStringField;
    QryMemberPaymentListamount: TFMTBCDField;
    QryMemberPaymentListpaymentdestricption: TStringField;
    DBGrid2: TDBGrid;
    Label11: TLabel;
    TabSheet2: TTabSheet;
    QryMember2: TADOQuery;
    DataSource4: TDataSource;
    QryMember2recordno: TAutoIncField;
    QryMember2centerid: TIntegerField;
    QryMember2membername: TStringField;
    QryMember2membersurname: TStringField;
    QryMember2idnumber: TStringField;
    QryMember2phone: TStringField;
    QryMember2gender: TStringField;
    QryMember2recorddate: TDateTimeField;
    QryMember2birthdate: TDateTimeField;
    QryMember2memberaddress: TStringField;
    QryMember2memberdestricption: TStringField;
    QryMember2balance: TFMTBCDField;
    QryMemberPayment: TADOQuery;
    DataSource5: TDataSource;
    QryMemberPaymentrecordno: TAutoIncField;
    QryMemberPaymentmemberid: TIntegerField;
    QryMemberPaymentrecorddate: TDateTimeField;
    QryMemberPaymentdocumentnumber: TStringField;
    QryMemberPaymentpaymenttype: TSmallintField;
    QryMemberPaymentprocesstype: TSmallintField;
    QryMemberPaymentamount: TFMTBCDField;
    QryMemberPaymentpaymentdestricption: TStringField;
    Label12: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBComboBox1: TDBComboBox;
    Label16: TLabel;
    DBComboBox2: TDBComboBox;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    Label18: TLabel;
    DBEdit10: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBGrid3: TDBGrid;
    QryMemberPaymentmembername: TStringField;
    DBGrid4: TDBGrid;
    Label19: TLabel;
    TabSheet3: TTabSheet;
    DBGrid5: TDBGrid;
    QryLeftJoin: TADOQuery;
    DataSource6: TDataSource;
    QryLeftJoinrecordno: TAutoIncField;
    QryLeftJoincentername: TStringField;
    QryLeftJoinequipmentname: TStringField;
    QryLeftJoinprice: TFMTBCDField;
    TabSheet4: TTabSheet;
    DBGrid6: TDBGrid;
    QryRightJoin: TADOQuery;
    DataSource7: TDataSource;
    QryRightJoinstaffname: TStringField;
    QryRightJoinstaffsurname: TStringField;
    QryRightJointitle: TStringField;
    QryFullJoin: TADOQuery;
    DataSource8: TDataSource;
    QryFullJoindietname: TStringField;
    QryFullJoindietdestricption: TStringField;
    QryFullJoinfood: TStringField;
    TabSheet5: TTabSheet;
    DBGrid7: TDBGrid;
    Qrymemberdietlist: TADOQuery;
    DataSource9: TDataSource;
    TabSheet6: TTabSheet;
    DBGrid8: TDBGrid;
    Qrymemberdietlistmembername: TStringField;
    Qrymemberdietlistmembersurname: TStringField;
    Qrymemberdietlistdietname: TStringField;
    Qrymemberdietlistdietdestricption: TStringField;
    Qrymemberdietlistactiveday: TStringField;
    Qrymemberdietlistactivetime: TStringField;
    Qrymemberdietlistfood: TStringField;
    Qrymemberexerciselist: TADOQuery;
    DataSource10: TDataSource;
    Qrymemberexerciselistmembername: TStringField;
    Qrymemberexerciselistmembersurname: TStringField;
    Qrymemberexerciselistexgroupname: TStringField;
    Qrymemberexerciselistexdays: TStringField;
    Qrymemberexerciseliststarttime: TStringField;
    Qrymemberexerciselistendtime: TStringField;
    TabSheet7: TTabSheet;
    DBGrid9: TDBGrid;
    Qrymemberstafflist: TADOQuery;
    DataSource11: TDataSource;
    Qrymemberstafflistmembername: TStringField;
    Qrymemberstafflistmembersurname: TStringField;
    Qrymemberstaffliststaffname: TStringField;
    Qrymemberstaffliststaffsurname: TStringField;
    TabSheet8: TTabSheet;
    DBGrid10: TDBGrid;
    Qrymembermeasurelist: TADOQuery;
    DataSource12: TDataSource;
    Qrymembermeasurelistmembername: TStringField;
    Qrymembermeasurelistmembersurname: TStringField;
    Qrymembermeasurelistmeasuredate: TDateTimeField;
    Qrymembermeasurelistmembersize: TFMTBCDField;
    Qrymembermeasurelistmemberweight: TFMTBCDField;
    Qrymembermeasurelistmemberchest: TFMTBCDField;
    Qrymembermeasurelistmemberwaist: TFMTBCDField;
    Qrymembermeasurelistmemberleg: TFMTBCDField;
    TabSheet9: TTabSheet;
    DBGrid11: TDBGrid;
    TabSheet10: TTabSheet;
    DBGrid12: TDBGrid;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QryMemberAfterPost(DataSet: TDataSet);
    procedure QryMemberAfterDelete(DataSet: TDataSet);
    procedure QryMemberPaymentAfterPost(DataSet: TDataSet);
    procedure QryMemberPaymentAfterOpen(DataSet: TDataSet);
    procedure QryMemberPaymentAfterDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses uGenelLib, uD_Connection;

procedure TFrmMain.Button1Click(Sender: TObject);
var
  qryExec : TADOQuery;
begin
  qryExec := TADOQuery.Create(nil);
  try
    qryExec.Connection := D_Connection.DBConnection;
    qryExec.SQL.Text := 'EXEC procCenterMemberCountFind';
    qryExec.ExecSQL;
    QryCenter.Close;
    QryCenter.Open;
  finally
    FreeAndNil(qryExec)
  end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  Application.Terminate;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  QryCenter.Close;
  QryCenter.Open;
  QryMember.Close;
  QryMember.Open;
  QryMemberPaymentList.Close;
  QryMemberPaymentList.Open;
  QryMemberPayment.Close;
  QryMemberPayment.Open;
  QryLeftJoin.Close;
  QryLeftJoin.Open;
  QryRightJoin.Close;
  QryRightJoin.Open;
  QryFullJoin.Close;
  QryFullJoin.Open;

  Qrymemberdietlist.Close;
  Qrymemberdietlist.Open;
  Qrymemberexerciselist.Close;
  Qrymemberexerciselist.Open;
  Qrymemberstafflist.Close;
  Qrymemberstafflist.Open;
  Qrymembermeasurelist.Close;
  Qrymembermeasurelist.Open;
end;

procedure TFrmMain.QryMemberAfterDelete(DataSet: TDataSet);
begin
  QryMemberPaymentList.Close;
  QryMemberPaymentList.Open;
  QryMember2.Close;
  QryMember2.Open;
  QryMemberPayment.Close;
  QryMemberPayment.Open;
end;

procedure TFrmMain.QryMemberAfterPost(DataSet: TDataSet);
begin
  QryMemberPaymentList.Close;
  QryMemberPaymentList.Open;
  QryMember2.Close;
  QryMember2.Open;
  QryMemberPayment.Close;
  QryMemberPayment.Open;
end;

procedure TFrmMain.QryMemberPaymentAfterDelete(DataSet: TDataSet);
begin
  QryMember2.Close;
  QryMember2.Open;
  QryMemberPaymentList.Close;
  QryMemberPaymentList.Open;
end;

procedure TFrmMain.QryMemberPaymentAfterOpen(DataSet: TDataSet);
begin
  QryMember2.Close;
  QryMember2.Open;
end;

procedure TFrmMain.QryMemberPaymentAfterPost(DataSet: TDataSet);
begin
  QryMember2.Close;
  QryMember2.Open;
  QryMemberPaymentList.Close;
  QryMemberPaymentList.Open;
end;

end.
