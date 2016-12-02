PRO create_bgb, agb_file, type_file, out_bgb_file
	openr, agb_lun, agb_file, /get_lun
	openr, type_lun, type_file, /get_lun

	openw, out_bgb_lun, out_bgb_file, /get_lun

	infile_info = file_info(agb_file)

	infile_size = infile_info.size

	tot_pix = infile_size/4

	read_pix = tot_pix / 100

	in_line = fltarr(read_pix)
	in_type = bytarr(read_pix)
	out_bgb_line = fltarr(read_pix)

	for i=0, 99 do begin
		print, i
		readu, agb_lun, in_line
		readu, type_lun, in_type

		out_bgb_line[*] = 0
		index = where(in_line gt 0, count)

		if (count gt 0) then begin
			bgb_temp = fltarr(count)
			calcbgb,in_line[index],in_type[index],bgb_temp
			out_bgb_line[index] = bgb_temp
		endif
		writeu, out_bgb_lun, out_bgb_line
	endfor

	remainder = tot_pix mod 100

	if (remainder gt 0) then begin
		in_line = fltarr(remainder)
		in_type = bytarr(remainder)
		out_bgb_line = fltarr(remainder)

		readu, agb_lun, in_line
		readu, type_lun, in_type

		out_bgb_line[*] = 0
		index = where(in_line gt 0, count)

		if (count gt 0) then begin
			bgb_temp = fltarr(remainder)
			calcbgb,in_line[index],in_type[index],bgb_temp
			out_bgb_line[index] = bgb_temp
		endif

		writeu, out_bgb_lun, out_bgb_line
	endif

	free_lun, agb_lun, type_lun, out_bgb_lun


END
