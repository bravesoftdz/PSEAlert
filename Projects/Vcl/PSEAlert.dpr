// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_DELETEMAPFILE ON
program PSEAlert;

uses
  Vcl.Forms,
  PSEAlert.MainForm in '..\..\View\Vcl\PSEAlert.MainForm.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  PSEAlert.AlertForm in '..\..\View\Vcl\PSEAlert.AlertForm.pas' {frmAlert},
  PSEAlert.Frames.Settings in '..\..\View\Vcl\PSEAlert.Frames.Settings.pas' {frameSettings: TFrame},
  PSEAlert.Frames.StockAlert in '..\..\View\Vcl\PSEAlert.Frames.StockAlert.pas' {frameStockAlert: TFrame},
  PSEAlert.Frames.StockAlertEntry in '..\..\View\Vcl\PSEAlert.Frames.StockAlertEntry.pas' {frameStockAlertEntry: TFrame},
  PSEAlert.Frames.StockPrice in '..\..\View\Vcl\PSEAlert.Frames.StockPrice.pas' {frameStockPrice: TFrame},
  PSE.Data.Downloader in '..\..\Data\PSE.Data.Downloader.pas',
  PSE.Data.Model in '..\..\Data\PSE.Data.Model.pas',
  PSE.Data in '..\..\Data\PSE.Data.pas',
  PSE.Data.Repository in '..\..\Data\PSE.Data.Repository.pas',
  PSEAlert.Controller.MainForm in '..\..\Controller\PSEAlert.Controller.MainForm.pas',
  PSEAlert.Controller.Settings in '..\..\Controller\PSEAlert.Controller.Settings.pas',
  PSEAlert.Controller.StockAlert in '..\..\Controller\PSEAlert.Controller.StockAlert.pas',
  PSEAlert.Controller.StockAlertEntry in '..\..\Controller\PSEAlert.Controller.StockAlertEntry.pas',
  PSEAlert.Controller.StockPrice in '..\..\Controller\PSEAlert.Controller.StockPrice.pas',
  Yeahbah.GenericQuery in '..\..\Common\YeahbahLib\Yeahbah.GenericQuery.pas',
  Yeahbah.GenericQueryTypes in '..\..\Common\YeahbahLib\Yeahbah.GenericQueryTypes.pas',
  Yeahbah.Messaging in '..\..\Common\YeahbahLib\Yeahbah.Messaging.pas',
  Yeahbah.ObjectClone in '..\..\Common\YeahbahLib\Yeahbah.ObjectClone.pas',
  PSEAlert.View.ExceptionDialog in '..\..\View\Vcl\PSEAlert.View.ExceptionDialog.pas' {frmException},
  PSEAlert.Messages in '..\..\Common\PSEAlert.Messages.pas',
  PSEAlert.Settings in '..\..\Common\PSEAlert.Settings.pas',
  PSEAlert.Utils in '..\..\Common\PSEAlert.Utils.pas',
  PSE.Data.Model.JSON in '..\..\Data\PSE.Data.Model.JSON.pas',
  PSE.Data.Deserializer in '..\..\Data\PSE.Data.Deserializer.pas',
  SvSerializerSuperJson,
  PSEAlert.AlertFormManager in '..\..\Common\PSEAlert.AlertFormManager.pas',
  PSEAlert.Frames.StockFilter in '..\..\View\Vcl\PSEAlert.Frames.StockFilter.pas' {frameStockFilter: TFrame},
  PSEAlert.Forms.StockDetails in '..\..\View\Vcl\PSEAlert.Forms.StockDetails.pas' {frmStockDetails},
  PSEAlert.Controller.StockDetails in '..\..\Controller\PSEAlert.Controller.StockDetails.pas',
  PSE.Data.Binding.DWScript.Functions in '..\..\Data\PSE.Data.Binding.DWScript.Functions.pas',
  PSEAlert.Service.StockFilterService in '..\..\Service\PSEAlert.Service.StockFilterService.pas',
  PSEAlert.Service.Filter.PERatioFilter in '..\..\Service\Filter\PSEAlert.Service.Filter.PERatioFilter.pas',
  PSEAlert.Service.Controller.PERatioFilter in '..\..\Service\Controller\PSEAlert.Service.Controller.PERatioFilter.pas',
  PSEAlert.Service.Filter.StockFilterItemBase in '..\..\Service\Filter\PSEAlert.Service.Filter.StockFilterItemBase.pas',
  PSEAlert.Controller.StockFilter in '..\..\Controller\PSEAlert.Controller.StockFilter.pas',
  PSEAlert.Service.View.PERatioFilter in '..\..\Service\View\PSEAlert.Service.View.PERatioFilter.pas' {framePERatioFilter: TFrame},
  PSEAlert.Forms.FilterResult in '..\..\View\Vcl\PSEAlert.Forms.FilterResult.pas' {frmFilterResult},
  PSEAlert.Controller.FilterResult in '..\..\Controller\PSEAlert.Controller.FilterResult.pas',
  PSEAlert.Service.View.HighLow52Filter in '..\..\Service\View\PSEAlert.Service.View.HighLow52Filter.pas' {frameHighLow52Filter: TFrame},
  PSEAlert.Service.Controller.HighLow52 in '..\..\Service\Controller\PSEAlert.Service.Controller.HighLow52.pas',
  PSEAlert.Service.View.SharePriceFilter in '..\..\Service\View\PSEAlert.Service.View.SharePriceFilter.pas' {frameSharePriceFilter: TFrame},
  PSEAlert.Service.Filter.HighLow52Filter in '..\..\Service\Filter\PSEAlert.Service.Filter.HighLow52Filter.pas',
  PSEAlert.Service.Filter.SharePriceFilter in '..\..\Service\Filter\PSEAlert.Service.Filter.SharePriceFilter.pas',
  PSEAlert.Service.Controller.SharePriceFilter in '..\..\Service\Controller\PSEAlert.Service.Controller.SharePriceFilter.pas',
  PSEAlert.Service.UpgradeService in '..\..\Service\PSEAlert.Service.UpgradeService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle(PSEAlertSettings.Skin);
  //Application.CreateForm(TfrmMain, frmMain);
  CreateMainFormController(TObject.Create);

  Application.Run;
end.
