let () =
    let file = "bin/inputs/day1_1.txt" in
    let first_in = open_in file in
    try
        let first_basement_character = ref 0 in
        let floor = ref 0 in
        let line = input_line first_in in
        String.iteri (fun i c ->
            match c with
            | '(' -> floor := !floor + 1
            | ')' -> begin
                floor := !floor - 1;
                if !first_basement_character == 0 && !floor < 0 then first_basement_character := i + 1;
            end
            | _ -> ();
        ) line;
        Printf.printf "Santa should go do floor %d and the first time he was in the basement was on char %d\n" !floor !first_basement_character
    with e ->
        raise e
