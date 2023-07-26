unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm3 = class(TForm)
    RESTClientMeowFacts: TRESTClient;
    RESTRequestMeowFacts: TRESTRequest;
    RESTResponseMeowFacts: TRESTResponse;
    ButtonRequest: TButton;
    LabelResponse: TLabel;
    ImageLogo: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    ButtonEnviarPorEmail: TButton;
    Panel5: TPanel;
    EditEmail: TEdit;
    RESTClientSendGrid: TRESTClient;
    RESTRequestSendGrid: TRESTRequest;
    RESTResponseSendGrid: TRESTResponse;
    procedure ButtonRequestClick(Sender: TObject);
    procedure ButtonEnviarPorEmailClick(Sender: TObject);
  private
    { Private declarations }
    fact: string;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ButtonEnviarPorEmailClick(Sender: TObject);
begin
  if EditEmail.Text <> '' then begin
  
  end;

end;

procedure TForm3.ButtonRequestClick(Sender: TObject);
var
  _json: TJSONValue;
  _json_array: TJSONArray;
begin
  LabelResponse.Caption := '';
  RESTRequestMeowFacts.Execute;

  _json := RESTRequestMeowFacts.Response.JSONValue;
  _json_array := TJSONArray(TJSONObject(_json).GetValue('data'));
  fact := TJSONString(_json_array.Items[0]).Value;

  LabelResponse.Caption := fact;
end;

end.
