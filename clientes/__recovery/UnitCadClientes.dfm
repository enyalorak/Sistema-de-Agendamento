�
 TFRMCADCLIENTES 0!
  TPF0TFrmCadClientesFrmCadClientesLeft Top BorderIconsbiSystemMenu BorderStylebsSingleCaptionCadastro ClientesClientHeight�ClientWidthpColorclLightpinkFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameSegoe UI
Font.Style PositionpoScreenCenterOnCreate
FormCreate
TextHeight TLabel LeftTop[Width$HeightCaptionNomeFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabel LeftTop� Width,HeightCaptionTelefoneFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabel LeftTop� WidthHeightCaptionEmailFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameSegoe UI
Font.Style 
ParentFont  TLabelLabel1Left� TopWidth8Height%CaptionCADASTRO DE CLIENTESFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.Name
Nirmala UI
Font.StylefsBold 
ParentFontLayouttlCenter  TLabel LeftTop#WidthuHeightCaptionData de CadastroFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameSegoe UI Light
Font.Style 
ParentFont  TEditedtNameLeftToppWidth� HeightColorclBlanchedalmondTabOrder   TEditedtTelefoneLeftTop� Width� HeightColorclBlanchedalmondTabOrder  TEditedtEmailLeftTop� Width� HeightColorclBlanchedalmondTabOrder  TEdit LeftTop8Width� HeightColorclBlanchedalmondTabOrder  TButtonbtnCadastrarClienteLeft'TophWidthKHeight!Caption	CADASTRARTabOrderOnClickbtnCadastrarClienteClick  TDBGridDBGrid1Left(Top� Width,Heightx
DataSourceDataSource1TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameSegoe UITitleFont.Style   TButton
btnExcluirLeft� TophWidthSHeight!CaptionEXCLUIRTabOrderOnClickbtnExcluirClick  TFDConnectionFDConnParams.StringsNDatabase=C:\Users\Usuario\Documents\Embarcadero\trabalho\gleicianenails\DB.FDBUser_Name=SYSDBAPassword=masterkeyDriverID=FB 	Connected	Left8Top�   TFDQueryFDQueryCliente
ConnectionFDConnSQL.StringskINSERT INTO Clientes (Nome, Telefone, Email, DataCadastro) VALUES (:Nome, :Telefone, :Email, :DataCadastro) Left�Top� 	ParamDataNameNOME	ParamTypeptInput NameTELEFONE	ParamTypeptInput NameEMAIL	ParamTypeptInput NameDATACADASTRO	ParamTypeptInput    TDataSourceDataSource1DataSetFDQueryClienteLeft�Top�    