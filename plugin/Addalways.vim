command Alpp :call AddAlways("posedge", "posedge")
command Alpn :call AddAlways("posedge", "negedge")
command Alnp :call AddAlways("negedge", "posedge")
command Alnn :call AddAlways("negedge", "negedge")
command Alp :call AddAlways("posedge", "")
command Aln :call AddAlways("negedge", "")
command Al :call AddAlways("", "")

if exists("b:verilog_indent_width")
   let b:vlog_ind = b:verilog_indent_width
else
   let b:vlog_ind = 4
endif
"===============================================================
"        Add an always statement
"===============================================================
function AddAlways(clk_edge, rst_edge)
   for line in getline(1, line("$"))
      if line =~ '^\s*\<input\>.*//\s*\<clock\>\s*$'
         let line = substitute(line, '^\s*\<input\>\s*', "", "")
         let line = substitute(line, '^\s*\<wire\>\s*', "", "")
         let clk = substitute(line, '\s*\(;\|,\).*$', "", "")
      elseif line =~ '^\s*\<input\>.*//\s*\<reset\>\s*$'
         let line = substitute(line, '^\s*\<\input\>\s*', "", "")
         let line = substitute(line, '^\s*\<wire\>\s*', "", "")
         let rst = substitute(line, '\s*\(;\|,\).*$', "", "")
      endif
   endfor
   let curr_line = line(".")
   if a:clk_edge == "posedge" && a:rst_edge == "posedge"
      call append(curr_line,   "always @(posedge ".clk." or posedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "negedge" && a:rst_edge == "posedge"
      call append(curr_line,   "always @(negedge ".clk." or posedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "posedge" && a:rst_edge == "negedge"
      call append(curr_line,   "always @(posedge ".clk." or negedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (!".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "negedge" && a:rst_edge == "negedge"
      call append(curr_line,   "always @(negedge ".clk." or negedge ".rst.") begin")
      call append(curr_line+1, repeat(" ", b:vlog_ind)."if (!".rst.") begin")
      call append(curr_line+2, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+3, repeat(" ", b:vlog_ind)."else begin")
      call append(curr_line+4, repeat(" ", b:vlog_ind)."end")
      call append(curr_line+5, "end")
   elseif a:clk_edge == "posedge" && a:rst_edge == ""
      call append(curr_line,   "always @(posedge ".clk.") begin")
      call append(curr_line+1, "end")
   elseif a:clk_edge == "negedge" && a:rst_edge == ""
      call append(curr_line,   "always @(negedge ".clk.") begin")
      call append(curr_line+1, "end")
   else
      call append(curr_line,   "always @(*) begin")
      call append(curr_line+1, "end")
   endif
endfunction

