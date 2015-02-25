PRO apply_allometry, lorey_file, type_file, out_file
	openr, lorey_lun, lorey_file, /get_lun
	openr, type_lun, type_file, /get_lun

	openw, out_lun, out_file, /get_lun

	infile_info = file_info(lorey_file)

	infile_size = infile_info.size

	tot_pix = infile_size/4

	read_pix = tot_pix / 100

	in_line = fltarr(read_pix)
	in_type = bytarr(read_pix)
	out_line = intarr(read_pix)

	for i=0, 99 do begin
		print, i
		readu, lorey_lun, in_line
		readu, type_lun, in_type

		out_line[*] = fix(in_line)
		index = where(in_line gt 0, count)

		if (count gt 0) then out_line[index] = fix(lorey2agb(in_line[index],in_type[index])*10)

		writeu, out_lun, out_line
	endfor

	remainder = tot_pix mod 100

	in_line = fltarr(remainder)
	in_type = bytarr(remainder)
	out_line = intarr(remainder)

	readu, lorey_lun, in_line
	readu, type_lun, in_type

	out_line[*] = fix(in_line)
	index = where(in_line gt 0, count)

	if (count gt 0) then out_line[index] = fix(lorey2agb(in_line[index],in_type[index])*10)

	writeu, out_lun, out_line

	free_lun, lorey_lun, type_lun, out_lun


END
