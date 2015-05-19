in_file = '/Volumes/YifanLaCie1T/global/glas/lefsky/12_10_2012/global_hlorey_121012_wwfbiome_globcover_vcf_type.csv'
out_file = '/Volumes/YifanLaCie1T/global/glas/lefsky/12_10_2012/global_hlorey_121012_wwfbiome_globcover_vcf_type_agb.csv'

data = read_csv(in_file)

hlorey = data.(2)
type = data.(9)

agb = fltarr(n_elements(hlorey))
bgb = fltarr(n_elements(hlorey))

lorey2biomass, hlorey, type, agb, bgb


;write output

openw, 1, out_file

;printf, 1, '"longitude","latitude","comb_hlorey","comb_hmax","comb_source","pctslope","wwfbiome","globcover","vcf_2005_2006","allometry_type_2.2","agb_4.2.4","bgb_4.2.4"'
printf, 1, '"agb_4.2.4","bgb_4.2.4"'

for i=0ULL, n_elements(hlorey)-1 do begin
	out_string = ','
;	out_string += strtrim(string((data.(0))[i], format='(f11.6)'),2) + ','
;	out_string += strtrim(string((data.(1))[i], format='(f11.6)'),2) + ','
;	out_string += strtrim(string(hlorey[i],format='(f4.1)'),2) + ','
;	out_string += strtrim(string((data.(3))[i],format='(f4.1)'),2) + ','
;	out_string += strtrim(string((data.(4))[i]),2) + ','
;	out_string += strtrim(string((data.(5))[i]),2) + ','
;	out_string += strtrim(string((data.(6))[i]),2) + ','
;	out_string += strtrim(string((data.(7))[i]),2) + ','
;	out_string += strtrim(string((data.(8))[i]),2) + ','
;	out_string += strtrim(string((data.(9))[i]),2) + ','
;	out_string += strtrim(string((data.(9))[i]),2) + ','
	out_string += strtrim(string(agb[i],format='(f6.2)'),2) + ','
	out_string += strtrim(string(bgb[i],format='(f6.2)'),2)

	printf, 1, out_string
endfor


close, 1


end
