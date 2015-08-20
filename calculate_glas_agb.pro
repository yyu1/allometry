in_file = '/Volumes/YifanLaCie1T/global/glas/lefsky/12_10_2012/global_hlorey_121012_wwfbiome_globcover_vcf_type_srtm.csv'
out_file = '/Volumes/YifanLaCie1T/global/glas/lefsky/12_10_2012/global_hlorey_121012_wwfbiome_globcover_vcf_type_agb.csv'

wd_file = '/Volumes/wd_3t/pantropic_wd/output_v3/results/maxent_pantropic_wd_v3_n2.flt'

wd_image = fltarr(43200,11500)
openr, wd_lun, wd_file, /get_lun
readu, wd_lun, wd_image
free_lun, wd_lun

data = read_csv(in_file)

hlorey = data.(2)
type = data.(9)
globcover = data.(7)
srtm = data.(10)
longitude = data.(0)
latitude = data.(1)

;Adjust hlorey if globcover type is 40 or 160 and srtm is below a certain elevation.
;This should match up with the hlorey_adjust program
;Uses srtm thresh of 600 and min hlorey to adjust of 10

index = where(((globcover eq 40) or (globcover eq 160)) and (hlorey ge 10) and (srtm le 600))
mod_lorey, hlorey, index

agb = fltarr(n_elements(hlorey))
bgb = fltarr(n_elements(hlorey))

lorey2biomass, hlorey, type, agb, bgb

;Adjust for wd
print, 'Applying wd...'
index = where((globcover eq 40) or (globcover eq 160), count)
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

;write output

print, 'Writing output...'
openw, 1, out_file

;printf, 1, '"longitude","latitude","comb_hlorey","comb_hmax","comb_source","pctslope","wwfbiome","globcover","vcf_2005_2006","allometry_type_2.2","agb_4.2.4","bgb_4.2.4"'
printf, 1, '"agb_4.2.5","bgb_4.2.5"'

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
	out_string += strtrim(string(agb[i],format='(f7.1)'),2) + ','
	out_string += strtrim(string(bgb[i],format='(f7.1)'),2)

	printf, 1, out_string
endfor


close, 1


end
