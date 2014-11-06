;This program fills type image using a height image so that all non-zero height values
;has an associated type.

Function get_near_value, type_image, ind_x, ind_y, xdim, ydim
	;returns the neast type value from the given point that's not zero

	;type_image MUST be type byte  (so histogram can have the correct behavior)

	max_val = 0ULL
	n = 1ULL
	while (max_val eq 0) do begin
		box = type_image[(ind_x-n > 0):((ind_x+n) < (xdim-1)),(ind_y-n > 0):((ind_y+n) < (ydim-1))]
		index = where(box ne 0, count)
		if (count gt 0) then begin
			max_val = max(histogram(box[index]),max_ind)
			return, max_ind
		endif
		n = n+1
	endwhile
	
End


PRO fill_type_image, ht_file, type_file, out_type_file, xdim, ydim

	print, 'Filling type file ', type_file
	print, 'Out file:', out_type_file

	type_image = bytarr(xdim,ydim)

	openr, type_lun, type_file, /get_lun
	readu, type_lun, type_image
	free_lun, type_lun

	openr, ht_lun, ht_file, /get_lun

	ht_line = fltarr(xdim)
	type_line = bytarr(xdim)

	for j=0ULL, ydim-1 do begin
		readu, ht_lun, ht_line
		type_line[*] = type_image[*,j]
		index = where((ht_line gt 0) and (type_line eq 0),count)

		if (count gt 0) then begin
			for i=0ULL, count-1 do begin
				type_line[index[i]] = get_near_value(type_image, index[i], j, xdim, ydim)
			endfor
			type_image[*,j] = type_line[*]
		endif
	endfor

	openw, out_lun, out_type_file, /get_lun
	writeu, out_lun, type_image
	free_lun, out_lun
	free_lun, ht_lun

end
