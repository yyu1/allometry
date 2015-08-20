Pro mod_lorey, in_lorey, index
  index1 = where(in_lorey[index] le 15, count1, complement=index2, ncomplement=count2)
  if (count1 gt 0) then begin
    in_lorey[index[index1]] = 3.21 * (in_lorey[index[index1]]^0.67)
  endif

  if (count2 gt 0) then begin
    in_lorey[index[index2]] = 3.7325 + 0.96 * in_lorey[index[index2]]
  endif

End
