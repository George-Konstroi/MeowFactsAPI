unit UnitSendEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, IdSMTP, IdMessage, IdSSL, IdExplicitTLSClientServerBase, IdSSLOpenSSL;

type
  SendEmail = class
    private
      SMTP: TIdSMTP;
      Email: TIdMessage;
    public
      procedure CreateConection();
      procedure SendEmail(from, fact: string);
    destructor Destroy; override;
  end;

implementation

procedure SendEmail.CreateConection();
begin
  SMTP := TIdSMTP.Create(nil);
  SMTP.Host := 'smtp.office365.com';
  SMTP.Port := 587;
  SMTP.Username := 'davibg767@outlook.com';
  SMTP.Password := 'davi123456789012';
  SMTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(SMTP);
  SMTP.AuthType := satDefault;
  SMTP.UseTLS := utUseExplicitTLS;
end;

Destructor SendEmail.Destroy;
begin
  Email.Free;
  SMTP.Free;
  inherited;
end;

procedure SendEmail.SendEmail(from, fact: string);
begin
  Email := TIdMessage.Create(nil);
  Email.From.Address := from;
  Email.Recipients.Add.Address := 'davibg767@outlook.com';
  Email.Recipients.Add.Address := from;
  Email.Subject := 'Fato curioso sobre gatos';

  Email.Body.Add(fact);

  SMTP.Connect;
  try
    SMTP.Send(Email);
  finally
    SMTP.Disconnect;
  end;
end;

end.
