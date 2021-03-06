;Inputs arrays of hlorey and associated class type array



;in_type definitions, should be type byte. 3 digit number



;------------------------------

;
Pro apply_value_bgb, agb_array, type, bgb_array


;agb_array and bgb_array are for output and are modified in the procedure

	;agb_array = fltarr(n_elements(lorey_array))

	case type of 
;------------------------------
;  value					type
;	0							ignore

;	North America
;	10    -	class 40
		10: begin 
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	11		-	class 50, 60
		11:	begin
			bgb_array[*] = 0.19677 * agb_array
		end
;	13		- class 70, 90 east
		13:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
;	14		- class 70, 90 west
		14:	begin
			bgb_array[*] = 0.22394 * agb_array
		end
;	15		- class 100
		15:	begin
			bgb_array[*] = 0.20844 * agb_array
		end
;	16		- class 110, 120, 130
		16:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	17		- class 160
		17:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	18		- class 170
		18:	begin
			bgb_array[*] = 0.642 * agb_array
		end
;	19		- mexico tropical dry broadleaf
		19:	begin
			index = where(agb_array lt 20, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.563 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.275 * agb_array[index2]
		end
;	20		- mexico tropical conifer
		20:	begin
			index = where(agb_array lt 20, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.563 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.275 * agb_array[index2]
		end
; 21		- boreal mixed
		21: begin
			bgb_array[*] = 0.22544 * agb_array
		end
; 22		- temperate savanna 
		22: begin
			bgb_array[*] = 0.642 * agb_array
		end
; 23		- mediterranean
		23: begin
			bgb_array[*] = 0.322 * agb_array
		end

; 150   - Canada ecozone 14: Montane Cordillera
		150: begin
			index = where(agb_array lt 75, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.392 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.239 * agb_array[index2]
		end
; 151   - Canada ecozone 13: Pacific Maritime
		151: begin
			index = where(agb_array lt 50, count)
			if (count gt 0) then bgb_array[index] = 0.403 * agb_array[index]
			index = where((agb_array ge 50) and (agb_array lt 150), count)
			if (count gt 0) then bgb_array[index] = 0.292 * agb_array[index]
			index = where((agb_array ge 150), count)
			if (count gt 0) then bgb_array[index] = 0.201 * agb_array[index]
		end
; 152		- Canada ecozone 12: Boreal Cordillerra
		152: begin
			index = where(agb_array lt 75, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.392 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.239 * agb_array[index2]
		end
; 153		- Canada ecozone 9: Boreal plains
		153: begin
			index = where(agb_array lt 75, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.392 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.239 * agb_array[index2]
		end
; 154		- Canada ecozone 6: Boreal shield
		154: begin
			index = where(agb_array lt 75, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.392 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.239 * agb_array[index2]
		end
; 155		- Canada ecozone 7: Atlantic maritime
		155: begin
			index = where(agb_array lt 50, count)
			if (count gt 0) then bgb_array[index] = 0.403 * agb_array[index]
			index = where((agb_array ge 50) and (agb_array lt 150), count)
			if (count gt 0) then bgb_array[index] = 0.292 * agb_array[index]
			index = where((agb_array ge 150), count)
			if (count gt 0) then bgb_array[index] = 0.201 * agb_array[index]
		end

; FIA region southern
;	160		- Southern conifer
;		160: agb_array[*] = 0.8348 * (lorey_array^1.6361)
;		160: agb_array[*] = (0.8348 * (lorey_array^1.6361) + 0.1 * (lorey_array^2.6366))/2
;		160: agb_array[*] = 0.1 * (lorey_array^2.6366)
;		160: agb_array[*] = 0.396 * (lorey_array^2.2) ; from 250m against cms agb at pixel level
		160: begin
;			agb_array[*] = 3.9896 * (lorey_array^1.3) ; from 250m against cms agb at pixel level
;			agb_array[*] = 1.3841 * (lorey_array^1.7)
			bgb_array[*] = 0.22371 * agb_array
		end
;	161		- Southern mixed
;		161: agb_array[*] = (0.31492 * (lorey_array^1.9356) + 0.1 * (lorey_array^2.6366))/2
;		161: agb_array[*] = 0.1 * (lorey_array^2.6366)
;		161: agb_array[*] = 2.2721 * (lorey_array^1.5)  ; from 250m against cms agb at pixel level
		161: begin
;			agb_array[*] = 2.302 * (lorey_array^1.45)  ; from 250m against cms agb at pixel level
;			agb_array[*] = 1.6654 * (lorey_array^1.6)
			bgb_array[*] = 0.20844 * agb_array
		end
;	162		- Southern deciduous
;		162: agb_array[*] = (0.45302 * (lorey_array^1.8352) + 0.1 * (lorey_array^2.6366))/2
;		162: agb_array[*] = 0.1 * (lorey_array^2.6366)
		162: begin
;			agb_array[*] = 0.2 * (lorey_array^2.3)  ; from 250m against cms agb at pixel level
;			agb_array[*] = 0.0044412 * (lorey_array^3.7)
;			agb_array[*] = 0.12507 * (lorey_array^2.5)
			index = where(agb_array gt 300, count)
			if (count gt 0) then agb_array[index] = 300
			bgb_array[*] = 0.19621 * agb_array
		end

; FIA region northeastern:
;	163		- NE conifer
;		163: agb_array[*] = 1.3888 * (lorey_array^1.5233)
;		163: agb_array[*] = (1.3888 * (lorey_array^1.5233) + 0.1 * (lorey_array^2.6911))/2
;		163: agb_array[*] = 0.1 * (lorey_array^2.6911)
		163: begin
;			agb_array[*] = 2.35 * (lorey_array^1.55)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.22149 * agb_array
		end
;	164		- NE mixed
;		164: agb_array[*] = 1.7405 * (lorey_array^1.4644)
;		164: agb_array[*] = (1.7405 * (lorey_array^1.4644) + 0.1 * (lorey_array^2.6911))/2
;		164: agb_array[*] = 0.1 * (lorey_array^2.6911)
		164: begin
;			agb_array[*] = 0.3 * (lorey_array^2.37)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.20753 * agb_array
		end
;	165		- NE deciduous
;		165: agb_array[*] = 0.46645 * (lorey_array^1.8872)
;		165: agb_array[*] = (0.46645 * (lorey_array^1.8872) + 0.1 * (lorey_array^2.6911))/2
;		165: agb_array[*] = 0.1 * (lorey_array^2.6911)
		165: begin
;			agb_array[*] = 4.13 * (lorey_array^1.3)  ; from 250m against cms agb at pixel level
;			agb_array[*] = 1.8431 * (lorey_array^1.6)
			bgb_array[*] = 0.19677 * agb_array
		end

; FIA region North central:
;	166		- NC conifer
;		166: agb_array[*] = 1.1639 * (lorey_array^1.5065)
;		166: agb_array[*] = (1.1639 * (lorey_array^1.5065) + 0.1 * (lorey_array^2.5476))/2
;		166: agb_array[*] = 0.1 * (lorey_array^2.5476)
		166: begin
;			agb_array[*] = 0.588 * (lorey_array^1.8661)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.22544 * agb_array
		end
;	167		- NC mixed
;		167: agb_array[*] = 1.5657 * (lorey_array^1.3942)
;		167: agb_array[*] = (1.5657 * (lorey_array^1.3942) + 0.1 * (lorey_array^2.5476))/2
;		167: agb_array[*] = 0.1 * (lorey_array^2.5476)
		167: begin
;			agb_array[*] = 0.1 * (lorey_array^2.65)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.20916 * agb_array
		end
; 168		- NC deciduous
;		168: agb_array[*] = 0.91856 * (lorey_array^1.579)
;		168: agb_array[*] = (0.91856 * (lorey_array^1.579) + 0.1 * (lorey_array^2.5476))/2
;		168: agb_array[*] = 0.1 * (lorey_array^2.5476)
		168: begin
;			agb_array[*] = 1.6145 * (lorey_array^1.5)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.19684 * agb_array
		end

; FIA interior west:
;	169		- IW conifer
;		169: agb_array[*] = 1.198 * (lorey_array^1.5161)
;		169: agb_array[*] = (1.198 * (lorey_array^1.5161) + 0.2056 * (lorey_array^2.0132))/2
;		169: agb_array[*] = 0.2056 * (lorey_array^2.0132)
;		169: agb_array[*] = 1.38 * (lorey_array^1.5)  ; from 250m against cms agb at pixel level
;		169: agb_array[*] = 3.1429 * (lorey_array^1.2)  ; from 250m against cms agb at pixel level
		169: begin
;			agb_array[*] = 4.2158 * (lorey_array^1.05)  ; from 250m against cms agb at pixel level
;			agb_array[*] = 1.38 * (lorey_array^1.5)
			bgb_array[*] = 0.22797 * agb_array
		end
; 170		- IW mixed
;		170: agb_array[*] = 0.27302 * (lorey_array^2.0351) ;no mixed, use deciduous
;		170: agb_array[*] = (0.27302 * (lorey_array^2.0351)  + 0.2056 * (lorey_array^2.0132))/2;no mixed, use deciduous
;		170: agb_array[*] = 0.2056 * (lorey_array^2.0132);no mixed, use deciduous
		170: begin
;			agb_array[*] = 3.486 * (lorey_array^1.2)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.20634 * agb_array
		end
;	171		- IW deciduous
;		171: agb_array[*] = 0.27302 * (lorey_array^2.0351)
;		171: agb_array[*] = (0.27302 * (lorey_array^2.0351) + 0.2056 * (lorey_array^2.0132))/2
;		171: agb_array[*] = 0.2056 * (lorey_array^2.0132)
		171: begin
;			agb_array[*] = 3.486 * (lorey_array^1.2)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.20634 * agb_array
		end

; FIA Pacific:
;	172		- PA conifer
;		172: agb_array[*] = 0.48829 * (lorey_array^1.7894)
;		172: agb_array[*] = (0.48829 * (lorey_array^1.7894) + 0.1 * (lorey_array^2.2523))/2
;		172: agb_array[*] = 0.1 * (lorey_array^2.2523)
;		172: agb_array[*] = 0.3 * (lorey_array^2.05)  ; from 250m against cms agb at pixel level
		172: begin
;			agb_array[*] = 2.8295* (lorey_array^1.3)  ; from 250m against cms agb at pixel level
;			agb_array[*] = 0.48829 * (lorey_array^1.7894)
;			agb_array[*] = 0.94289 * (lorey_array^1.6)
			bgb_array[*] = 0.22394 * agb_array
		end
;	173		- PA mixed
;		173: agb_array[*] = 3.1665 * (lorey_array^1.2854); no mixed, use deciduous
;		173: agb_array[*] = (3.1665 * (lorey_array^1.2854) + 0.1 * (lorey_array^2.2523))/2; no mixed, use deciduous
;		173: agb_array[*] = 0.1 * (lorey_array^2.2523); no mixed, use deciduous
		173: begin
;			agb_array[*] = 5.4311 * (lorey_array^1.1)  ; from 250m against cms agb at pixel level no mixed, use deciduous
;			agb_array[*] = (3.9131 * (lorey_array^1.3) + 0.05 * (lorey_array^2.4733)) / 2
			bgb_array[*] = 0.20541 * agb_array
		end
;	174		- PA deciduous
;		174: agb_array[*] = 3.1665 * (lorey_array^1.2854)
;		174: agb_array[*] = (3.1665 * (lorey_array^1.2854) + 0.1 * (lorey_array^2.2523))/2
;		174: agb_array[*] = 0.1 * (lorey_array^2.2523)
		174: begin
;			agb_array[*] = 5.4311 * (lorey_array^1.1)  ; from 250m against cms agb at pixel level
			bgb_array[*] = 0.20541 * agb_array
		end
	

;	South America
;	30		-	class 40
		30:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	31		- class 50, 60
		31:	begin
			bgb_array[*] = 0.19621 * agb_array
		end
;	32		- class 100
		32:	begin
			bgb_array[*] = 0.20844 * agb_array
		end
;	33		- class 110, 120, 130
		33:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	35		- class 160
		35:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	36		-	class 170
		36:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	37		-	misclass
		37: begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end

;	Eurasia
;	50		-	class 50, 60, 100 east
		;50:	agb_array[*] = 0.061015 * (lorey_array^2.6032)
		50:	begin
			index = where(agb_array lt 75, count)
			if (count gt 0) then bgb_array[index] = 0.456 * agb_array[index] 
			index = where((agb_array ge 75) and (agb_array lt 150), count)
			if (count gt 0) then bgb_array[index] = 0.226 * agb_array[index] 
			index = where((agb_array ge 150), count)
			if (count gt 0) then bgb_array[index] = 0.241 * agb_array[index] 
		end
;	51		- class 50, 60 west
		51:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	52		-	class 70, 90 west (Norway)
		52: begin
			index = where(agb_array lt 145, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.23803*agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 1.7071 + 0.21461 * agb_array[index2]
		end
;	53		- class 70, 90 east (Russia)
;		53:	agb_array[*] = 4.5925 * ((1.0579*(lorey_array^0.92147))^1.1627)
		53: begin
			index = where(agb_array lt 75, count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.392 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.239 * agb_array[index2]
		end
;	54		- class 110, 120, 130   (Pedro Rodriguez-Veiga)
		54:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	55		- class 160
		55:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	56		-	class 170
		56:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	57		-	class 180
		57:	begin
			bgb_array[*] = 0.20634 * agb_array
		end


;	Africa
;	70		-	class 40
		70:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	71		-	class 50
		71:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	72		-	class 60
		72:	begin
			bgb_array[*] = 0.4933 * agb_array
		end
;	73		- class 70
		73:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
;	74		- class	90
		74:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
;	75		-	class 100
		75: begin
			bgb_array[*] = 0.20844 * agb_array
		end
;	76		- class 110
		76:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	77		-	class 120
		77:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	78		-	class 130
		78:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	79		-	class 160
		;79:	agb_array[*] = 1.1799 * (lorey_array^1.536)
		79:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	80		-	class 170
		80:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	81		-	class 180
		81:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	82		-	misclass
		82:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end

;	Southeast Asia
;	90		-	class 40 (tropical rain forest)
		90:	begin
			;agb_array[*] = 1.05 * (0.61/0.6) * (0.2788 * (lorey_array^2.12))  ;temporary allometry to test Saatchi pantropic map
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	91		-	class 50
		;91: agb_array[*] = 0.061015 * (lorey_array^2.6032)
		91:	begin
			index = where(agb_array lt 75, count)
			if (count gt 0) then bgb_array[index] = 0.456 * agb_array[index] 
			index = where((agb_array ge 75) and (agb_array lt 150), count)
			if (count gt 0) then bgb_array[index] = 0.226 * agb_array[index] 
			index = where((agb_array ge 150), count)
			if (count gt 0) then bgb_array[index] = 0.241 * agb_array[index] 
		end
;	92		-	class 60
		;92: agb_array[*] = 0.061015 * (lorey_array^2.6032)
		92:	begin
			index = where(agb_array lt 75, count)
			if (count gt 0) then bgb_array[index] = 0.456 * agb_array[index] 
			index = where((agb_array ge 75) and (agb_array lt 150), count)
			if (count gt 0) then bgb_array[index] = 0.226 * agb_array[index] 
			index = where((agb_array ge 150), count)
			if (count gt 0) then bgb_array[index] = 0.241 * agb_array[index] 
		end
;	93		-	class 40 (nepal)
		93:	begin
;			agb_array[*] = 7.7413 * (lorey_array^1.3155)
			index = where(agb_array gt 600, count)
			if (count gt 0) then agb_array[index] = 600
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	94		-	class 70 (nepal)
;		94:	agb_array[*] = 0.69646 * (lorey_array^2.1062)
		94:	begin
			index = where(agb_array gt 450, count)
			if (count gt 0) then agb_array[index] = 450
			bgb_array[*] = 0.22149 * agb_array
		end
;	95		-	class 90
		95:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
;	96		-	class 100
		96:	begin
			bgb_array[*] = 0.20844 * agb_array
		end
;	97		-	class 110
		97:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	98		- class 120
		98:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	99		-	class 130
		99:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	100		-	class 160
		100:	begin
			;agb_array[*] = 1.05 * (0.61/0.6) * (0.2788 * (lorey_array^2.12))  ;temporary allometry to test Saatchi pantropic map
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	101		-	class 170
		101:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	102		-	class 180
		102:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	103		-	misclass
		103:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
; 104   - class 70 (rest of SEA)
		104:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
; 105 - terai lowland forests
		;use mixed equation from Guoqing China for now
		105:	begin
			index = where(agb_array lt 75, count)
			if (count gt 0) then bgb_array[index] = 0.456 * agb_array[index] 
			index = where((agb_array ge 75) and (agb_array lt 150), count)
			if (count gt 0) then bgb_array[index] = 0.226 * agb_array[index] 
			index = where((agb_array ge 150), count)
			if (count gt 0) then bgb_array[index] = 0.241 * agb_array[index] 
		end

;	Australia
;	110		-	class 40
		110:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	111		-	class 50
		111:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	112		-	class 60
		112:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	113		-	class 70
		113:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
;	114		-	class 90
		114:	begin
			bgb_array[*] = 0.22149 * agb_array
		end
;	115		-	class 100
		115:	begin
			bgb_array[*] = 0.20844 * agb_array
		end
;	116		-	class 110
		116:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	117		-	class 120
		117:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	118		-	class 130
		118:	begin
			bgb_array[*] = 0.322 * agb_array
		end
;	119		-	class 160
		119:	begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
;	120		-	class 170
		120:	begin
			bgb_array[*] = 0.20634 * agb_array
		end
;	121		-	class 180
		121:	begin
			bgb_array[*] = 0.20634 * agb_array
		end


;South America Ecozones
		201: begin
			;agb_array[*] = (1-0.01072) * 3.1721 * (lorey_array^1.3257) + 16.8 ; use SAM sapling
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		202: begin
			;agb_array[*] = (1-0.01072) * 3.1721 * (lorey_array^1.3257) + 16.8 ; use SAM sapling
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		203: begin
			;agb_array[*] = (1-0.01072) * 2.4673 * (lorey_array^1.4706) + 16.8 ; use SAM sapling
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		204: begin
			;agb_array[*] = (1-0.01072) * 0.23065 * (lorey_array^2.217) + 16.8 ; Use SAM sapling
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		205: begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		206: begin
			;agb_array[*] = (1-0.01072) * 0.2163 * (lorey_array^2.1835) + 16.8 ; Use SAM sapling
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		207: begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		208: begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		209: begin
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		210: begin
			;agb_array[*] = (1-0.01072) * 0.95843 * (lorey_array^1.8102) + 16.8
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		211: begin
			;agb_array[*] = (1-0.01072) * 0.00945 * (lorey_array^3.18566) + 16.8
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end
		212: begin
			;agb_array[*] = (1-0.01072) * 3.1721 * (lorey_array^1.3257) + 16.8
			index = where((agb_array lt 125), count, complement=index2, ncomplement=count2)
			if (count gt 0) then bgb_array[index] = 0.205 * agb_array[index]
			if (count2 gt 0) then bgb_array[index2] = 0.235 * agb_array[index2]
		end

 ;Mangrove
		241: begin
			bgb_array[*] = 0.4 * agb_array
		end

	else: bgb_array[*] = 0.05 * agb_array

	endcase

End	



PRO calcbgb, in_agb, in_type, bgb_array
	
	if (n_elements(in_agb) ne n_elements(in_type)) then begin
		print, 'Error!  Number of elements of in_lorey does not match in_type'
		exit
	endif

	arr_size = n_elements(in_agb)

  index = where((in_agb lt 0), count)
  if (count gt 0) then out_agb[index] = -1   ;temp fix for some water issues in 3.2sec images

	index = where((in_agb ne 0), count)

	if (count gt 0) then begin
		types = in_type[index]
		uniq_types = types[uniq(types,sort(types))]

		n_types = n_elements(uniq_types)

		for i=0, n_types-1 do begin
			index2 = where(in_type eq uniq_types[i], count_temp)
			bgb_temp = fltarr(count_temp)
			apply_value_bgb, in_agb[index2],uniq_types[i], bgb_temp
			bgb_array[index2] = bgb_temp
		endfor
	endif

End
