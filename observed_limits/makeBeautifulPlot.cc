{
  #include "../tdrstyle.C"
  setTDRStyle();

  TCanvas* c = (TCanvas*) _file0->Get("IntervalPlot");

  TH1* hist = (TH1*) c->GetPrimitive("MCMCposterior_hist");

  hist->GetYaxis()->SetTitleSize(0.043);
  hist->GetYaxis()->SetTitle("Posterior");

  hist->GetXaxis()->SetTitleSize(0.043);
  hist->GetXaxis()->SetTitle("Observed upper limit on #sigma(pp #rightarrow Z') (pb)");

  hist->SetLineColor(kBlack);

  TH1* copy = (TH1*) c->GetPrimitive("_copy");
  copy->SetLineColor(kBlack);

  TLatex t;
  t.SetNDC();
  t.SetTextSize(0.04);
  t.SetTextFont(42);

  /*gPad->SetTopMargin(0.05); 
  gPad->SetBottomMargin(0.12); 
  gPad->SetLeftMargin(0.17);
  gPad->SetRightMargin(0.050);*/

  t.DrawLatex(0.59, 0.80, "#font[42]{CMS preliminary}");
  t.DrawLatex(0.59, 0.76, TString::Format("#font[42]{%0.2f fb^{-1} at #sqrt{s}=8 TeV}", 19.58));
  //t.DrawLatex(0.53, 0.80, legendLabel);

  c->Draw();
  c->Print("posterior_plot.pdf");
}
