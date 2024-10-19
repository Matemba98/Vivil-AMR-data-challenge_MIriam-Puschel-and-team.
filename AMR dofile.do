cd"D:\Personal\AMR challenge"
import delimited "Africa data cleaned.csv", clear



**#
codebook
br
describe

**#
tostring isolateid, replace
tostring year, replace

**#
tab species

**#
tab country species, chi row
tab country species, col

**#
codebook year
tab year, nolab

encode year, gen(years)
tab years, nolab
tab years
recode years (1/4 = 1 "2005-2011") (5/9 = 2 "2012-2016") (10/14 = 3 "2017-2021"), generate(years_cat)

tab years_cat species, chi row
tab years_cat species, col

**#
tab gender species, chi row
tab gender species, col

**#
levelsof source
tab source species, row
encode source, generate(sample_source_cat)

recode sample_source_cat (7 8 19 30 34 36 39 42 45 43 = 1 "Respiratory") (1 3 16 17 22 23 27 32 33 40 = 2 "Gastrointenestinal") (4 28 47 48 49 = 3 "Urinary") (2 9 12 14 26 37 38 46 51 44 20 = 4 "Skin and Soft Tissue") (10 11 = 5 "Central Nervous System") (5 15 = 6 "Blood and Cardiovascular") (35 50 24 = 7 "Genitourinary(non-urinary)") (13 18 21 25 29 41 6 31 = 8 "Other"), gen(source_cat)

tab source_cat species, chi row
tab source_cat species, col

**#
tab agegroup
encode agegroup, gen(age)
tab age, nolab
sum age, det
codebook age
recode age (1=1 "0-18")(4=1 "0-18")(2=1 "0-18")(3=2 "19-64") (5=3 "65≥") (6=3 "65≥") (7=4 "Unknown"), gen(age_cat)

tab age_cat
hist age_cat, normal
sum age_cat, det

tab age_cat species, chi row
tab age_cat species, col

**#
tab1 ampc shv tem ctxm1 ctxm2 ctxm9 per cmy11 dha kpc oxa ndm vim

**#
foreach var of varlist ampc shv tem ctxm1 ctxm2 ctxm9 per cmy11 dha kpc oxa ndm vim {
  gen `var'_binary = (`var' != "NEG" & `var' != "")
}

**#
tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if species == "Escherichia coli"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if species == "Klebsiella pneumoniae"

**#
tab species amikacin_i, row
tab species amoxycillinclavulanate_i, row
tab species ampicillin_i, row
tab species cefepime_i, row
tab species ceftazidime_i, row
tab species ceftriaxone_i, row
tab species imipenem_i, row
tab species levofloxacin_i, row
tab species meropenem_i, row
tab species minocycline_i, row
tab species piperacillintazobactam_i, row
tab species tigecycline_i, row
tab species ampicillinsulbactam_i, row
tab species aztreonam_i, row
tab species ceftaroline_i, row
tab species ceftriaxone_i, row
tab species ceftazidimeavibactam_i, row
tab species ciprofloxacin_i, row
tab species colistin_i, row
tab species doripenem_i, row
tab species ertapenem_i, row
tab species gentamicin_i, row
tab species trimethoprimsulfa_i, row
tab species ceftolozanetazobactam_i, row
tab species meropenemvaborbactam_i, row

tab country amikacin_i, row
tab country amoxycillinclavulanate_i, row
tab country ampicillin_i, row
tab country cefepime_i, row
tab country ceftazidime_i, row
tab country ceftriaxone_i, row
tab country imipenem_i, row
tab country levofloxacin_i, row
tab country meropenem_i, row
tab country minocycline_i, row
tab country piperacillintazobactam_i, row
tab country tigecycline_i, row
tab country ampicillinsulbactam_i, row
tab country aztreonam_i, row
tab country ceftaroline_i, row
tab country ceftriaxone_i, row
tab country ceftazidimeavibactam_i, row
tab country ciprofloxacin_i, row
tab country colistin_i, row
tab country doripenem_i, row
tab country ertapenem_i, row
tab country gentamicin_i, row
tab country trimethoprimsulfa_i, row
tab country ceftolozanetazobactam_i, row
tab country meropenemvaborbactam_i, row


///the resistancce patterns for Cefoperazone sulbactam, Ceftaroline avibactam, and Aztreonam avibactam couldn't be recoded because of lack of published CLSI breakpoints for these antibiotics for Enterobacteriaceae species.

**#
tab country amikacin_i, row

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "Cameroon" | if country == "Egypt"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "Egypt"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "Ivory Coast"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "Kenya"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "Morocco"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "Nigeria"

tab1 amikacin_i amoxycillinclavulanate_i ampicillin_i cefepime_i ceftazidime_i ceftriaxone_i imipenem_i levofloxacin_i meropenem_i minocycline_i piperacillintazobactam_i tigecycline_i ampicillinsulbactam_i aztreonam_i ceftaroline_i ceftazidimeavibactam_i ciprofloxacin_i colistin_i doripenem_i ertapenem_i gentamicin_i trimethoprimsulfa_i ceftolozanetazobactam_i meropenemvaborbactam_i if country == "South Africa"