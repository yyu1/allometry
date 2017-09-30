in_file = '/Volumes/WD2TB/100m/glas/NorthAmerica_glas_2003_2008_alltypes_agb_v6_nozero_lt10fill_forestgroup_country_extract.csv'
out_file = '/Volumes/WD2TB/100m/glas/NorthAmerica_glas_2003_2008_alltypes_agb_v6.1_nozero_lt10fill.csv'
;in_file = '/Volumes/WD2TB/100m/glas/test_input.csv'
;out_file = '/Volumes/WD2TB/100m/glas/NorthAmerica_glas_2003_2008_alltypes_agb_v6.1_nozero_lt10fill.csv'

wd_file = '/Volumes/wd_3t/pantropic_wd/output_v3/results/maxent_pantropic_wd_v3_n2.flt'

wd_image = fltarr(43200,11500)
openr, wd_lun, wd_file, /get_lun
readu, wd_lun, wd_image
free_lun, wd_lun

data = read_csv(in_file, N_TABLE_HEADER=1)

hlorey = data.(17)
type = data.(18)
globcover = data.(20)
srtm = data.(19)
longitude = data.(6)
latitude = data.(5)
forestgroup = data.(23)
countrycode = data.(24)

index = where(forestgroup eq 'oob')
forestgroup[index] = '0'
forestgroup_int = fix(forestgroup)

index = where(countrycode eq 'oob')
countrycode[index] = '0'
countrycode_int = fix(countrycode)

;Adjust hlorey if globcover type is 40 or 160 and srtm is below a certain elevation.
;This should match up with the hlorey_adjust program
;Uses srtm thresh of 600 and min hlorey to adjust of 10

;index = where(((globcover eq 40) or (globcover eq 160)) and (hlorey ge 10) and (srtm le 600))
;mod_lorey, hlorey, index

agb = fltarr(n_elements(hlorey))
bgb = fltarr(n_elements(hlorey))

lorey2biomass2, hlorey, type, countrycode_int, forestgroup_int, globcover, agb, bgb

;Adjust for wd
print, 'Applying wd...'
index = where((globcover eq 40) or (globcover eq 160), count)
if (count gt 0) then begin
	for i=0ULL, count-1 do begin
		lon = longitude[index[i]]
		lat = latitude[index[i]]
		wd = get_wd(wd_image, lon, lat)
		if (wd ne 0) then begin
			if (lon lt -30) then mean_wd = 0.59 else mean_wd = 0.6 ;South America = 0.59 , other 2 = 0.6
			ratio = wd/mean_wd
			agb[index[i]] *= ratio
			bgb[index[i]] *= ratio
		endif
	endfor
endif

;write output

print, 'Writing output...'
openw, 1, out_file

;printf, 1, '"longitude","latitude","comb_hlorey","comb_hmax","comb_source","pctslope","wwfbiome","globcover","vcf_2005_2006","allometry_type_2.2","agb_4.2.4","bgb_4.2.4"'
printf, 1, '"allometry_type2.3","agb_v6.1","bgb_v6.1"'

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
