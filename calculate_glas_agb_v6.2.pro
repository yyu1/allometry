in_file = '/u/yyu1/maxent_samples/agb_v6.2/nam_glas2003_2008_wlefskylt4.5.csv'
out_file = '/u/yyu1/maxent_samples/agb_v6.2/nam_glas2003_2008_wlefskylt4.5_agb.csv'


data = read_csv(in_file, N_TABLE_HEADER=1)

hlorey = data.(2)
type = data.(3)
globcover = data.(5)
srtm = data.(4)
longitude = data.(0)
latitude = data.(1)
forestgroup = data.(6)
countrycode = data.(7)

;index = where(forestgroup eq 'oob')
;forestgroup[index] = '0'
forestgroup_int = fix(forestgroup)
;
;index = where(countrycode eq 'oob')
;countrycode[index] = '0'
countrycode_int = fix(countrycode)

;Adjust hlorey if globcover type is 40 or 160 and srtm is below a certain elevation.
;This should match up with the hlorey_adjust program
;Uses srtm thresh of 600 and min hlorey to adjust of 10

;index = where(((globcover eq 40) or (globcover eq 160)) and (hlorey ge 10) and (srtm le 600))
;mod_lorey, hlorey, index

agb = fltarr(n_elements(hlorey))
bgb = fltarr(n_elements(hlorey))

;print, forestgroup
;print, forestgroup_int


lorey2biomass2, hlorey, type, countrycode_int, forestgroup_int, globcover, agb, bgb

;write output

print, 'Writing output...'
openw, 1, out_file

;printf, 1, '"longitude","latitude","comb_hlorey","comb_hmax","comb_source","pctslope","wwfbiome","globcover","vcf_2005_2006","allometry_type_2.2","agb_4.2.4","bgb_4.2.4"'
printf, 1, '"allometry_type2.3","agb_v6.2","bgb_v6.2"'

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
	out_string += strtrim(string(type[i]),2) + ','
	out_string += strtrim(string(agb[i],format='(f7.1)'),2) + ','
	out_string += strtrim(string(bgb[i],format='(f7.1)'),2)

	printf, 1, out_string
endfor


close, 1


end
