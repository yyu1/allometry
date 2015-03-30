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
		16:	agb_array[*] = 1.3403 * (lorey_array^1.4694)
;	17		- class 160
		17:	agb_array[*] = 1.799 * (lorey_array^1.536)
;	18		- class 170
		18:	agb_array[*] = 1.799 * (lorey_array^1.536)
;	19		- mexico tropical dry broadleaf
		19:	agb_array[*] = 0.24888 * ((1.4635 * (lorey_array^0.80925))^2.4469) ; changed after removing outliers
;	20		- mexico tropical conifer
		20:	agb_array[*] = 6.4389 * ((1.4635 * (lorey_array^0.80925))^1.0556)
; 21		- boreal mixed
		21: agb_array[*] = 3.6407 * (lorey_array^1.2722)
; 22		- temperate savanna 
		22: agb_array[*] = 1.3403 * (lorey_array^1.4694)
; 23		- mediterranean
		23: agb_array[*] = 2.3053 * (lorey_array^1.3171)

; 150   - Canada ecozone 14: Montane Cordilera
		150: agb_array[*] = 1.5248 * (lorey_array^1.5512)
; 151   - Canada ecozone 13: Pacific Maritime
		151: agb_array[*] = 3.4819 * (lorey_array^1.2558)
; 152		- Canada ecozone 12: Boreal Cordilerra
		152: agb_array[*] = 0.61335 * (lorey_array^1.8054)
; 153		- Canada ecozone 9: Boreal plains
		153: agb_array[*] = 2.1745 * (lorey_array^1.5258)
; 154		- Canada ecozone 6: Boreal shield
		154: agb_array[*] = 2.0657 * (lorey_array^1.5548)
; 155		- Canada ecozone 7: Atlantic maritime
		155: agb_array[*] = 0.47767 * (lorey_array^2.0538)

; FIA region southern
;	160		- Southern conifer
;		160: agb_array[*] = 0.8348 * (lorey_array^1.6361)
;		160: agb_array[*] = (0.8348 * (lorey_array^1.6361) + 0.1 * (lorey_array^2.6366))/2
;		160: agb_array[*] = 0.1 * (lorey_array^2.6366)
		160: agb_array[*] = 0.396 * (lorey_array^2.2) ; from 250m against cms agb at pixel level
;	161		- Southern mixed
;		161: agb_array[*] = (0.31492 * (lorey_array^1.9356) + 0.1 * (lorey_array^2.6366))/2
;		161: agb_array[*] = 0.1 * (lorey_array^2.6366)
		161: agb_array[*] = 2.2721 * (lorey_array^1.5)  ; from 250m against cms agb at pixel level
;	162		- Southern deciduous
;		162: agb_array[*] = (0.45302 * (lorey_array^1.8352) + 0.1 * (lorey_array^2.6366))/2
;		162: agb_array[*] = 0.1 * (lorey_array^2.6366)
		162: agb_array[*] = 0.2 * (lorey_array^2.3)  ; from 250m against cms agb at pixel level

; FIA region northeastern:
;	163		- NE conifer
;		163: agb_array[*] = 1.3888 * (lorey_array^1.5233)
;		163: agb_array[*] = (1.3888 * (lorey_array^1.5233) + 0.1 * (lorey_array^2.6911))/2
;		163: agb_array[*] = 0.1 * (lorey_array^2.6911)
		163: agb_array[*] = 2.35 * (lorey_array^1.55)  ; from 250m against cms agb at pixel level
;	164		- NE mixed
;		164: agb_array[*] = 1.7405 * (lorey_array^1.4644)
;		164: agb_array[*] = (1.7405 * (lorey_array^1.4644) + 0.1 * (lorey_array^2.6911))/2
;		164: agb_array[*] = 0.1 * (lorey_array^2.6911)
		164: agb_array[*] = 0.3 * (lorey_array^2.37)  ; from 250m against cms agb at pixel level
;	165		- NE deciduous
;		165: agb_array[*] = 0.46645 * (lorey_array^1.8872)
;		165: agb_array[*] = (0.46645 * (lorey_array^1.8872) + 0.1 * (lorey_array^2.6911))/2
;		165: agb_array[*] = 0.1 * (lorey_array^2.6911)
		165: agb_array[*] = 4.13 * (lorey_array^1.3)  ; from 250m against cms agb at pixel level

; FIA region North central:
;	166		- NC conifer
;		166: agb_array[*] = 1.1639 * (lorey_array^1.5065)
;		166: agb_array[*] = (1.1639 * (lorey_array^1.5065) + 0.1 * (lorey_array^2.5476))/2
;		166: agb_array[*] = 0.1 * (lorey_array^2.5476)
		166: agb_array[*] = 0.588 * (lorey_array^1.8661)  ; from 250m against cms agb at pixel level
;	167		- NC mixed
;		167: agb_array[*] = 1.5657 * (lorey_array^1.3942)
;		167: agb_array[*] = (1.5657 * (lorey_array^1.3942) + 0.1 * (lorey_array^2.5476))/2
;		167: agb_array[*] = 0.1 * (lorey_array^2.5476)
		167: agb_array[*] = 0.1 * (lorey_array^2.65)  ; from 250m against cms agb at pixel level
; 168		- NC deciduous
;		168: agb_array[*] = 0.91856 * (lorey_array^1.579)
;		168: agb_array[*] = (0.91856 * (lorey_array^1.579) + 0.1 * (lorey_array^2.5476))/2
;		168: agb_array[*] = 0.1 * (lorey_array^2.5476)
		168: agb_array[*] = 1.6145 * (lorey_array^1.5)  ; from 250m against cms agb at pixel level

