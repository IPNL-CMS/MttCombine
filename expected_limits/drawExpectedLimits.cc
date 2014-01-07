#include "tdrstyle.C"

void drawExpectedLimits() {
  setTDRStyle();
  gStyle->SetOptStat(0);

  TTree* tree = (TTree*) _file0->Get("limit");
  tree->Project("l", "limit");

  TH1* l = l;
  l->Rebin(2);
  l->SetLineColor(kBlack);

  TH1F* copy_95 = (TH1F*)l->Clone(Form("%s_copy_95", l->GetTitle()));
  TH1F* copy_68 = (TH1F*)copy_95->Clone(Form("%s_copy_95", copy_95->GetTitle()));


  double xq[] = {0.025, 0.16, 0.5, 0.84, 0.975};
  double yq[5] = {0.};

  l->GetQuantiles(5, yq, xq);

  l->SetYTitle("Number of M.C. toys");
  l->SetXTitle("95% C.L upper limit on #sigma(pp #rightarrow Z') (pb)");

  l->Draw();

  int nBins = copy_95->GetNbinsX();
  for (int i = 1; i <= nBins; i++) {
    double x_95 = copy_95->GetBinCenter(i);

    if (x_95 < yq[0] || x_95 > yq[4])
      copy_95->SetBinContent(i, 0);

    double x_68 = copy_68->GetBinCenter(i);

    if (x_68 < yq[1] || x_68 > yq[3])
      copy_68->SetBinContent(i, 0);
  }

  copy_95->SetFillStyle(1001);
  copy_95->SetFillColor(kGray);
  copy_95->Draw("same");

  copy_68->SetFillStyle(1001);
  copy_68->SetFillColor(kGray + 1);
  copy_68->Draw("same");

  TLine* median = new TLine(yq[2], 0, yq[2], l->GetMaximum());
  median->SetLineColor(kRed);
  median->SetLineWidth(2);
  median->SetLineStyle(9);

  median->Draw("same");

  TLatex t;
  t.SetNDC();
  t.SetTextSize(0.04);
  t.SetTextFont(42);

  /*gPad->SetTopMargin(0.05); 
  gPad->SetBottomMargin(0.12); 
  gPad->SetLeftMargin(0.17);
  gPad->SetRightMargin(0.050);*/

  t.SetTextAlign(31);
  t.DrawLatex(0.96, 0.90, "#font[42]{CMS preliminary}");
  t.DrawLatex(0.96, 0.86, TString::Format("#font[42]{%0.2f fb^{-1} at #sqrt{s}=8 TeV}", 19.58));

}
