#include <math.h>
#include <stdlib.h>
#include <vector>
#include <fstream>
#include <sstream>

#include <TROOT.h>
#include <TGraphAsymmErrors.h>
#include <TGraphErrors.h>
#include <TGraph.h>
#include <TAxis.h>
#include <TCanvas.h>
#include <TPad.h>
#include <TLegend.h>
#include <TLatex.h>

#include "tdrstyle.C"

void drawLimitCurve_log() {

  gROOT->Clear();
  gStyle->SetOptStat(0);
  setTDRStyle();

  std::vector<double> masses;
  masses.push_back(500);
  masses.push_back(625);
  masses.push_back(750);
  masses.push_back(1000);
  masses.push_back(1250);
  masses.push_back(1500);
  masses.push_back(2000);
  int n = masses.size();

  double observed[] = {1.94092, 0.676895, 0.450105, 0.568741, 0.23878, 0.330609, 0.175899};
  double expected[] = {1.91403, 0.750323, 0.556122, 0.395429, 0.358857, 0.3375, 0.218808};
  double error_high_95[] = {1.57927, 0.651769, 0.473038, 0.354771, 0.272304, 0.24543, 0.153768};
  double error_low_95[] = {0.902462, 0.339851, 0.253667, 0.180484, 0.175654, 0.157337, 0.109071};
  double error_high_68[] = {0.764572, 0.290928, 0.22068, 0.152771, 0.116849, 0.109717, 0.0740146};
  double error_low_68[] = {0.525134, 0.203437, 0.155418, 0.112257, 0.101446, 0.0971331, 0.0628379};

  double no_error[10] = {0};

  double xsections_masses[] = {500, 600, 750, 1000, 1250, 1500, 2000};
  double xsections[] = {
    17.82 * 1.3,
    10.08 * 1.3,
    4.31 * 1.3,
    1.24 * 1.3,
    0.441 * 1.3,
    0.160 * 1.3,
    2.75E-02 * 1.3
  };

  TCanvas* c1 = new TCanvas("canvas", "canvas", 600, 600);

  TGraphAsymmErrors* gra95 = new TGraphAsymmErrors(n, &masses[0], &expected[0], no_error, no_error, &error_low_95[0], &error_high_95[0]);//the 95% band of the 95% expected limits
  gra95->SetMinimum(0);
  gra95->SetMaximum(100);
  gra95->SetTitle("95% C.L. upper limit on the cross section");
  gra95->GetXaxis()->SetTitle("m(t#bar{t}) (GeV/c^{2})")	  ;
  gra95->GetYaxis()->SetTitle("#sigma(pp #rightarrow Z') #times BR(Z' #rightarrow t#bar{t}) (pb)");
  gra95->GetXaxis()->SetNdivisions(505);
  gra95->SetFillColor(15);
  gra95->Draw("AE3");

  TGraphAsymmErrors* gra = new TGraphAsymmErrors(n, &masses[0], &expected[0], no_error, no_error, &error_low_68[0], &error_high_68[0]);//the 68% band of the 95% expected limits
  gra->SetTitle("95% C.L. upper limit on the cross section");
  gra->GetXaxis()->SetTitle("m(t#bar{t}) (GeV/c^{2})")	  ;
  gra->GetYaxis()->SetTitle("#sigma(pp #rightarrow Z') #times BR(Z' #rightarrow t#bar{t}) (pb)");
  gra->SetFillColor(18);
  gra->Draw("E3,same");

  TGraph* gra2 = new TGraph(n, &masses[0], &expected[0]); //the expected limits
  gra2->SetMarkerStyle(20);
  gra2->SetMarkerSize(1.2);
  gra2->Draw("P,same");

  TGraph* gra3 = new TGraph(7, xsections_masses, xsections);
  gra3->SetMarkerStyle(20);
  gra3->SetMarkerSize(1.2);
  gra3->SetMarkerColor(kGreen + 6);
  gra3->SetLineWidth(2);
  gra3->SetLineColor(kGreen - 5);
  gra3->SetLineStyle(kDashed);
  gra3->Draw("C,same");

  TGraphErrors* graobs = new TGraphErrors(n, &masses[0], &observed[0], no_error, no_error);//the observed limits
  graobs->SetMarkerStyle(20);
  graobs->SetMarkerColor(2);
  graobs->SetMarkerSize(1.2);
  graobs->Draw("P,same");

  TLegend* legendLimit = new TLegend(0.35, 0.68, 0.94, 0.89);
  legendLimit->SetTextFont(42);
  legendLimit->AddEntry(gra2,"Expected Upper Limit (95% CL)","p");
  legendLimit->AddEntry(graobs,"Observed Upper  Limit (95% CL)","p");
  legendLimit->AddEntry(gra,"95% CL exclusion: 68% band","f");
  legendLimit->AddEntry(gra95,"95% CL exclusion: 95% band","f");
  legendLimit->AddEntry(gra3, "Z' 1.2% width, Harris et al (x1.3)", "l");
  legendLimit->SetFillStyle(0);
  legendLimit->Draw("SAME");

  TLatex t;
  t.SetTextSize(0.038);
  t.SetTextFont(42);
  t.SetNDC();
  t.DrawLatex(0.53, 0.62, "#font[42]{CMS preliminary}");
  t.DrawLatex(0.53, 0.57, "#font[42]{19.58 fb^{-1} at #sqrt{s}=8 TeV}");

  gPad->SetLogy(true);
  gPad->Modified();

  TString prefix = "limitCurve_2012_log";

  c1->Print(prefix + ".png");
  c1->SaveAs(prefix + ".pdf");
  c1->SaveAs(prefix + ".root");
}
