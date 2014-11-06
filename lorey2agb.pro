;Inputs arrays of hlorey and associated class type array and returns AGB arrays.



;in_type definitions, should be type byte. 3 digit number



;------------------------------

;
Function apply_value, lorey_array, type

	agb_array = fltarr(n_elements(lorey_array))

	case type of 
;------------------------------
;  value					type
;	0							ignore

;	North America
;	10    -	class 40
		10: agb_array[*] = 0.6011 * (lorey_array^1.894)
;	11		-	class 50, 60
		11:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	13		- class 70, 90 east
		13:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
;	14		- class 70, 90 west
		14:	agb_array[*] = 0.71774 * (lorey_array^1.6892)
;	15		- class 100
		15:	agb_array[*] = 0.689 * (lorey_array^1.6932)
;	16		- class 110, 120, 130
		16:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	17		- class 160
		17:	agb_array[*] = 1.799 * (lorey_array^1.536)
;	18		- class 170
		18:	agb_array[*] = 1.799 * (lorey_array^1.536)
;	19		- mexico tropical dry broadleaf
		19:	agb_array[*] = 0.24888 * ((1.4635 * (lorey_array^0.80925))^2.4469) ; changed after removing outliers
;	20		- mexico tropical conifer
		20:	agb_array[*] = 6.4389 * ((1.4635 * (lorey_array^0.80925))^1.0556)

;	South America
;	30		-	class 40
		30:	agb_array[*] = 0.6011 * (lorey_array^1.894)
;	31		- class 50, 60
		31:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	32		- class 100
		32:	agb_array[*] = 0.689 * (lorey_array^1.6932)
;	33		- class 110, 120, 130
		33:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	35		- class 160
		35:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	36		-	class 170
		36:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	37		-	misclass
		37: agb_array[*] = 0.6011 * (lorey_array^1.894)

;	Eurasia
;	50		-	class 50, 60, 100 east
		;50:	agb_array[*] = 0.061015 * (lorey_array^2.6032)
		50:	agb_array[*] = 0.26089 * (lorey_array^2.1192) ;changed after removing one outlier
;	51		- class 50, 60 west
		51:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	52		-	class 70, 90 west (Norway)
		52: agb_array[*] = 3.9314 * (lorey_array^1.2103)
;	53		- class 70, 90 east (Russia)
		53:	agb_array[*] = 4.5925 * ((1.0579*(lorey_array^0.92147))^1.1627)
;	54		- class 110, 120, 130   (Pedro Rodriguez-Veiga)
		54:	agb_array[*] = 1.4243 * (lorey_array^1.595)
;	55		- class 160
		55:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	56		-	class 170
		56:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	57		-	class 180
		57:	agb_array[*] = 1.1799 * (lorey_array^1.536)


;	Africa
;	70		-	class 40
		70:	agb_array[*] = 0.2788 * (lorey_array^2.12)
;	71		-	class 50
		71:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	72		-	class 60
		72:	agb_array[*] = 0.12363* (lorey_array^2.3533)
;	73		- class 70
		73:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
;	74		- class	90
		74:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
;	75		-	class 100
		75:	agb_array[*] = 0.689 * (lorey_array^1.6932)
;	76		- class 110
		76:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	77		-	class 120
		77:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	78		-	class 130
		78:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	79		-	class 160
		79:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	80		-	class 170
		80:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	81		-	class 180
		81:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	82		-	misclass
		82:	agb_array[*] = 0.2788 * (lorey_array^2.12)

;	Southeast Asia
;	90		-	class 40 (tropical rain forest)
		90:	agb_array[*] = 0.2788 * (lorey_array^2.12)
;	91		-	class 50
		;91: agb_array[*] = 0.061015 * (lorey_array^2.6032)
		91:	agb_array[*] = 0.26089 * (lorey_array^2.1192) ;changed after removing one outlier (from China)
;	92		-	class 60
		92: agb_array[*] = 0.061015 * (lorey_array^2.6032)
;	93		-	class 40 (nepal)
		93:	agb_array[*] = 7.7413 * (lorey_array^1.3155)
;	94		-	class 70 (nepal)
;		94:	agb_array[*] = 0.69646 * (lorey_array^2.1062)
		94:	agb_array[*] = 0.68255 * (lorey_array^1.6939)  ;temp use regular value because Nepal eq gives too high AGB
;	95		-	class 90
		95:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
;	96		-	class 100
		96:	agb_array[*] = 0.689 * (lorey_array^1.6932)
;	97		-	class 110
		97:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	98		- class 120
		98:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	99		-	class 130
		99:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	100		-	class 160
		100:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	101		-	class 170
		101:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	102		-	class 180
		102:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	103		-	misclass
		103:	agb_array[*] = 0.2788 * (lorey_array^2.12)
; 104   - class 70 (rest of SEA)
		104:	agb_array[*] = 0.68255 * (lorey_array^1.6939)

;	Australia
;	110		-	class 40
		110:	agb_array[*] = 0.6011 * (lorey_array^1.894)
;	111		-	class 50
		111:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	112		-	class 60
		112:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	113		-	class 70
		113:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
;	114		-	class 90
		114:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
;	115		-	class 100
		115:	agb_array[*] = 0.689 * (lorey_array^1.6932)
;	116		-	class 110
		116:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	117		-	class 120
		117:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	118		-	class 130
		118:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	119		-	class 160
		119:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	120		-	class 170
		120:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	121		-	class 180
		121:	agb_array[*] = 1.1799 * (lorey_array^1.536)

	else: agb_array[*] = -1

	endcase

	return, agb_array

End	



Function lorey2agb, in_lorey, in_type
	
	if (n_elements(in_lorey) ne n_elements(in_type)) then begin
		print, 'Error!  Number of elements of in_lorey does not match in_type'
		exit
	endif

	arr_size = n_elements(in_lorey)

	out_agb = fltarr(arr_size)

	index = where(in_type ne 0, count)

	if (count gt 0) then begin
		types = in_type[index]
		uniq_types = types[uniq(types,sort(types))]

		n_types = n_elements(uniq_types)

		for i=0, n_types-1 do begin
			index = where(in_type eq uniq_types[i])
			out_agb[index] = apply_value(in_lorey[index],uniq_types[i])
		endfor
	endif

	return, out_agb

End
