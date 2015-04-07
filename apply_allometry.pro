PRO apply_allometry, lorey_file, type_file, out_agb_file, out_bgb_file
	openr, lorey_lun, lorey_file, /get_lun
	openr, type_lun, type_file, /get_lun

	openw, out_agb_lun, out_agb_file, /get_lun

	infile_info = file_info(lorey_file)

	infile_size = infile_info.size

	tot_pix = infile_size/4

	read_pix = tot_pix / 100

	in_line = fltarr(read_pix)
	in_type = bytarr(read_pix)
	out_agb_line = intarr(read_pix)

	for i=0, 99 do begin
		print, i
		readu, lorey_lun, in_line
		readu, type_lun, in_type

		out_agb_line[*] = fix(in_line)
		index = where(in_line gt 0, count)

		if (count gt 0) then begin
			agb_temp = fltarr(count)
			bgb_temp = fltarr(count)
			lorey2biomass,in_line[index],in_type[index],agb_temp,bgb_temp
			out_agb_line[index] = fix(agb_temp*10)
		endif
		writeu, out_agb_lun, out_agb_line
	endfor

	remainder = tot_pix mod 100

	if (remainder gt 0) then begin
		in_line = fltarr(remainder)
		in_type = bytarr(remainder)
		out_agb_line = intarr(remainder)

		readu, lorey_lun, in_line
		readu, type_lun, in_type

		out_agb_line[*] = fix(in_line)
		index = where(in_line gt 0, count)

		if (count gt 0) then begin
			agb_temp = fltarr(remainder)
			bgb_temp = fltarr(remainder)
			lorey2biomass,in_line[index],in_type[index],agb_temp,bgb_temp
			out_agb_line[index] = fix(agb_temp*10)
		endif

		writeu, out_agb_lun, out_agb_line
	endif

	free_lun, lorey_lun, type_lun, out_agb_lun


END
