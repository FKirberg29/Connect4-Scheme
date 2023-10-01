(require 'regex)

(require 'list-lib)

;USE APPEND TO OUTPUT WITHOUT ()
;USE CONS/LIST TO OUTPUT INSIDE ()
;x=lst y=0

;GOOD TESTER/EXPLAINER FOR FOLD
; (define (strictly-increasing lst)
;     (cond 
;         ((null? lst) #t) 
;         ((null? (cdr lst)) #t)
;         (else (begin
;             (fold (lambda (x y) (begin (display "x: ")(display x) (display "y: ")(display y) (if (> x y) (* x 1) (list #f)))) 0 lst) ;x=lst y=0
            
;         ))
;     )
; )
; (display (strictly-increasing '(1 2 25)))


;SECOND LARGEST IN CLASS BY PROF (not complete, the fold is good? i think?)
; (define (second-largest lst)
;     (if (null? (cdr lst)) (car lst)
;         (begin
;         (define sta)
;         (fold (lambda (item partial)
;             (cond
;                 ((> item (car partial)) (list (item (car partial))))
;                 ((> item (car (cdr partial))) (list (car partial) item))
;                 (else partial)
;             )
;         ))
;         )
;     )
; )

; (define (my-filter lam lst)
;     (fold (lambda (x y) (if (not (equal? (lam x) #f)) (cons x y) y)) () (reverse lst))
; )
; (display (my-filter (lambda (item) (string-contains item "e")) '("George" "Michelle")))
; (display (my-filter (lambda (item) (> item 15)) '(17 15)))

(define (update-map key value map)
    (fold (lambda (x y) (if (equal? (car x) key) (cons (list key value) y) (cons x y))) () (reverse map))
)
(display (update-map 'Germany 'Berlin '((Germany Bonn) (France Paris) (Poland Warsaw))))
(display (update-map 'Poland 'Warsaw '((Germany Berlin) (France Paris) (Poland Krakow))))

; (define (string-join glue lst)
;     (if (null? (cdr lst))
;         (car lst)
;         (fold (lambda (x y) (string-append y (string-append glue x))) (car lst) (cdr lst))
;     )
; )
; (display (string-join ", " '("Arizona" "Nevada" "Mexico")))

; (define (all-unique lst)
;   (cond 
;     ((null? lst) #t) 
;     ((null? (cdr lst)) #t)
;     ((contains lst (car lst)) #f)
;     (else (all-unique (cdr lst)))
;    )
; )

; (define (contains lst x)
;   (if (not (null? (cdr lst)))
;     (if (equal? x (car (cdr lst)))
;       (#f)
;       (contains (cdr lst) x)
;     )
;   )
; )

; (all-unique '())

; (if (fold > 0 '(1 2 3)) (display "True") (display "False"))

; (define (strictly-increasing lst)
;     (cond 
;         ((null? lst) #t) 
;         ((null? (cdr lst)) #t)
;         (else (begin
;             (car (fold (lambda (x y) (if (and (> x (cdr y)) (equal? #t (car y))) (cons #t (* x 1)) (cons #f (* x 1)))) (cons #t 0) lst))
;         ))
;     )
; )
; (display (strictly-increasing '(1 15 25)))

; (define (check-every-pair check xs)
;   (or (null? xs)
;       (null? (cdr xs))
;       (and (check (car xs) (cadr xs))
;            (check-every-pair check (cdr xs)))))

; (display (check-every-pair < '(1 15 25)))


; (if (strictly-increasing '(1 15 25))
;     (display "True")
;     (display "False")
; )

; (define (split-list lst len)
;     (split-list-inner (reverse lst) len 0)
; )

; (define (split-list-inner lst len accum)
;     (cons
;         (fold (lambda (x y) (if (= len (length y)) () (begin (cons x y)))) () lst)
;         (list (accumulator (reverse lst) len accum))
;     )
; )

; (define (accumulator lst len n)
;     (if (= len n)
;         (reverse (fold (lambda (x y) (cons x y)) () lst))
;         (accumulator (cdr lst) len (+ n 1))
;     )
; )

; (display (split-list '(a b c d e f g) 7))

; (define (select-multiples value lst)
;   (reverse (fold (lambda (x y) (if (zero? (mod x value)) (cons x y) ())) value (cons 1 lst))) ;the (cons 1 lst) adds a necessary buffer
; )

; (display (select-multiples 5 '(1 15 25)))

; (define (every-other lst)         ;Staring with 1st val
;   (cond 
;     ((null? lst) '()) 
;     ((null? (cdr lst)) lst)
;     (else (cons (car lst) (every-other (cdr (cdr lst)))))
;   )
; )

; (display (every-other '(a b c d)))

; (define (foldl func val lst)
;   (if (null? lst)
;     (list val)
;     (foldl func (func val (car lst)) (cdr lst))
;   )
; )


; (define (second-largest lst)
;   (if (= (length lst) 1)
;   (car lst)
;   (cdr (fold (lambda (x accum)
;     (cond ((> x (car accum)) (cons x (car accum)))
;       ((= x (car accum)) (cons x (cdr accum)))
;       ((> x (cdr accum)) (cons (car accum) x))
;       (else (cons (car accum) (cdr accum)))))
;       ; (display "x:")
;       ; (display x)
;       ; (newline)
;       ; (display "acumm:")
;       ; (display accum))
;     (cons -inf.0 -inf.0)
;     lst))
;   )
; )

; (display (second-largest '(1 2 3 4)))

; (display (foldl + 1 '(1 2 3 4)))


; (define (merge-sort mlst)
;   (cond
;     ((or (null? mlst)
;          (null? (cdr mlst)))
;            mlst)
;     (else
;     (merge (merge-sort (first-half mlst (quotient (length mlst) 2))) (merge-sort (second-half (cons 'A mlst) (quotient (length mlst) 2))))
;     )
;   )
; )

; (define (merge lst1 lst2)
;   (cond
;     ((null? lst1) lst2)
;     ((null? lst2) lst1)
;     (else
;       (if (< (car lst1) (car lst2))
;         (cons (car lst1) (merge (cdr lst1) lst2))
;         (cons (car lst2) (merge lst1 (cdr lst2)))
;       )
;     )
;   )
; )

; (display (merge-sort '(3 9 4)))



; (define (split-list lst n)
;   (list (first-half lst n) (second-half (cons 'A lst) n))
; )

; (define (first-half lst n)
;   (if (= n 0)
;     ()
;     (cons (car lst) (first-half (cdr lst) (- n 1)))
;   )
; )

; (define (second-half lst n)
;   (if (= n 0)
;     (cdr lst)
;     (second-half (cdr lst) (- n 1)))
; )

; ; cons '() (list lst)
; (display (split-list '(a b c d e f g) 3))
(newline)

; (define (int-to-char i)
;   (integer->char (+ i 65))
; )

; (define (string-to-int s)
;   (- (char->integer (string-ref s 0)) 65)
; )

; (define (char-to-int c)
;   (char->integer (- c 65))
; )

; ;Helper function to get the remaining list at the n index in a list.
; (define (get n lst)
;    (if (= n 0) (cdr lst) (get (- n 1) (cdr lst)))
; )

; ;Helper function to get the element at the n index in a list.
; (define (gettwo n lst)
;    (if (= n 0) (car lst) (gettwo (- n 1) (cdr lst)))
; )

; ;Helper function to replace an element in a list at index n.
; (define (replace val n lst)
;   (if (= n 0)
;     (cons val (cdr lst))
;     (cons (car lst) (replace val (- n 1) (cdr lst)))
;   )
; )

; ;Modified function to replace an element in a list at index n.
; (define (replace-element val n lst)
;   (if (null? lst)
;     lst
;     (cons
;       (if (zero? n)
;         val
;         (car lst))
;       (replace-element val (- n 1) (cdr lst))))
; )

;Helper modulo function.
; (define (mod a b)
;   (if (< a b)
;       a
;       (mod (- a b) b)))

; ; Parse the size parameter, which should look something like 5x7
; (define (parse-size size)
;   ; the regex-match will generate a list of three elements:
;   ; * The entire string
;   ; * The first parens
;   ; * The second parens
;   ; The call to cdr removes the first item from the list.
;   (define result (cdr (regex-match  #/(\d+)x(\d+)/ size)))

;   ; If the pattern doesn't match, print a message and quit.
;   (cond
;     ((not result) (display (format "\"~A\" is not a valid board size" size)) (exit))
;     (else (map (lambda (x) (string->number x)) result))
;   )
; )

; ; Parse the win_length parameter, which should be an integer.
; (define (parse-win-length win_length)
;  (define result (regex-match #/\d+/ win_length))
;  (cond 
;   ((not result) (display (format "\"~A\" is not a valid win length" win_length)) (exit))
;   (else (string->number win_length))
;  )
; )

; (define (play-connect-4 num_rows num_columns win_length)
;     ; TODO:  Load the .scm file containing your connect 4 code 
;     ; Then launch a connect4 game.
;     ;(include-relative "connect4_engine.scm")

;     ;Main function to run the connect4 game.
;     (set_up num_rows num_columns win_length)
; )

; (define num_args (vector-length command-line-arguments))
; (cond 
;   ((= 0 num_args) (play-connect-4 6 7 4))  ; play a default 6x7 game of Connect 4.
;   ((= 1 num_args) (apply play-connect-4 (append (parse-size (vector-ref command-line-arguments 0)) (list 4))))
;   (else (apply play-connect-4 (append (parse-size (vector-ref command-line-arguments 0)) (list (parse-win-length (vector-ref command-line-arguments 1))))))
; )

; ;Main function that runs the connect4 game
; (define (set_up num_rows num_columns win_length)

;   ;Create and display initial board.
;   (define board (make_board 0 (* num_rows num_columns)))
;   (display (board_display 0 board num_columns 1))
;   (display (lettering 0 (- num_columns 1)))

;   ;Sets up board list & sets all values to 0.
;   (define (make_board i n)
;     (if (= i (- n 1))
;       (list 0)
;       (cons 0 (make_board (+ i 1) n))
;     )
;   )

;   ;Prints A, B, C, (etc) based on board size.
;   (define (lettering i n)
;     (if (= i n)
;       (list (int-to-char i))
;       (cons (int-to-char i) (lettering (+ i 1) n))
;     )
;   )

;   ;Prints out the board list in a rowsxcolumns format.
;   (define (board_display i x cols n)
;     (if (not (null? x))
;         (begin
;             (display (row_display i x cols))
;             (newline)
;             (board_display 0 (get (- (* cols n) 1) x) cols n)))
;   )

;   ;Helper function for board_display to populate and print each row.
;   (define (row_display i x cols)
;     (if (= i cols)
;       ()
;       (cons (car x) (row_display (+ i 1) (cdr x) cols))
;     )
;   )

;   ;Helper function that replaces places a player's token in the bottom most empty slot, in the column of the player's choice.
;   (define (make_move board player col_choice rows cols)
;     (if (= 0 (gettwo (+ col_choice (* cols (- rows 1))) board))
;       (replace-element player (+ col_choice (* cols (- rows 1))) board)
;       (make_move board player col_choice (- rows 1) cols)
;     )
;   )

;   ;Gameplay and input loop.
;   (define (turn player board num_rows num_columns)

;     ;Player 1 loop.
;     (if (= player 1)
;       (begin
;         ;Asks for user input and parses to an integer.
;         (display "\nPlayer 1, please enter a column: ")
;         (define user_input(read-line))
;         ;Parse to integer. If input is lowercase parse to uppercase integer value.
;         (define input(if (>= (string-to-int user_input) 32)
;                     (- (string-to-int user_input) 32)
;                     (string-to-int user_input)
;                   )
;         )
;         (cond 
;             ;If input is Q, quit.
;             ((= input 16) (begin (display "Goodbye.\n") (exit)))
;             ;If input is invalid, repeat input request.
;             ((or (< input 0)(>= input (+ 0 num_columns))) (begin (display "Invalid input, please try again: ") (turn player board num_rows num_columns)))
;             ;If column is full, repeat input request.
;             ((not (= (gettwo input board) 0)) (begin (display "This column is full, please select another: ") (turn player board num_rows num_columns)))
;               ;If input is valid, create new board with added token, display it, check for a win, and pass turn to next player.
;               (else (begin
;                       (display (board_display 0 (make_move board 1 input num_rows num_columns) num_columns 1))
;                       (display (lettering 0 (- num_columns 1)))
;                       (x_in_a_row 1 (* num_rows num_columns) (make_move board 1 input num_rows num_columns) num_rows num_columns win_length)
;                       (turn 2 (make_move board 1 input num_rows num_columns) num_rows num_columns)
;                     )
;               )
;         )
;       )
;     )
;     ()

;     ;Player 2 loop.
;     (if (= player 2)
;       (begin
;         ;Asks for user input and parses to an integer.
;         (display "\nPlayer 2, please enter a column: ")
;         (define user_input (read-line))
;         ;Parse to integer. If input is lowercase parse to uppercase integer value.
;         (define input(if (>= (string-to-int user_input) 32)
;                     (- (string-to-int user_input) 32)
;                     (string-to-int user_input)
;                   )
;         )
;         (cond 
;             ;If input is Q, quit.
;             ((= input 16) (begin (display "Goodbye.\n") (exit)))
;             ;If input is invalid, repeat input request.
;             ((or (< input 0)(> input (+ 0 num_columns))) (begin (display "Invalid input, please try again: ") (turn player board num_rows num_columns)))
;             ;If column is full, repeat input request.
;             ((not (= (gettwo input board) 0)) (begin (display "This column is full, please select another: ") (turn player board num_rows num_columns)))
;             (else (begin
;                       ;If input is valid, create new board with added token, display it, check for a win, and pass turn to next player.
;                       (display (board_display 0 (make_move board 2 input num_rows num_columns) num_columns 1))
;                       (display (lettering 0 (- num_columns 1)))
;                       (x_in_a_row 2 (* num_rows num_columns) (make_move board 2 input num_rows num_columns) num_rows num_columns win_length)
;                       (turn 1 (make_move board 2 input num_rows num_columns) num_rows num_columns)
;                     )
;               )
;         )
;       )
;     )
;     ()
;   )

;   ;Function to determine if there are x tokens in a row equal to the win length.
;   (define (x_in_a_row token length board rows cols win_length)

;     ;Step through every index of the board and run horizontal, vertical, and both diagonal line win checks.
;     (define (step-through-board i n token board rows cols win_length)
;       (if (= i n)
;           ()
;           (begin
;               (up-right-check token (* rows cols) board rows cols 0 i win_length)
;               (down-right-check token (* rows cols) board rows cols 0 i win_length)
;               (horizontal-check token (* rows cols) board rows cols 0 i win_length)
;               (vertical-check token (* rows cols) board rows cols 0 i win_length)
;               (step-through-board (+ i 1) (* rows cols) token board rows cols win_length))
;       )
;     )

;     ;Up Right Diagonal Check
;     (define (up-right-check token length board rows cols counter index win_length)
      
;       (if (= (gettwo index board) token)
;         (begin 
;           (if (= counter (- win_length 1))
;             (begin (display "\nWe have a Winner!  Congratulations, Player ") (display token) (display ". You win.\n") (exit))
;           )
;           (if (>= (+ (- index cols) 1) 0)
;               (begin
;                 (up-right-check token (* rows cols) board rows cols (+ counter 1) (+ (- index cols) 1) win_length)
;               )
;           )
;         )
;         (if (>= (+ (- index cols) 1) 0)
;           (up-right-check token (* rows cols) board rows cols 0 (+ (- index cols) 1) win_length)
;         )
;       )
;     )

;     ;Down Right Diagonal Check
;     (define (down-right-check token length board rows cols counter index win_length)
      
;       (if (= (gettwo index board) token)
;         (begin 
;           (if (= counter (- win_length 1))
;             (begin (display "\nWe have a Winner!  Congratulations, Player ") (display token) (display ". You win.\n") (exit))
;           )
;           (if (<= (+ (+ index cols) 1) (- (* rows cols) 1))
;               (begin
;                 (down-right-check token (* rows cols) board rows cols (+ counter 1) (+ (+ index cols) 1) win_length)
;               )
;           )
;         )
;         (if (<= (+ (+ index cols) 1) (- (* rows cols) 1))
;           (down-right-check token (* rows cols) board rows cols 0 (+ (+ index cols) 1) win_length)
;         )
;       )
;     )

;     ;Horizontal Right Check
;     (define (horizontal-check token length board rows cols counter index win_length)
;       (if (= counter win_length)
;         (begin (display "\nWe have a Winner!  Congratulations, Player ") (display token) (display ". You win.\n") (exit))
;       )

;       (if (<= (+ index 1) (* rows cols))
;         (if (= (gettwo index board) token)
;             (begin
;               (if (and (= (mod index cols) 0) (not (= counter 0)))
;                 (horizontal-check token (* rows cols) board rows cols 0 index win_length)
;                 (horizontal-check token (* rows cols) board rows cols (+ counter 1) (+ index 1) win_length)
;               )
;             )
;             (horizontal-check token (* rows cols) board rows cols 0 (+ index 1) win_length)
;         )
;       )
;     )

;     ;Vertical Down Check
;     (define (vertical-check token length board rows cols counter index win_length)
      
;       (if (= (gettwo index board) token)
;         (begin 
;           (if (= counter (- win_length 1))
;             (begin (display "\nWe have a Winner!  Congratulations, Player ") (display token) (display ". You win.\n") (exit))
;           )
;           (if (<= (+ index cols) (- (* rows cols) 1))
;               (begin
;                 (vertical-check token (* rows cols) board rows cols (+ counter 1) (+ index cols) win_length)
;               )
;           )
;         )
;         (if (<= (+ index cols) (- (* rows cols) 1))
;           (vertical-check token (* rows cols) board rows cols 0 (+ index cols) win_length)
;         )
;       )
;     )

;     ;Begin stepping through the board to check for a win.
;     (step-through-board 0 (* rows cols) token board rows cols win_length)
;   )

;   (newline)
;   ;Begin the first player turn.
;   (turn 1 board num_rows num_columns)
; )