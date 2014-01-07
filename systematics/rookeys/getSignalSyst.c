{
  TTree* tree = (TTree*) _file0->Get("tree_fit_sb");
  tree->Project("l", "mu");

  l->Rebin(4);

  TF1* g = new TF1("g", "gaus");
  l->Fit(g, "Q");

  cout << "Signal syst: " << g->GetParameter(2) << std::endl;
  cout << "For datacard: " << 1 + g->GetParameter(2) << std::endl;
}
