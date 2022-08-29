object frscheduledetail: Tfrscheduledetail
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object scheduleback: TIWButton
    Left = 56
    Top = 64
    Width = 120
    Height = 30
    Caption = 'scheduleback'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'scheduleback'
    OnClick = schedulebackClick
  end
  object IWEdit1: TIWEdit
    Left = 176
    Top = 184
    Width = 200
    Height = 32
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
  end
  object IWEdit2: TIWEdit
    Left = 176
    Top = 222
    Width = 200
    Height = 32
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWEdit2'
    SubmitOnAsyncEvent = True
  end
  object UniQuery1: TUniQuery
    Connection = IWUserSession.DB
    SQL.Strings = (
      'select id,customer from jobservice '
      'where id = :id')
    CachedUpdates = True
    Left = 416
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object qfndcus: TUniQuery
    Connection = IWUserSession.DB
    SQL.Strings = (
      
        'select id,cast(code as nvarchar) as code,cast(name as varchar) a' +
        's name from customer'
      'where linegrouptoken is not null and  id= :id')
    Left = 416
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
end
