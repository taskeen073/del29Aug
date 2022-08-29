object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'SBCService'
  ComInitialization = ciMultiThreaded
  Description = 'SBCService'
  DisplayName = 'SBCService'
  Port = 8888
  SSLOptions.Certificate.CertFileName = 'cert.pem'
  SSLOptions.Certificate.KeyFileName = 'key.pem'
  SSLOptions.Certificate.RootCertFileName = 'root.pem'
  Version = '15.2.37'
  SessionOptions.RestartExpiredSession = True
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
end
