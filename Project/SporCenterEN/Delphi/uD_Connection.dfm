object D_Connection: TD_Connection
  OldCreateOrder = False
  Height = 445
  Width = 444
  object DBConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=SportCenter;Data Source=DESK' +
      'TOP-PVUS3JV'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 96
    Top = 64
  end
  object QryUser: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from userlogin')
    Left = 96
    Top = 136
    object QryUserrecordno: TAutoIncField
      FieldName = 'recordno'
      ReadOnly = True
    end
    object QryUserusername: TStringField
      FieldName = 'username'
      Size = 100
    end
    object QryUseruserpass: TStringField
      FieldName = 'userpass'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = QryUser
    Left = 96
    Top = 200
  end
end
