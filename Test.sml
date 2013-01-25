fun assert_true (n:string, b:bool) =
    (n, b, "expected true but was false")

fun assert_false (n:string, b:bool) =
    (n, not(b), "expected false but was true")

fun assert_list (n:string, xs:int list, ys:int list) =
    let 
	fun lstToStr (xs:int list) =
	    if null xs
	    then ""
	    else (Int.toString(hd xs) ^ " ") ^ lstToStr(tl xs)
     in
	(n, xs = ys, "expected [ " ^ lstToStr(xs) ^ "] but was [ " ^ lstToStr(ys) ^ "]" )
    end

fun assert_string (n:string, s1:string, s2:string) =
    (n, s1 = s2, "expected " ^ s1 ^ " but was " ^ s2)

fun assert_int (n:string, i1:int, i2:int) = 
    (n, i1 = i2, "expected " ^ Int.toString(i1) ^ " but was " ^ Int.toString(i2))

fun run_tests (name:string, tests:(string*bool*string) list) =
    let	
	fun padString (s:string, tile:string, length:int) =
	    let
		fun str(s:string, length:int) = 
		    if length = 0
		    then ""
		    else s ^ str(s, length-1)	
	    in
		if size(s) > length
		then s
		else s ^ str(tile, length - size(s))
	    end

	fun run (ts:(string*bool*string) list) = 
	    if null ts
	    then "\n --- Completed : " ^ name ^ " --- \n\n"
	    else if #2 (hd ts)
	         then "\t" ^ padString((#1 (hd ts)), " ", 40) ^ " - Passed \n" ^ run(tl ts)
	         else "\t" ^ padString((#1 (hd ts)), " ", 40) ^ " - Failed : " ^ (#3 (hd ts)) ^ "\n\n"
    in
	print("\n --- Running Tests : " ^ name  ^ " --- \n\n");
	print(run(tests))
    end
