{
  TTree* tree = (TTree*) _file0->Get("limit");
  tree->Project("l", "limit", "limit < 5");

  l->Rebin(2);

  double xq[] = {0.025, 0.16, 0.5, 0.84, 0.975};
  double yq[5] = {0.};

  l->GetQuantiles(5, yq, xq);

  std::cout << "Expected limits:" << std::endl;
  std::cout << "Median: " << yq[2] << std::endl;
  std::cout << "68% confidence interval: " << yq[2] - yq[1] << " - " << yq[3] - yq[2] << std::endl;
  std::cout << "95% confidence interval: " << yq[2] - yq[0] << " - " << yq[4] - yq[2] << std::endl;
}
