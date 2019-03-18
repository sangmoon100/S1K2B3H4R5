unit pkc11303;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, MemDS, DBAccess, Ora;

type
  TDM = class(TDataModule)
    Qry_Pkyearadd: TOraQuery;
    Query1: TOraQuery;
    Qry_rpt: TOraQuery;
    DataSource2: TDataSource;
    Qry_othis: TOraQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField4: TStringField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    Qry_PkyearaddWORKYY: TStringField;
    Qry_PkyearaddEMPNO: TStringField;
    Qry_PkyearaddADDAMT1: TFloatField;
    Qry_PkyearaddADDAMT2: TFloatField;
    Qry_PkyearaddADDAMT3: TFloatField;
    Qry_PkyearaddADDAMT4: TFloatField;
    Qry_PkyearaddADDAMT5: TFloatField;
    Qry_PkyearaddADDAMT6: TFloatField;
    Qry_PkyearaddADDSUM: TFloatField;
    Qry_PkyearaddADMINMEMO: TStringField;
    Qry_PkyearaddWRITETIME: TStringField;
    Qry_PkyearaddWRITEMAN: TStringField;
    Qry_PkyearaddKORNAME: TStringField;
    Query2: TOraQuery;
    Qry_PkyearaddBAND: TStringField;
    Ory_Pkyeartax: TOraQuery;
    Ory_PkyeartaxPAYDATE: TStringField;
    Ory_PkyeartaxPAYTYPE: TStringField;
    Ory_PkyeartaxEMPNO: TStringField;
    Ory_PkyeartaxYEARTAX: TFloatField;
    Ory_PkyeartaxFIXPAY: TFloatField;
    Ory_PkyeartaxODTAXAMT: TFloatField;
    Ory_PkyeartaxSPTMAMT: TFloatField;
    Ory_PkyeartaxOVTMAMT: TFloatField;
    Ory_PkyeartaxOVMCAMT: TFloatField;
    Ory_PkyeartaxAIDAMT1: TFloatField;
    Ory_PkyeartaxTAXPAY1: TFloatField;
    Ory_PkyeartaxBOKJISUPAMT: TFloatField;
    Ory_PkyeartaxMCARTAXAMT: TFloatField;
    Ory_PkyeartaxCHILDEDUAMT: TFloatField;
    Ory_PkyeartaxYUEDUTAX: TFloatField;
    Ory_PkyeartaxTRAINSUPAMT: TFloatField;
    Ory_PkyeartaxLECTSUPAMT: TFloatField;
    Ory_PkyeartaxSELFEDUAMT: TFloatField;
    Ory_PkyeartaxYBONAMT: TFloatField;
    Ory_PkyeartaxSBONAMT: TFloatField;
    Ory_PkyeartaxSOPAYSUM: TFloatField;
    Ory_PkyeartaxMEDSUPAMT: TFloatField;
    Ory_PkyeartaxHOMESUPAMT: TFloatField;
    Ory_PkyeartaxAIDAMT2: TFloatField;
    Ory_PkyeartaxTAXPAY2: TFloatField;
    Ory_PkyeartaxTAXPAY3: TFloatField;
    Ory_PkyeartaxTAXPAY4: TFloatField;
    Ory_PkyeartaxLONGSUPAMT: TFloatField;
    Ory_PkyeartaxCLOSEYN: TStringField;
    Ory_PkyeartaxTAXAMT: TFloatField;
    Ory_PkyeartaxADMINYN: TStringField;
    Ory_PkyeartaxADMINMEMO: TStringField;
    Ory_PkyeartaxWRITETIME: TStringField;
    Ory_PkyeartaxWRITEMAN: TStringField;
    Ory_PkyeartaxPAYCNT: TIntegerField;
    Ory_PkyeartaxADDTAXAMT: TFloatField;
    Ory_PkyeartaxKORNAME: TStringField;
    Ory_Pkyeartax_Save: TOraQuery;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField26: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    StringField13: TStringField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    IntegerField1: TIntegerField;
    Ory_Pkyeartax_Save2: TOraQuery;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    FloatField70: TFloatField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    FloatField78: TFloatField;
    FloatField79: TFloatField;
    FloatField80: TFloatField;
    FloatField81: TFloatField;
    StringField22: TStringField;
    FloatField82: TFloatField;
    FloatField83: TFloatField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    IntegerField2: TIntegerField;
    Ory_PkyeartaxTAXRATE: TIntegerField;
    Ory_PkyeartaxROLEAMT: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses pkc11304;

{$R *.DFM}



end.
