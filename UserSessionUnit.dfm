object IWUserSession: TIWUserSession
  OldCreateOrder = False
  OnCreate = IWUserSessionBaseCreate
  OnBeforeExecuteForm = IWUserSessionBaseBeforeExecuteForm
  Height = 347
  Width = 466
  object DB: TUniConnection
    ProviderName = 'sQL Server'
    Database = 'sbcservice'
    Username = 'sbc'
    Server = 'sbcservice.dyndns.info'
    LoginPrompt = False
    OnConnectionLost = DBConnectionLost
    Left = 40
    Top = 72
    EncryptedPassword = '8FFF93FF9EFF8BFF96FF91FF8AFF92FF'
  end
  object config: TUniConnection
    ProviderName = 'sQL Server'
    Username = 'sbc'
    LoginPrompt = False
    OnConnectionLost = configConnectionLost
    Left = 40
    Top = 128
    EncryptedPassword = '8FFF93FF9EFF8BFF96FF91FF8AFF92FF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 120
    Top = 96
  end
end