; FIA interior west:
;	169		- IW conifer
;		169: agb_array[*] = 1.198 * (lorey_array^1.5161)
;		169: agb_array[*] = (1.198 * (lorey_array^1.5161) + 0.2056 * (lorey_array^2.0132))/2
;		169: agb_array[*] = 0.2056 * (lorey_array^2.0132)
;		169: agb_array[*] = 1.38 * (lorey_array^1.5)  ; from 250m against cms agb at pixel level
		169: agb_array[*] = 3.1429 * (lorey_array^1.2)  ; from 250m against cms agb at pixel level
; 170		- IW mixed
;		170: agb_array[*] = 0.27302 * (lorey_array^2.0351) ;no mixed, use deciduous
;		170: agb_array[*] = (0.27302 * (lorey_array^2.0351)  + 0.2056 * (lorey_array^2.0132))/2;no mixed, use deciduous
;		170: agb_array[*] = 0.2056 * (lorey_array^2.0132);no mixed, use deciduous
		170: agb_array[*] = 3.52 * (lorey_array^1.2)  ; from 250m against cms agb at pixel level
;	171		- IW deciduous
;		171: agb_array[*] = 0.27302 * (lorey_array^2.0351)
;		171: agb_array[*] = (0.27302 * (lorey_array^2.0351) + 0.2056 * (lorey_array^2.0132))/2
;		171: agb_array[*] = 0.2056 * (lorey_array^2.0132)
		171: agb_array[*] = 3.486 * (lorey_array^1.2)  ; from 250m against cms agb at pixel level

; FIA Pacific:
;	172		- PA conifer
;		172: agb_array[*] = 0.48829 * (lorey_array^1.7894)
;		172: agb_array[*] = (0.48829 * (lorey_array^1.7894) + 0.1 * (lorey_array^2.2523))/2
;		172: agb_array[*] = 0.1 * (lorey_array^2.2523)
;		172: agb_array[*] = 0.3 * (lorey_array^2.05)  ; from 250m against cms agb at pixel level
		172: agb_array[*] = 2.335 * (lorey_array^1.3)  ; from 250m against cms agb at pixel level
;	173		- PA mixed
;		173: agb_array[*] = 3.1665 * (lorey_array^1.2854); no mixed, use deciduous
;		173: agb_array[*] = (3.1665 * (lorey_array^1.2854) + 0.1 * (lorey_array^2.2523))/2; no mixed, use deciduous
;		173: agb_array[*] = 0.1 * (lorey_array^2.2523); no mixed, use deciduous
		173: agb_array[*] = 5.4311 * (lorey_array^1.1)  ; from 250m against cms agb at pixel level no mixed, use deciduous
;	174		- PA deciduous
;		174: agb_array[*] = 3.1665 * (lorey_array^1.2854)
;		174: agb_array[*] = (3.1665 * (lorey_array^1.2854) + 0.1 * (lorey_array^2.2523))/2
;		174: agb_array[*] = 0.1 * (lorey_array^2.2523)
		174: agb_array[*] = 5.4311 * (lorey_array^1.1)  ; from 250m against cms agb at pixel level


;	South America
;	30		-	class 40
		30:	agb_array[*] = (1-0.01072)* 0.6011 * (lorey_array^1.894) + 16.8 ; added sapling
;	31		- class 50, 60
		31:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	32		- class 100
		32:	agb_array[*] = 0.689 * (lorey_array^1.6932)
;	33		- class 110, 120, 130
		33:	agb_array[*] = 2.3053 * (lorey_array^1.3171)
;	35		- class 160
		35:	agb_array[*] = (1-0.01072)* 0.6011 * (lorey_array^1.894) + 16.8  ;added sapling
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
		70:	agb_array[*] = (1-0.01072) * 0.2788 * (lorey_array^2.12) + 16.8 ; added sapling
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
		;79:	agb_array[*] = 1.1799 * (lorey_array^1.536)
		79:	agb_array[*] = (1-0.01072) * 0.2788 * (lorey_array^2.12) + 16.8 ; added sapling
;	80		-	class 170
		80:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	81		-	class 180
		81:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	82		-	misclass
		82:	agb_array[*] = 0.2788 * (lorey_array^2.12)

;	Southeast Asia
;	90		-	class 40 (tropical rain forest)
		90:	agb_array[*] = (1-0.034396) * 0.21608 * (lorey_array^2.1604) + 24.263
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
		100:	agb_array[*] = (1-0.034396) * 0.21608 * (lorey_array^2.1604) + 24.263
;	101		-	class 170
		101:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	102		-	class 180
		102:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	103		-	misclass
		103:	agb_array[*] = 0.21608 * (lorey_array^2.1604)
; 104   - class 70 (rest of SEA)
		104:	agb_array[*] = 0.68255 * (lorey_array^1.6939)
; 105 - terai lowland forests
		;use mixed equation from Guoqing China for now
		105:	agb_array[*] = 0.26089 * (lorey_array^2.1192)

;	Australia
;	110		-	class 40
		110:	agb_array[*] = 0.39194 * (lorey_array^2.1506)
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
		119:	agb_array[*] = 0.39194 * (lorey_array^2.1506)
;	120		-	class 170
		120:	agb_array[*] = 1.1799 * (lorey_array^1.536)
;	121		-	class 180
		121:	agb_array[*] = 1.1799 * (lorey_array^1.536)

	else: agb_array[*] = 0

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

  index = where((in_lorey lt 0), count)
  if (count gt 0) then out_agb[index] = -1   ;temp fix for some water issues in 3.2sec images

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

	;Use equation for values of hlorey that's there but no type (value small enough)
	index = where((in_lorey gt 0) and (out_agb eq 0) and (in_lorey lt 10), count)
	if (count gt 0) then out_agb[index] = 0.12363*(in_lorey[index]^2.3533)

	return, out_agb

End
