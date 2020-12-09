open! Base
open! Stdio
open Aoc
open Utils

let () =
  let args = Sys.get_argv () in
  let day = args.(1) in
  let input_file = Printf.sprintf "inputs/%s.in" day in
  if not @@ Caml.Sys.file_exists input_file then
    download_input day input_file ;
  let file = In_channel.create input_file in
  let inputs = In_channel.input_all file in
  let (module Day : Day.S) =
    match day with
    | "1" -> (module Day1)
    | "2" -> (module Day2)
    | "3" -> (module Day3)
    | "4" -> (module Day4)
    | "5" -> (module Day5)
    | "6" -> (module Day6)
    | "7" -> (module Day7)
    | "8" -> (module Day8)
    | "9" -> (module Day9)
    | _ -> failwith "invalid day"
  in
  Day.run inputs ; In_channel.close file
