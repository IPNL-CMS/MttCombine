{
  TTree* tree = (TTree*) _file0->Get("limit");
  tree->Project("l", "limit");
  tree->Project("l_error", "limitErr");

  std::cout << "Observed limit " << l->GetMean() << " pb, +/- " << l_error->GetMean() << std::endl;
  //std::cout << l->GetMean() << std::endl;
}
