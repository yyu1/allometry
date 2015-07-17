PRO create_uncertainty_range, lorey_file, error_file, type_file, out_tgb_file

	openr, lorey_lun, lorey_file, /get_lun
	openr, error_lun, error_file, /get_lun
	openr, type_lun, type_file, /get_lun

	openw, out_tgb_lun, out_tgb_file, /get_lun


	infile_info = file_info(lorey_file)

	infile_size = infile_info.size

	tot_pix = infile_size/4
	read_pix = tot_pix / 100

	in_hlorey = fltarr(read_pix)
	in_type = bytarr(read_pix)
	in_error = fltarr(read_pix)

	error_tgb = intarr(read_pix)

	for i=0, 99 do begin
		print, i
		readu, lorey_lun, in_hlorey
		readu, type_lun, in_type
		readu, error_lun, in_error

		error_tgb[*] = 0

		index = where(in_hlorey gt 0, count)
		
		if (count gt 0) then begin
			agb_high_temp = fltarr(count)
			bgb_high_temp = fltarr(count)

			agb_low_temp = fltarr(count)
			bgb_low_temp = fltarr(count)

			tmp_hlorey = in_hlorey[index] + in_error[index]/2.

			lorey2biomass, tmp_hlorey, in_type[index], agb_high_temp, bgb_high_temp

			tmp_hlorey = in_hlorey[index] - in_error[index]/2.
			index2 = where(tmp_hlorey lt 0, count2)
			if (count2 gt 0) then tmp_hlorey[index2] = 0

			lorey2biomass, tmp_hlorey, in_type[index], agb_low_temp, bgb_low_temp

			error_tgb[index] = fix(((agb_high_temp+bgb_high_temp)-(agb_low_temp+bgb_low_temp))*10)
		endif

		writeu, out_tgb_lun, error_tgb

	endfor


	;remainder

	remainder = tot_pix mod 100

	if (remainder gt 0) then begin
		print, 'working on remainder...'

		in_hlorey = fltarr(remainder)
		in_type = bytarr(remainder)
		in_error = fltarr(remainder)
		error_tgb = intarr(remainder)

		readu, lorey_lun, in_hlorey
		readu, type_lun, in_type
		readu, error_lun, in_error

		index = where(in_hlorey gt 0, count)

		if (count gt 0) then begin
			agb_high_temp = fltarr(count)
			bgb_high_temp = fltarr(count)

			agb_low_temp = fltarr(count)
			bgb_low_temp = fltarr(count)

			tmp_hlorey = in_hlorey[index] + in_error[index]/2.

			lorey2biomass, tmp_hlorey, in_type[index], agb_high_temp, bgb_high_temp

			tmp_hlorey = in_hlorey[index] - in_error[index]/2.
			index2 = where(tmp_hlorey lt 0, count2)
			if (count2 gt 0) then tmp_hlorey[index2] = 0

			lorey2biomass, tmp_hlorey, in_type[index], agb_low_temp, bgb_low_temp

			error_tgb[index] = fix(((agb_high_temp+bgb_high_temp)-(agb_low_temp+bgb_low_temp))*10)
		endif

		writeu, out_tgb_lun, error_tgb


	endif

	free_lun, lorey_lun, type_lun, error_lun, out_tgb_lun

end
	











END
