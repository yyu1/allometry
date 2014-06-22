;Inputs arrays of hlorey and associated class type array and returns AGB arrays.



;in_type definitions, should be type byte. 3 digit number

;------------------------------
;  value					type
;	0							ignore

;	North America
;	10    -	class 40
;	11		-	class 50, 60
;	13		- class 70, 90 east
;	14		- class 70, 90 west
;	15		- class 100
;	16		- class 110, 120, 130
;	17		- class 160
;	18		- class 170
;	19		- mexico tropical dry broadleaf
;	20		- mexico tropical conifer

;	South America
;	30		-	class 40
;	31		- class 50, 60
;	32		- class 100
;	33		- class 110, 120, 130
;	35		- class 160
;	36		-	class 170


;	Eurasia
;	50		-	class 50, 60, 100 east
;	51		- class 50, 60 west
;	52		-	class 70, 90 west (Norway)
;	53		- class 70, 90 east (Russia)
;	54		- class 110, 120, 130   (Pedro Rodriguez-Veiga)
;	55		- class 160
;	56		-	class 170
;	57		-	class 180


;	Africa
;	70		-	class 40
;	71		-	class 50
;	72		-	class 60
;	73		- class 70
;	74		- class	90
;	75		-	class 100
;	76		- class 110
;	77		-	class 120
;	78		-	class 130
;	79		-	class 160
;	80		-	class 170
;	81		-	class 180
;	82		-	misclass

;	Southeast Asia
;	90		-	class 40 (tropical rain forest)
;	91		-	class 50
;	92		-	class 60
;	93		-	class 40, 70 (nepal)
;	94		-	class 90
;	95		-	class 100
;	96		-	class 110
;	97		- class 120
;	98		-	class 130
;	99		-	class 160
;	100		-	class 170
;	101		-	class 180
;	102		-	misclass

;	Australia
;	110		-	class 40
;	111		-	class 50
;	112		-	class 60
;	113		-	class 70
;	114		-	class 90
;	115		-	class 100
;	116		-	class 110
;	117		-	class 120
;	118		-	class 130
;	119		-	class 160
;	120		-	class 170
;	121		-	class 180


;------------------------------

;

Function lorey2agb, in_lorey, in_type
	
	if (n_elements(in_lorey) ne n_elements(in_type)) then begin
		print, 'Error!  Number of elements of in_lorey does not match in_type'
		exit
	endif


End
