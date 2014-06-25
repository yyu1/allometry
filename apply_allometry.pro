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

	for i=0, 99 do begin
		print, i
		readu, lorey_lun, in_line
		readu, type_lun, in_type

		out_agb = fix(lorey2agb(in_line,in_type)*10)

		writeu, out_lun, out_agb
	endfor

END
