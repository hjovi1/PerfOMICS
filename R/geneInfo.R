#'Function: printGeneInfo()
#'
#'Purpose: prints information on each gene that is being used in the
#'TGS calculation (name of gene, function of gene, variants and frequencies)
#'
#'@export
#'@return Returns list of different genes and their descriptions.
#'

ACE <- "ACE (angiotensin I converting enzyme (peptidyl-dipeptidase A) 1).
Function: Blood Pressure regulation, Muscle performance, Lipids & Glucose levels.
Variants and Frequencies: 1=DD (0.29), 2=ID(0.50), 3=II(0.21)"

ACTN3 <- "ACTN3 (actinin, alpha 3).
	Function: Rapid Muscle Contraction.
Variants and Frequencies: 1=RR (0.30), 2=RX(0.52), 3=XX(0.18)"

ADRA2A <- "ADRA2A (adrenergic, alpha-2A-, receptor).
Function: Lipolysis Inhibition
Variants and Frequencies: 1=6.3/6.3 (0.04), 2=6.7/6.3(0.34), 3=6.7/6.7(0.62)"

ADRB2 <- "ADRB2 (adrenergic, beta-2-, receptor).
Function: Surface Lipolysis Regulation, Thermogenesis, Drug Response
Variants and Frequencies: 1=Glu27Glu (0.15), 2=Gln27Glu (0.50), 3=Gln27Gln (0.35)"

AMPD1 <- "AMPD1 (adenosine monophosphate deaminase 1 (isoform M)).
Function: Muscle Performance
Variants and Frequencies: 1=TT (0.01), 2=CT (0.19), 3=CC (0.80)"

APOE <- "APOE (apolipoprotein E). Function: Maximal oxygen uptake after exercise training.
Variants and Frequencies: 1=E2/E2&E3/E2 (0.12), 2=E3/E3&E2/E4 (0.64), 3=E4/E3&E4/E4 (0.24)."

BDKRB2 <- "BDKRB2 (bradykinin receptor B2).
Function: For Skeletal Muscle Metabolic Efficiency.
Variants and Frequencies: 1=+9+9 (0.30), 2=-9+9 (0.55), 3=-9-9 (0.15)."

CKM <- "CKM (creatine kinase, muscle).
Function: For energy consumption in muscles.
Variants and Frequencies: 1=1170/1170 (0.07), 2=985+185/1170 (0.44), 3=985+185/985+185 (0.49)"

HIF1A <- "HIF1A (hypoxia-inducible factor 1, alpha subunit (basic helix-loop-helix transcription factor).
Function: For Angiogenesis & Erythropoiesis, O2 Supply to Tissues, Basisal
Metabolic Rate, Rate of Recovery
Variants and Frequencies: 1=TT (0.02), 2=CT (0.21), 3=CC (0.71)"

VEGFA <- "VEGFA (vascular endothelial growth factor A).
Function: For O2 Supply to Tissues, Angiogenesis.
Variants and Frequencies: 1=hapgrp1 (0.25), 2=hapgrp2 (0.45), 3=hapgrp3 (0.30)"

genes <- c(ACE,ACTN3,ADRA2A,ADRB2,AMPD1,APOE,BDKRB2,CKM,HIF1A,VEGFA)
printGeneInfo <- function(){
  print(genes)
}
