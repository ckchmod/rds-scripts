import truths
print truths.Truths(['p53','SIAH_1', 'beta_catenin', 'p19_14ARF', 'Mdm_2'], ['not (Mdm_2)', '(p53)',  'not (SIAH_1)', '(beta_catenin)', '(not p19_14ARF) or p53' ])
